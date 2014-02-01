function usb2dynamixel_communication(block)
setup(block);

end

function setup(block)

% Register original number of ports based on settings in Mask Dialog
values = get_param(block.BlockHandle,'MaskValues');

% see mask properties
% values{1} = COMPort
% values{2} = BaudRate
% values{3} = SampleTime
% values{4} = Frame
% values{5} = ReadIndex
% values{6} = WriteIndex

block.NumInputPorts = size(eval(values{6}),1);
block.NumOutputPorts = size(eval(values{5}),1);

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Override input port properties
for i = 1:block.NumInputPorts
    block.InputPort(i).DatatypeID  = 0;  % double
    block.InputPort(i).Complexity  = 'Real';
    block.InputPort(i).SamplingMode = 'Sample'; % sample based
    block.InputPort(i).SampleTime = [-1 0];
    block.InputPort(i).DirectFeedthrough = false;
end

% Override output port properties
for i = 1:block.NumOutputPorts
    block.OutputPort(i).DatatypeID  = 0; % double
    block.OutputPort(i).Complexity  = 'Real';
    block.OutputPort(i).SamplingMode = 'Sample'; % sample based
    block.OutputPort(i).SampleTime = [eval(values{3}) 0];
end

block.NumDialogPrms     = 6;
block.DialogPrmsTunable = {'Nontunable','Nontunable','Nontunable','Nontunable','Nontunable','Nontunable'};

% No parallel queries
block.SupportsMultipleExecInstances(false);

% Specify if Accelerator should use TLC or call back into
% M-file
block.SetAccelRunOnTLC(false);

block.RegBlockMethod('CheckParameters',          @CheckPrms);
block.RegBlockMethod('ProcessParameters',        @ProcessPrms);
block.RegBlockMethod('Start',                    @Start);
block.RegBlockMethod('PostPropagationSetup',     @DoPostPropagationSetup);
block.RegBlockMethod('SetInputPortSampleTime',   @SetInputPortSampleTime);
block.RegBlockMethod('SetOutputPortSampleTime',  @SetOutputPortSampleTime);
block.RegBlockMethod('SetInputPortSamplingMode', @SetInputPortSamplingMode);
block.RegBlockMethod('Outputs',                  @Outputs);
block.RegBlockMethod('Terminate',                @Terminate);
block.RegBlockMethod('WriteRTW',                 @WriteRTW);

end

function CheckPrms(block)

COMPort = block.DialogPrm(1).Data;
BaudRate  = block.DialogPrm(2).Data;
SampleTime   = block.DialogPrm(3).Data;
Frame   = block.DialogPrm(4).Data;
ReadIndex   = block.DialogPrm(5).Data;
WriteIndex   = block.DialogPrm(6).Data;

if ~isreal(COMPort) || ~ischar(COMPort) || (length(COMPort) <= 1)
    error('invalid COM port, it should be a string (eg. ''COM11'')');
end

if ~isreal(BaudRate) || ~isfloat(BaudRate) || (length(BaudRate) ~= 1)
    error('invalid baud rate, it should be a floating point scalar');
end

if ~isreal(SampleTime) || ~isfloat(SampleTime) || (length(SampleTime) ~= 1)
    error('invalid sample time, it should be a floating point scalar');
end

if ~isempty(Frame)
    if ~isreal(Frame) || ~isfloat(Frame)
        error('invalid frame, it should be a floating point vector');
    end
end

if ~isempty(ReadIndex)
    if ~isreal(ReadIndex) || ~isfloat(ReadIndex) || (size(ReadIndex,2) ~= 2)
        error('invalid read index, it should be a floating point matrix');
    end
end

if ~isempty(WriteIndex)
    if ~isreal(WriteIndex) || ~isfloat(WriteIndex) || (size(WriteIndex,2) ~= 2)
        error('invalid read index, it should be a floating point matrix');
    end
end

end

function ProcessPrms(block)

%% Update run time parameters
block.AutoUpdateRuntimePrms;

end

function DoPostPropagationSetup(block)

% Register all tunable parameters as runtime parameters.
block.AutoRegRuntimePrms;

% 1 internal state for holding tcp/udp object
block.NumDWorks = 1;
% 1 = COM port object
block.Dwork(1).Usage = 'DState';
block.Dwork(1).UsedAsDiscState = true;
block.Dwork(1).Dimensions = 1;
block.Dwork(1).DatatypeID = 0; % double
block.Dwork(1).Complexity = 'real';
block.Dwork(1).Name = 'ComObj';

end

function Start(block)

if strcmp(get_param(gcs,'RTWCGKeepContext'),'on')
    disp('### Detecting a RTW build');
    error('USB2Dynamixel component does not support RTW builds');
end

COMPort = block.DialogPrm(1).Data;
BaudRate  = block.DialogPrm(2).Data;
SampleTime   = block.DialogPrm(3).Data;
%Frame   = block.DialogPrm(4).Data;
%ReadIndex   = block.DialogPrm(5).Data;
%WriteIndex   = block.DialogPrm(6).Data;

%InputBufferSize = max(sum(ReadIndex,2)) - 1;

ComObj = serial(COMPort);
ComObj.BaudRate = BaudRate;
ComObj.DataBits = 8;
ComObj.Parity = 'none';
ComObj.StopBits = 1;
ComObj.Timeout = SampleTime;

try
    fopen(ComObj);
catch
    error('USB2Dynamixel communication error: failed to open the COM Port');
end

global ComObjects;
if isempty(ComObjects)
    ComObjects = [ComObj]; %#ok
    block.Dwork(1).Data = 1;
else
    for i = 1:length(ComObjects)
        if strcmp(ComObjects(i).Status,'closed')
            ComObjects(i) = ComObj;
            block.Dwork(1).Data = i;
            return;
        end
    end
    ComObjects = [ComObjects ComObj];
    block.Dwork(1).Data = length(ComObjects);
end

end

function SetInputPortSamplingMode(block, idx, mode)
block.InputPort(idx).SamplingMode = mode;

for i = 1:block.NumOutputPorts
    block.OutputPort(i).SamplingMode = 'Sample';
end

end

function SetInputPortSampleTime(block, idx, time)

%fprintf('in %d: %d,%d\n',idx,time(1),time(2));
block.InputPort(idx).SampleTime = time;

end

function SetOutputPortSampleTime(block, idx, time)

%fprintf('out %d: %d,%d\n',idx,time(1),time(2));
block.InputPort(idx).SampleTime = time;

end

function Outputs(block)

Frame = block.DialogPrm(4).Data;
ReadIndex = block.DialogPrm(5).Data;
WriteIndex = block.DialogPrm(6).Data;

global ComObjects;
ComObj = ComObjects(block.Dwork(1).Data);

for i=1:size(WriteIndex,1)
    if WriteIndex(i,2) == 1
        val = uint8(block.InputPort(i).Data);
        Frame(WriteIndex(i,1)) = val;
    else
        j = WriteIndex(i,1);
        val = uint16(block.InputPort(i).Data);
        Frame(j) = bitand(val,255);
        Frame(j + 1) = bitand(val,65280) / 256;
    end
end

Data = [];

try
    i = 1;
    while i < length(Frame)
        if Frame(i) == 2
            % read frame
            n = Frame(i+3);
            WriteFrame = [255 255 Frame(i+1) 4 2 Frame(i+2) n 0];
            WriteFrame(end) = bitxor(bitand(sum(WriteFrame(3:end)),255),255);
            fwrite(ComObj,uint8(WriteFrame));
            ReadFrame = fread(ComObj,6+n,'uint8');
            Data = [Data ReadFrame(6:(end-1))]; %#ok
            i = i+4;
        else
            % write frame
            n = Frame(i+3);
            WriteFrame = [255 255 Frame(i+1) (3+n) 3 Frame(i+2) Frame((i+4):(i+3+n)) 0];
            WriteFrame(end) = bitxor(bitand(sum(WriteFrame(3:end)),255),255);
            fwrite(ComObj,uint8(WriteFrame));
            ReadFrame = fread(ComObj,6); %#ok
            i = i+4+n;
        end
    end
catch
    error('USB2Dynamixel communication error: write/read failure');
end

for i=1:size(ReadIndex,1)
    if ReadIndex(i,2) == 1
        block.OutputPort(i).Data = double(Data(ReadIndex(i,1)));
    else
        j = ReadIndex(i,1);
        block.OutputPort(i).Data = double(Data(j)) + 256*double(Data(j + 1));
    end
end

ComObjects(block.Dwork(1).Data) = ComObj;

end

function Terminate(block)
    global ComObjects;
    if block.Dwork(1).Data > 0
        ComObj = ComObjects(block.Dwork(1).Data);
        try
            fclose(ComObj);
        catch
            error('USB2Dynamixel communication error: failed to close the communication');
        end
        ComObjects(block.Dwork(1).Data) = ComObj;
    end
end

function WriteRTW(~)

error('USB2Dynamixel component does not support RTW builds');

end
