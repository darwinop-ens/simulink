function varargout = usb2dynamixel_communication_setup(varargin)

[varargout{1:nargout}] = feval(varargin{:});

end

function OpenFcn %#ok
% the block is double-clicked in simulink window

hBlk = gcbh;
% find existing figures, if any
f = FindFigure(hBlk);
if isempty(f)
    % figure does not exist yet, create a new one
    CreateFigure(hBlk);
else
    % this figure is already for this block, bring it to front,
    % eventually reflecting changes in block name
    SetFigureName(f);
    figure(f);
end

end

function DeleteFcn %#ok
% the block is deleted
hBlk = gcbh;
% find existing figures, if any
f = FindFigure(hBlk);
if ~isempty(f)
    close(f);
end

end

function NameChangeFcn %#ok
% the block name is changed

hBlk = gcbh;
% find existing figures, if any
f = FindFigure(hBlk);
if ~isempty(f)
    SetFigureName(f);
end

end

function StartFcn %#ok
% the simulation is started
end

function StopFcn %#ok
% the simulation is stopped
end

function CopyFcn %#ok
% the block is copied
% all data copies are automaticaly done
end

function ModelCloseFcn %#ok
% the model is closed

hBlk = gcbh;
% find existing figures, if any
f = FindFigure(hBlk);
if ~isempty(f)
    close(f);
end

end

function f = FindFigure(hBlk)

figures = findall(0,'Tag','usb2dynamixel_communication_setup');
for i = 1:length(figures)
    data = guidata(figures(i));
    if isfield(data,'simulink_block') && (data.simulink_block == hBlk)
        f = figures(i);
        return;
    end
end
f=[];

end

function CreateFigure(hBlk)

% compute coordinates to place the window on screen center
s = get( 0, 'ScreenSize' );
w = 800;
h = 485;
l = s(1) + (s(3) - w)/2;
b = s(2) + (s(4) - h)/2;

f = figure('MenuBar','none', ...
           'Toolbar','none', ...
           'Resize','off', ...
           'NumberTitle','off', ...
           'Units','pixels', ...
           'Position',[l,b,w,h], ...
           'Tag','usb2dynamixel_communication_setup');

data = guidata(f);

data.simulink_block = hBlk;

data.consts = darwinop_consts;

data.read_text = uicontrol(f,'Style','text', ...
                             'String',data.consts.labels.label_read, ...
                             'HorizontalAlignment','left', ...
                             'Units','pixels', ...
                             'Position',[520,215,270,14]);
data.read_listbox = uicontrol(f,'Style','listbox', ...
                                ...'String',read_item_list, ...
                                ...'Max',length(read_item_list), ...
                                'BackgroundColor','white', ...
                                'Units','pixels', ...
                                'Position',[520,10,270,205]);

data.write_text = uicontrol(f,'Style','text', ...
                              'String',data.consts.labels.label_write, ...
                              'HorizontalAlignment','left', ...
                              'Units','pixels', ...
                              'Position',[520,435,270,14]);
data.write_listbox = uicontrol(f,'Style','listbox', ...
                                 ...'String',write_item_list, ...
                                 ...'Max',length(write_item_list), ...
                                 'BackgroundColor','white', ...
                                 'Units','pixels', ...
                                 'Position',[520,230,270,205]);

data.background_color = get(data.read_text,'BackgroundColor');
data.write_color = 'red';
data.read_color = 'green';
data.read_write_color = 'yellow';

set(f,'Color',data.background_color);

data.axes = axes('units','pixels', ...
                 'position',[10,10,306,169]);
data.image = imread('usb2dynamixel.jpg');
imshow(data.image,'Parent',data.axes);

data.read_write_button = uicontrol(f,'Style','pushbutton', ...
                                     'String','', ...
                                     'Enable','off', ...
                                     'BackgroundColor',data.read_write_color, ...
                                     'Units','pixels', ...
                                     'Position',[206,230,20,20]);
data.read_write_text = uicontrol(f,'Style','text', ...
                                   'String',data.consts.labels.label_read_write_joint, ...
                                   'HorizontalAlignment','left', ...
                                   'Units','pixels', ...
                                   'Position',[236,233,80,14]);
data.write_button = uicontrol(f,'Style','pushbutton', ...
                                'String','', ...
                                'Enable','off', ...
                                'BackgroundColor',data.write_color, ...
                                'Units','pixels', ...
                                'Position',[206,260,20,20]);
data.write_text = uicontrol(f,'Style','text', ...
                              'String',data.consts.labels.label_write_joint, ...
                              'HorizontalAlignment','left', ...
                              'Units','pixels', ...
                              'Position',[236,263,80,14]);
data.read_button = uicontrol(f,'Style','pushbutton', ...
                               'String','', ...
                               'Enable','off', ...
                               'BackgroundColor',data.read_color, ...
                               'Units','pixels', ...
                               'Position',[206,290,20,20]);
data.read_text = uicontrol(f,'Style','text', ...
                             'String',data.consts.labels.label_read_joint, ...
                             'HorizontalAlignment','left', ...
                             'Units','pixels', ...
                             'Position',[236,293,80,14]);
data.noop_button = uicontrol(f,'Style','pushbutton', ...
                               'String','', ...
                               'Enable','off', ...
                               'BackgroundColor',data.background_color, ...
                               'Units','pixels', ...
                               'Position',[206,320,20,20]);
data.noop_text = uicontrol(f,'Style','text', ...
                             'String',data.consts.labels.label_no_operation_joint, ...
                             'HorizontalAlignment','left', ...
                             'Units','pixels', ...
                             'Position',[236,323,80,14]);

data.node_listbox = uicontrol(f,'Style','listbox', ...
                                ...'String',{}, ...
                                'BackgroundColor','white', ...
                                'Units','pixels', ...
                                'Position',[326,10,167,425], ...
                                'Callback',@callback_node_listbox);

listbox_set_item_height(data.node_listbox, 100);

data.auto_detect_button = uicontrol(f,'Style','pushbutton', ...
                                      'String',data.consts.labels.label_auto_detect, ...
                                      'Units','pixels', ...
                                      'Position',[10,410,306,25], ...
                                      'Callback',@callback_auto_detect);
data.new_node_button = uicontrol(f,'Style','pushbutton', ...
                                   'String',data.consts.labels.label_new_node, ...
                                   'Units','pixels', ...
                                   'Position',[10,370,148,25], ...
                                   'Callback',@callback_new_node);
data.del_node_button = uicontrol(f,'Style','pushbutton', ...
                                   'String',data.consts.labels.label_del_node, ...
                                   'Units','pixels', ...
                                   'Position',[168,370,148,25], ...
                                   'Callback',@callback_del_node);

data.comport_text = uicontrol(f,'Style','text', ...
                                'String',data.consts.labels.label_com_port, ...
                                'HorizontalAlignment','left', ...
                                'Units','pixels', ...
                                'Position',[10,459,60,14]);
data.comport_edit = uicontrol(f,'Style','edit', ...
                                'BackgroundColor','white', ...
                                'HorizontalAlignment','left', ...
                                'Units','pixels', ...
                                'Position',[65,455,80,22]);

data.baudrate_text = uicontrol(f,'Style','text', ...
                                 'String',data.consts.labels.label_baud_rate, ...
                                 'HorizontalAlignment','left', ...
                                 'Units','pixels', ...
                                 'Position',[161,459,90,14]);
data.baudrate_edit = uicontrol(f,'Style','edit', ...
                                 'BackgroundColor','white', ...
                                 'HorizontalAlignment','left', ...
                                 'Units','pixels', ...
                                 'Position',[256,455,70,22]);

data.sampletime_text = uicontrol(f,'Style','text', ...
                                   'String',data.consts.labels.label_sample_time, ...
                                   'HorizontalAlignment','left', ...
                                   'Units','pixels', ...
                                   'Position',[346,459,90,14]);
data.sampletime_edit = uicontrol(f,'Style','edit', ...
                                   'BackgroundColor','white', ...
                                   'HorizontalAlignment','left', ...
                                   'Units','pixels', ...
                                   'Position',[433,455,60,22]);

data.advanced_checkbox = uicontrol(f,'Style','checkbox', ...
                                     'String',data.consts.labels.label_advanced, ...
                                     'Value',0, ...
                                     'Units','pixels', ...
                                     'Position',[520,459,160,14], ...
                                     'Callback',@callback_checkbox_advanced);

data.optimizations_panel = uipanel('Title',data.consts.labels.label_optimizations, ...
                                   'Units','pixels', ...
                                   'Position',[10,189,186,171]);

data.disable_status_return_checkbox = uicontrol(data.optimizations_panel, ...
                                                'Style','checkbox', ...
                                                'String',data.consts.labels.label_status_return, ...
                                                'Value',0, ...
                                                'Max',1, ...
                                                'Min',0, ...
                                                'Units','pixels', ...
                                                'Position',[10,130,160,14], ...
                                                'Callback',@callback_checkbox_advanced);

data.close_button = uicontrol(f,'Style','pushbutton', ...
                                'String',data.consts.labels.label_save_and_close, ...
                                'Units','pixels', ...
                                'Position',[692,455,100,25], ...
                                'Callback',@callback_save_and_close);

guidata(f,data);

LoadFigure(f);

SetFigureName(f);

end

function LoadFigure(f)

data = guidata(f);
hBlk = data.simulink_block;

values = get_param(hBlk,'MaskValues');
% see mask properties
% values{1} = COMPort
% values{2} = BaudRate
% values{3} = SampleTime
% values{4} = Frame
% values{5} = ReadIndex
% values{6} = WriteIndex
% values{7} = DisableStatusReturn

if isempty(values{1})
    values{1} = '''COM11''';
end
if isempty(values{2})
    values{2} = '1000000';
end
if isempty(values{3})
    values{3} = '0.5';
end
if (length(values) < 7) || isempty(values{7})
    values{7} = 0;
end

comport = values{1};
set(data.comport_edit,'String',comport(2:(end-1)));
set(data.baudrate_edit,'String',values{2});
set(data.sampletime_edit,'String',values{3});
disp(values{7});
set(data.disable_status_return_checkbox,'Value',str2double(values{7}));

block_user_data = get_param(hBlk,'UserData');
if isempty(block_user_data) || ~isfield(block_user_data,'nodes')
    data.nodes = {};
else
    data.nodes = block_user_data.nodes;
    % perform update if new fields are available
    for i=1:length(data.nodes)
        node = data.nodes{i};
        fields = get_fields(data, node.name);
        ref = zeros(size(fields));

        for j=(length(node.selected_read_fields)+1):length(ref)
            node.selected_read_fields(j) = 0;
        end
        for j=(length(node.selected_write_fields)+1):length(ref)
            node.selected_write_fields(j) = 0;
        end

        data.nodes{i} = node;
    end
end

nodes = cell(size(data.nodes));
for i = 1:length(data.nodes)
    nodes{i} = node_get_html(data, data.nodes{i});
end
set(data.node_listbox, 'String', nodes);

guidata(f,data);

end

function SaveFigure(f)

refresh_listbox;

data = guidata(f);
hBlk = data.simulink_block;
hModel = bdroot(hBlk);
if strcmp(get_param(hModel,'lock'),'on') == 0
    % flush current changes

    value_comport = ['''' get(data.comport_edit,'String') ''''];
    value_baudrate = get(data.baudrate_edit,'String');
    value_sampletime = get(data.sampletime_edit,'String');
    value_disable_status_return = num2str(get(data.disable_status_return_checkbox,'Value'));

    value_frame = '[ ';
    value_write_index = '[ ';
    value_read_index = '[ ';

    input_index = 1;
    output_index = 1;
    read_position = 1;
    write_position = 1;

    read_mask_display = {''};
    write_mask_display = {''};

    for i = 1:length(data.nodes)
        node = data.nodes{i};
        fields = get_fields(data, node.name);
        selected_read_fields = node.selected_read_fields;
        read_fields = zeros(1,256);
        for j = 1:length(selected_read_fields)
            field = fields{j};
            if selected_read_fields(j)
                read_fields(field.address+1:field.address+field.size) = ones(1,field.size);
                read_mask_display = [read_mask_display; ...
                                     'port_label(''output'',', ...
                                     num2str(output_index), ...
                                     ',''', ...
                                     node.name, ...
                                     '(', ...
                                     num2str(node.id), ...
                                     ')/', ...
                                     field.name, ...
                                     ''')' ...
                                    ]; %#ok
                output_index = output_index + 1;
            end
        end
        selected_write_fields = node.selected_write_fields;
        write_fields = zeros(1,256);
        for j = 1:length(selected_write_fields)
            field = fields{j};
            if selected_write_fields(j)
                write_fields(field.address+1:field.address+field.size) = ones(1,field.size);
                write_mask_display = [write_mask_display; ...
                                      'port_label(''input'',', ...
                                      num2str(input_index), ...
                                      ',''', ...
                                      node.name, ...
                                      '(', ...
                                      num2str(node.id), ...
                                      ')/', ...
                                      field.name, ...
                                      ''')' ...
                                     ]; %#ok
                input_index = input_index + 1;
            end
        end

        read_ranges = get_ranges(read_fields) - 1;
        instruction = 2;
        for j = 1:size(read_ranges,1)
            value_frame = [value_frame, ...
                           num2str(instruction),' ', ...
                           num2str(node.id),' ', ...
                           num2str(read_ranges(j,1)),' ', ...
                           num2str(read_ranges(j,2)-read_ranges(j,1)+1),' ' ...
                          ]; %#ok
            write_position = write_position + 4;
            for k = 1:length(selected_read_fields)
                field = fields{k};
                if (selected_read_fields(k) == 1) && (field.address >= read_ranges(j,1)) && ((field.address+field.size-1) <= read_ranges(j,2))
                    value_read_index = [value_read_index, ...
                                        num2str(read_position + field.address - read_ranges(j,1)),' ', ...
                                        num2str(field.size),';' ...
                                       ]; %#ok
                end
            end
            read_position = read_position + (read_ranges(j,2) - read_ranges(j,1) + 1);
        end

        write_ranges = get_ranges(write_fields) - 1;
        instruction = 3;
        for j = 1:size(write_ranges,1)
            value_frame = [value_frame, ...
                           num2str(instruction),' ', ...
                           num2str(node.id),' ', ...
                           num2str(write_ranges(j,1)),' ', ...
                           num2str(write_ranges(j,2)-write_ranges(j,1)+1),' ' ...
                          ]; %#ok
            write_position = write_position + 4;
            for k = 1:length(selected_write_fields)
                field = fields{k};
                if (selected_write_fields(k) == 1) && (field.address >= write_ranges(j,1)) && ((field.address+field.size-1) <= write_ranges(j,2))
                    value_write_index = [value_write_index, ...
                                         num2str(write_position + field.address - write_ranges(j,1)),' ', ...
                                         num2str(field.size),';' ...
                                        ]; %#ok
                end
            end
            for k = write_ranges(j,1):write_ranges(j,2)
                value_frame = [value_frame,'0 ']; %#ok
            end
            write_position = write_position + (write_ranges(j,2) - write_ranges(j,1) + 1);
        end
    end
    value_frame(end) = ']';
    value_write_index(end) = ']';
    value_read_index(end) = ']';

    % see mask properties
    % values{1} = COMPort
    % values{2} = BaudRate
    % values{3} = SampleTime
    % values{4} = Frame
    % values{5} = ReadIndex
    % values{6} = WriteIndex
    % values{7} = DisableStatusReturn
    values = {
        value_comport, ...
        value_baudrate, ...
        value_sampletime, ...
        value_frame, ...
        value_read_index, ...
        value_write_index, ...
        value_disable_status_return ...
      };

    % break library link not to modify the library block (which leads to error in most cases)
    set_param(hBlk,'LinkStatus','none');

    % disable inputs/outputs draw commands to avoid warnings when the
    % number of inputs/ouputs is modified by the next instruction
    set_param(hBlk,'MaskDisplay','image(''usb2dynamixel.jpg'')');

    set_param(hBlk,'MaskValues',values);

    set_param(hBlk,'Mask','on');
    set_param(hBlk,'MaskSelfModifiable','on');
    mask_display = [{'image(''usb2dynamixel.jpg'')'}; read_mask_display; write_mask_display];
    set_param(hBlk,'MaskDisplay',char(mask_display));
    block_user_data.nodes = data.nodes;
    set_param(hBlk,'UserData',block_user_data);
    set_param(hBlk,'UserDataPersistent', 'on');
end

end

function SetFigureName(f)

data = guidata(f);
set(f,'Name',sprintf(data.consts.labels.usb2dynamixel_title, getfullname(data.simulink_block)));

end

function listbox_set_item_height(hObj, height)

node_scrollpane = findjobj(hObj);
node_listbox = node_scrollpane.getViewport.getView;
node_listbox.setFixedCellHeight(height);

end

function t = node_get_html(data, node)

if isempty(find(node.selected_read_fields,1))
    if isempty(find(node.selected_write_fields,1))
        color = data.background_color;
    else
        color = data.write_color;
    end
else
    if isempty(find(node.selected_write_fields,1))
        color = data.read_color;
    else
        color = data.read_write_color;
    end
end

scriptname = mfilename('fullpath');
[curpath,~,~] = fileparts(scriptname);

t = ['<html>' ...
       '<table>' ...
         '<tr>' ...
           '<td>' ...
             '<span style="background-color:' get_color_text(color) ';color:black;font-size:20px">' ...
               num2str(node.id) ...
             '</span>' ...
             '<br/>' ...
             node.name ...
           '</td>' ...
           '<td>' ...
             '<img src="file:/' strrep(fullfile(curpath,lower(node.name)),'\','/') '.jpg"/>' ...
           '</td>' ...
         '</tr>' ...
       '</table>' ...
     '</html>'];

end

% the following function is adapted from http://stackoverflow.com/questions/4922383/matlab-convert-color-name-to-rgb-3-element-vector
function t = get_color_text(color)
  charValues = 'rgbcmywk'.';  %#'
  rgbValues = [eye(3); 1-eye(3); 1 1 1; 0 0 0];

  if ischar(color)  %# Input is a character string
    color = color(1);
    [color,colorIndex] = ismember(color(:),charValues);
    assert(all(color),'convert_color:badInputContents',...
           'String input can only contain the characters ''rgbcmywk''.');
    color = rgbValues(colorIndex,:);

  end

  if isnumeric(color) || islogical(color)  %# Input is a numeric or
                                                   %#   logical array
    assert(all(size(color) == [1 3]),'convert_color:badInputSize',...
           'Numeric input must be an 1-by-3 matrix');
    color = double(color);           %# Convert input to type double
    t = sprintf('%.2x%.2x%.2x',floor(color(1)*255),floor(color(2)*255),floor(color(3)*255));
  else  %# Input is an invalid type
    error('convert_color:badInputType',...
          'Input must be a character or numeric array.');

  end
end

function r = get_ranges(l)

last_id = 0;
j = 1;
r = [];
for i = 1:length(l)
    if l(i) == 1
        if last_id == 0
            last_id = i;
        end
    elseif last_id ~= 0
        r(j,:) = [last_id,i-1]; %#ok
        last_id = 0;
        j = j + 1;
    end
end

end

function [read_field_list,read_item_list,write_field_list,write_item_list] = filter_fields(fields,advanced)
    prec_address = -2;
    read_item_list = cell(0);
    read_field_list = cell(0);
    write_item_list = cell(0);
    write_field_list = cell(0);
    read_index = 1;
    write_index = 1;
    for field_index = 1:length(fields)
        field = fields{field_index};
        if (advanced) || isempty(find(field.mode == 'A',1))
            read = ~isempty(find(field.mode == 'R',1));
            write = ~isempty(find(field.mode == 'W',1));
            if (prec_address == field.address) || (prec_address == field.address - 1)
                description = ['  ' field.description];
            else
                description = field.description;
                if field.size == 2
                    prec_address = field.address;
                else
                    prec_address = -2;
                end
            end
            if read
                read_field_list{read_index} = field_index;
                read_item_list{read_index} = description;
                read_index = read_index + 1;
            end
            if write
                write_field_list{write_index} = field_index;
                write_item_list{write_index} = description;
                write_index = write_index + 1;
            end
        end
    end
end

function refresh_listbox
    data = guidata(gcf);
    if isfield(data,'old_index') && ~isempty(data.old_index)
        node = data.nodes{data.old_index};

        read_value = get(data.read_listbox,'Value');
        selected_read_fields = zeros(size(node.selected_read_fields));
        for i = read_value
            selected_read_fields(data.read_field_list{i}) = 1;
        end
        node.selected_read_fields = selected_read_fields;

        write_value = get(data.write_listbox,'Value');
        selected_write_fields = zeros(size(node.selected_write_fields));
        for i = write_value
            selected_write_fields(data.write_field_list{i}) = 1;
        end
        node.selected_write_fields = selected_write_fields;

        nodes = get(data.node_listbox, 'String');
        nodes{data.old_index} = node_get_html(data, node);
        set(data.node_listbox, 'String', nodes);

        data.nodes{data.old_index} = node;
    end

    if ~isfield(data,'current_index') || isempty(data.current_index)
        set(data.read_listbox,'String',{}, ...
                              'Max',0, ...
                              'Value',[]);
        set(data.write_listbox,'String',{}, ...
                               'Max',0, ...
                               'Value',[]);
    else
        node = data.nodes{data.current_index};

        fields = get_fields(data, node.name);
        advanced = get(data.advanced_checkbox, 'Value');
        [data.read_field_list,read_item_list,data.write_field_list,write_item_list] = filter_fields(fields,advanced);

        read_value = zeros(size(data.read_field_list));
        selected_read_field = node.selected_read_fields;
        for i = 1:length(data.read_field_list)
            if selected_read_field(data.read_field_list{i}) == 1
                read_value(i) = 1;
            end
        end
        set(data.read_listbox,'String',read_item_list, ...
                              'Max',length(read_item_list), ...
                              'Value',find(read_value));
        write_value = zeros(size(data.write_field_list));
        selected_write_field = node.selected_write_fields;
        for i = 1:length(data.write_field_list)
            if selected_write_field(data.write_field_list{i}) == 1
                write_value(i) = 1;
            end
        end
        set(data.write_listbox,'String',write_item_list, ...
                               'Max',length(write_item_list), ...
                               'Value',find(write_value));

        data.old_index = data.current_index;
    end

    guidata(gcf,data);
end

function callback_node_listbox(hObj, eventdata, handles) %#ok

    data = guidata(gcf);
    data.current_index = get(hObj,'Value');
    guidata(gcf,data);

    refresh_listbox;

end

function callback_checkbox_advanced(hObj, eventdata) %#ok

    refresh_listbox;

end

function callback_save_and_close(hObj, eventdata) %#ok

    f = gcf;
    SaveFigure(f);
    close(f);

end

function callback_auto_detect(hObj, eventdata) %#ok

    data = guidata(gcf);

    persistent cancel;

    if isempty(cancel)
        cancel = 1;
    end

    if cancel == 0
        cancel = 2;
        return;
    end
    
    cancel = 0;

    value_comport = get(data.comport_edit,'String');
    value_baudrate = get(data.baudrate_edit,'String');

    ComObj = serial(value_comport);
    ComObj.BaudRate = str2double(value_baudrate);
    ComObj.DataBits = 8;
    ComObj.Parity = 'none';
    ComObj.StopBits = 1;
    % 8 bytes are sent and 8 bytes are returned = about 200 bits
    % adding 100% more time + 20 ms for safety
    ComObj.Timeout = 2*(200/ComObj.BaudRate) + 0.02;
    fopen(ComObj);
    found = 0;

    % clear existing nodes
    data.nodes = {};
    set(data.node_listbox, 'String', {});
    set(data.node_listbox, 'Value', []);
    data.current_index = [];
    data.old_index = [];

    try
        Frame = [255 255 0 4 2 0 2 0];
        for id=0:253
            set(data.auto_detect_button, 'String', sprintf(data.consts.labels.label_auto_detect_progress,id,253,found));
            Frame(3) = id;
            Frame(end) = bitxor(bitand(sum(Frame(3:(end-1))),255),255);
            fwrite(ComObj, Frame);
            pause(ComObj.Timeout);
            while ComObj.BytesAvailable > 0
                Answer = fread(ComObj,8);
                if (length(Answer) == 8) && (Answer(1) == 255) && (Answer(2) == 255) && ...
                   (Answer(4) == 4) && (Answer(8) == bitxor(bitand(sum(Answer(3:(end-1))),255),255))
                    node_id = Answer(3);
                    version_number = Answer(6) + 256*Answer(7);
                    name = '';
                    for j=1:length(data.consts.models)
                        if version_number == data.consts.models{j}.version_number
                            name = data.consts.models{j}.name;
                            break;
                        end
                    end
                    fprintf('id=%d, version=%d, name=%s\n',node_id,version_number,name);
                    if ~isempty(name)
                        found = found + 1;
                        data = insert_node(data,node_id,name);
                    end
                end
                if (Answer(3) ~= id)
                    % current node has not answered yet, waiting for some additional time
                    pause(ComObj.Timeout);
                end
            end
            if cancel ~= 0
                break;
            end
        end
        set(data.auto_detect_button, 'String', data.consts.labels.label_auto_detect);
        cancel = 1;
    catch me
        fclose(ComObj);
        set(data.auto_detect_button, 'String', data.consts.labels.label_auto_detect);
        cancel = 1;
        rethrow(me);
    end
    fclose(ComObj);

    listbox_set_item_height(data.node_listbox, 100);
    guidata(gcf,data);

    refresh_listbox;

end

function callback_new_node(hObj, eventdata) %#ok

    data = guidata(gcf);
    
    answer = inputdlg(data.consts.labels.label_new_id);
    if isempty(answer)
        return;
    end
    try
        id = eval(answer{1});
        if ~isreal(id)
            error('expecting a real');
        end
        if length(id) > 1
            error('expecting a scalar');
        end
        if id ~= floor(id)
            error('expecting an integer');
        end
        if (id < 0) || (id > 253)
            error('expecting in range 0 to 253');
        end;
    catch
        errordlg(data.consts.labels.label_invalid_id);
        return;
    end

    choices = cell(size(data.consts.models));
    for i=1:length(data.consts.models)
        choices{i} = data.consts.models{i}.name;
    end
    [answer,ok] = listdlg('ListString',choices, ...
                          'SelectionMode','single', ...
                          'PromptString',data.consts.labels.label_node_name, ...
                          'OKString',data.consts.labels.label_ok, ...
                          'CancelString',data.consts.labels.label_cancel);

    if ok == 1
        data = insert_node(data,id,choices{answer});
    end

    guidata(gcf, data);

end

function callback_del_node(hObj, eventdata) %#ok
    data = guidata(gcf);
    i = get(data.node_listbox, 'Value');
    if ~isempty(i)
        data.nodes(i) = [];
        nodes = get(data.node_listbox, 'String');
        nodes(i) = [];
        set(data.node_listbox, 'String', nodes);
    end
    data.old_index = [];
    data.current_index = [];
    if i > length(data.nodes)
        set(data.node_listbox, 'Value', length(data.nodes));
    else
        set(data.node_listbox, 'Value', []);
    end
    listbox_set_item_height(data.node_listbox, 100);
    guidata(gcf, data);

    refresh_listbox;
end

function data = insert_node(d, id, name)
    data = d;
    fields = get_fields(data, name);
    node = struct('id',id, ...
                  'name',name, ...
                  'selected_read_fields',zeros(size(fields)), ...
                  'selected_write_fields',zeros(size(fields)));
    nodes = get(data.node_listbox, 'String');

    done = 0;
    for i=1:length(data.nodes)
        if data.nodes{i}.id == id
            % replace existing?
            choice = questdlg(data.consts.labels.label_replace_existing_node, ...
                              sprintf(data.consts.labels.label_replace_existing_node2,id,name), ...
                              data.consts.labels.label_yes, ...
                              data.consts.labels.label_no, ...
                              data.consts.labels.label_no);
            if strcmp(choice,data.consts.labels.label_yes)
                data.nodes{i} = node;
                nodes{i} = node_get_html(data, node);
            end
            done = i;
            break;
        elseif data.nodes{i}.id > id
            % insert before this one
            data.nodes = [data.nodes{1:(i-1)} {node} data.nodes{i:end}];
            nodes = [nodes{1:(i-1)} {node_get_html(data, node)} nodes{i:end}];
            done = i;
            break;
        end
    end
    if done == 0
        % insert node at the end of the list
        data.nodes{end+1} = node;
        nodes{end+1} = node_get_html(data, node);
        done = length(nodes);
    end
    set(data.node_listbox, 'String', nodes);
    set(data.node_listbox, 'Value', done);
    listbox_set_item_height(data.node_listbox, 100);
end

% return field list given a dynamixel id
function fields = get_fields(data, name)

    if strcmp(name,'RX24F')
        fields = data.consts.rx24f_fields;
    elseif strcmp(name,'MX28')
        fields = data.consts.mx28_fields;
    elseif strcmp(name,'CM730')
        fields = data.consts.cm730_fields;
    elseif strcmp(name,'FSR')
        fields = data.consts.fsr_fields;
    end

end