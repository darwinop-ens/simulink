function darwinop_realtime(block)

setup(block);

end

function setup(block)


% see mask properties
%values = get_param(block.BlockHandle,'MaskValues');
% values{1} = TimeScaleFactor

block.NumInputPorts = 0;
block.NumOutputPorts = 0;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

block.NumDialogPrms     = 1;
block.DialogPrmsTunable = {'Nontunable'};

% No parallel queries
block.SupportsMultipleExecInstances(false);

% Specify if Accelerator should use TLC or call back into
% M-file
block.SetAccelRunOnTLC(false);

block.RegBlockMethod('CheckParameters',          @CheckPrms);
block.RegBlockMethod('ProcessParameters',        @ProcessPrms);
block.RegBlockMethod('Start',                    @Start);
block.RegBlockMethod('PostPropagationSetup',     @DoPostPropagationSetup);
block.RegBlockMethod('Outputs',                  @Outputs);
block.RegBlockMethod('Terminate',                @Terminate);
block.RegBlockMethod('WriteRTW',                 @WriteRTW);

end

function CheckPrms(block)

TimeScaleFactor = block.DialogPrm(1).Data;

if ~isreal(TimeScaleFactor) || ~isfloat(TimeScaleFactor) || (length(TimeScaleFactor) ~= 1)
    error('invalid time scale factor, it should be a floating point scalar');
end

if (TimeScaleFactor <= 0)
    error('invalid time scale factor, value should be a strictly positive number');
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
block.NumDWorks = 2;
block.Dwork(1).Usage = 'DState';
block.Dwork(1).UsedAsDiscState = true;
block.Dwork(1).Dimensions = 1;
block.Dwork(1).DatatypeID = 7; % uint32
block.Dwork(1).Complexity = 'real';
block.Dwork(1).Name = 'TicH';
block.Dwork(2).Usage = 'DState';
block.Dwork(2).UsedAsDiscState = true;
block.Dwork(2).Dimensions = 1;
block.Dwork(2).DatatypeID = 7; % uint32
block.Dwork(2).Complexity = 'real';
block.Dwork(2).Name = 'TicL';

end

function Start(block)

if strcmp(get_param(gcs,'RTWCGKeepContext'),'on')
    % RTW build
    return;
end

ticid = tic;
block.Dwork(1).Data = uint32(bitshift(ticid,-32));
block.Dwork(2).Data = uint32(bitand(ticid,4294967295));

end

function Outputs(block)

tich = uint64(block.Dwork(1).Data);
ticl = uint64(block.Dwork(2).Data);
ticid = bitor(bitshift(tich,32),ticl);

TimeScalingFactor = block.DialogPrm(1).Data;
WaitUntil = block.CurrentTime * TimeScalingFactor;

while (WaitUntil >= toc(ticid))
    % delay loop
end

end

function Terminate(block)

block.Dwork(1).Data = uint32(0);
block.Dwork(2).Data = uint32(0);

end

function WriteRTW(block) %#ok

% nothing to do

end
