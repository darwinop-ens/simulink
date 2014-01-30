function consts = darwinop_consts_en

consts.mx28_fields = {};
consts.mx28_fields = add_field(consts.mx28_fields,0,2,'Model Number','Model number','AR');
consts.mx28_fields = add_field(consts.mx28_fields,2,1,'Version of Firmware','Information on the version of firmware','AR');
consts.mx28_fields = add_field(consts.mx28_fields,3,1,'ID','ID of MX28 on Dynamixel Bus','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,4,1,'Baud Rate','Baud Rate of Dynamixel','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,5,1,'Return Delay Time','Return Delay Time','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,6,2,'CW Angle Limit','Clockwise Angle Limit','RW');
consts.mx28_fields = add_field(consts.mx28_fields,8,2,'CCW Angle Limit','Counterclockwise Angle Limit','RW');
consts.mx28_fields = add_field(consts.mx28_fields,11,1,'Highest Temperature','Highest Limit Temperature','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,12,1,'Lowest Voltage','Lowest Limit Voltage','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,13,1,'Highest Voltage','Highest Limit Voltage','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,14,2,'Max Torque','Max. Torque','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,16,1,'Status Return Level','Status Return Level','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,17,1,'Alarm LED','LED for Alarm','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,18,1,'Alarm Shutdown','Shutdown for Alarm','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,24,1,'Torque Enable','Torque On/Off','RW');
consts.mx28_fields = add_field(consts.mx28_fields,25,1,'LED','LED On/Off','RW');
consts.mx28_fields = add_field(consts.mx28_fields,26,1,'D Gain','Derivative Gain','RW');
consts.mx28_fields = add_field(consts.mx28_fields,27,1,'I Gain','Integral Gain','RW');
consts.mx28_fields = add_field(consts.mx28_fields,28,1,'P Gain','Proportional Gain','RW');
consts.mx28_fields = add_field(consts.mx28_fields,30,2,'Goal Position','Goal Position','RW');
consts.mx28_fields = add_field(consts.mx28_fields,32,2,'Moving Speed','Moving Speed','RW');
consts.mx28_fields = add_field(consts.mx28_fields,34,2,'Torque Limit','Torque Limit','RW');
consts.mx28_fields = add_field(consts.mx28_fields,36,2,'Position','Current Position','R');
consts.mx28_fields = add_field(consts.mx28_fields,38,2,'Speed','Current Speed','R');
consts.mx28_fields = add_field(consts.mx28_fields,40,2,'Load','Current Load','R');
consts.mx28_fields = add_field(consts.mx28_fields,42,1,'Voltage','Current Voltage','AR');
consts.mx28_fields = add_field(consts.mx28_fields,43,1,'Temperature','Current Temperature','AR');
consts.mx28_fields = add_field(consts.mx28_fields,44,1,'Registered','Means if Current Instruction is registered','AR');
consts.mx28_fields = add_field(consts.mx28_fields,46,1,'Moving','Means if there is any movement','AR');
consts.mx28_fields = add_field(consts.mx28_fields,47,1,'Lock','Locking EEPROM','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,48,2,'Punch','Punch','ARW');

consts.cm730_fields = {};
consts.cm730_fields = add_field(consts.cm730_fields,0,2,'Model Number','Model number','AR');
consts.cm730_fields = add_field(consts.cm730_fields,2,1,'Version of Firmware','Information on the version of firmware','AR');
consts.cm730_fields = add_field(consts.cm730_fields,3,1,'ID','ID of CM730 on Dynamixel Bus','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,4,1,'Baud Rate','Dynamixel baud rate','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,5,1,'Return Delay Time','Return Delay Time','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,16,1,'Status Return Level','Status Return Level','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,24,1,'Dynamixel Power','Dynamixel On/Off','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,25,1,'LED Pannel','LED Pannel On/Off','RW');
consts.cm730_fields = add_field(consts.cm730_fields,26,2,'LED Head','LED Head','RW');
consts.cm730_fields = add_field(consts.cm730_fields,28,2,'LED Eye','LED Eye','RW');
consts.cm730_fields = add_field(consts.cm730_fields,30,1,'Button','Button status','R');
consts.cm730_fields = add_field(consts.cm730_fields,38,2,'Gyro Z','Gyroscope Z-axis','R');
consts.cm730_fields = add_field(consts.cm730_fields,40,2,'Gyro Y','Gyroscope Y-axis','R');
consts.cm730_fields = add_field(consts.cm730_fields,42,2,'Gyro X','Gyroscope X-axis','R');
consts.cm730_fields = add_field(consts.cm730_fields,44,2,'ACC X','Accelerometer X-axis','R');
consts.cm730_fields = add_field(consts.cm730_fields,46,2,'ACC Y','Accelerometer Y-axis','R');
consts.cm730_fields = add_field(consts.cm730_fields,48,2,'ACC Z','Accelerometer Z-axis','R');
consts.cm730_fields = add_field(consts.cm730_fields,50,1,'Present Voltage','Current Voltage','AR');
consts.cm730_fields = add_field(consts.cm730_fields,51,2,'MIC Left','Microphone Left','R');
consts.cm730_fields = add_field(consts.cm730_fields,53,2,'ADC 2','ADC channel 2','AR');
consts.cm730_fields = add_field(consts.cm730_fields,55,2,'ADC 3','ADC channel 3','AR');
consts.cm730_fields = add_field(consts.cm730_fields,57,2,'ADC 4','ADC channel 4','AR');
consts.cm730_fields = add_field(consts.cm730_fields,59,2,'ADC 5','ADC channel 5','AR');
consts.cm730_fields = add_field(consts.cm730_fields,61,2,'ADC 6','ADC channel 6','AR');
consts.cm730_fields = add_field(consts.cm730_fields,63,2,'ADC 7','ADC channel 7','AR');
consts.cm730_fields = add_field(consts.cm730_fields,65,2,'ADC 8','ADC channel 8','AR');
consts.cm730_fields = add_field(consts.cm730_fields,67,2,'MIC Right','Microphone Right','R');
consts.cm730_fields = add_field(consts.cm730_fields,69,2,'ADC 10','ADC channel 10','AR');
consts.cm730_fields = add_field(consts.cm730_fields,71,2,'ADC 11','ADC channel 11','AR');
consts.cm730_fields = add_field(consts.cm730_fields,73,2,'ADC 12','ADC channel 12','AR');
consts.cm730_fields = add_field(consts.cm730_fields,75,2,'ADC 13','ADC channel 13','AR');
consts.cm730_fields = add_field(consts.cm730_fields,77,2,'ADC 14','ADC channel 14','AR');
consts.cm730_fields = add_field(consts.cm730_fields,79,2,'ADC 15','ADC channel 15','AR');

consts.fsr_fields = {};
consts.fsr_fields = add_field(consts.fsr_fields,0,2,'Model Number','Model number','AR');
consts.fsr_fields = add_field(consts.fsr_fields,2,1,'Version of Firmware','Information on the version of firmware','AR');
consts.fsr_fields = add_field(consts.fsr_fields,3,1,'ID','ID of FSR on Dynamixel Bus','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,4,1,'Baud Rate','Dynamixel baud rate','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,5,1,'Return Delay Time','Return Delay Time','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,16,1,'Status Return Level','Status Return Level','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,19,1,'Operating mode','Operating mode','RW');
consts.fsr_fields = add_field(consts.fsr_fields,25,1,'LED','LED On/Off','RW');
consts.fsr_fields = add_field(consts.fsr_fields,26,2,'FSR1','Force Sensitive Resistor 1','R');
consts.fsr_fields = add_field(consts.fsr_fields,28,2,'FSR2','Force Sensitive Resistor 2','R');
consts.fsr_fields = add_field(consts.fsr_fields,30,2,'FSR3','Force Sensitive Resistor 3','R');
consts.fsr_fields = add_field(consts.fsr_fields,32,2,'FSR4','Force Sensitive Resistor 4','R');
consts.fsr_fields = add_field(consts.fsr_fields,34,1,'FSRX','Force Sensitive Resistor X-axis','R');
consts.fsr_fields = add_field(consts.fsr_fields,35,1,'FSRY','Force Sensitive Resistor Y-axis','R');
consts.fsr_fields = add_field(consts.fsr_fields,42,1,'Voltage','Current Voltage','AR');
consts.fsr_fields = add_field(consts.fsr_fields,44,1,'Registered','Means if Current Instruction is registered','AR');
consts.fsr_fields = add_field(consts.fsr_fields,47,1,'Lock','Locking EEPROM','ARW');

consts.vision_fields = {};
consts.vision_fields = add_field(consts.vision_fields,1,1,'Enable','Enable vision processing','RW');
consts.vision_fields = add_field(consts.vision_fields,2,1,'Ball enable','Enable the ball finding','RW');
consts.vision_fields = add_field(consts.vision_fields,3,1,'Red enable','Enable the red finding','RW');
consts.vision_fields = add_field(consts.vision_fields,4,1,'Yellow enable','Enable the yellow finding','RW');
consts.vision_fields = add_field(consts.vision_fields,5,1,'Blue enable','Enable the blue finding','RW');
consts.vision_fields = add_field(consts.vision_fields,9,1,'Stream','Enable HTTP Server Streamer','RW');
consts.vision_fields = add_field(consts.vision_fields,10,2,'Width','Webcam width in pixels','R');
consts.vision_fields = add_field(consts.vision_fields,12,2,'Height','Webcam height in pixels','R');
consts.vision_fields = add_field(consts.vision_fields,20,2,'Ball Hue Center','Ball Hue Center','ARW');
consts.vision_fields = add_field(consts.vision_fields,22,2,'Ball Hue Tolerance','Ball Hue Tolerance','ARW');
consts.vision_fields = add_field(consts.vision_fields,24,1,'Ball Min. Sat.','Ball Minimum Saturation Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,25,1,'Ball Max. Sat.','Ball Maximum Saturation Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,26,1,'Ball Min. Val.','Ball Minimum Value Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,27,1,'Ball Max. Val.','Ball Maximum Value Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,28,1,'Ball Min. Cov.','Ball Minimum Coverage Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,29,1,'Ball Max. Cov.','Ball Maximum Coverage Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,30,2,'Ball X','Ball X position','R');
consts.vision_fields = add_field(consts.vision_fields,32,2,'Ball Y','Ball Y position','R');
consts.vision_fields = add_field(consts.vision_fields,40,2,'Red Hue','Red Hue Center','ARW');
consts.vision_fields = add_field(consts.vision_fields,42,2,'Red Hue Tolerance','Red Hue Tolerance','ARW');
consts.vision_fields = add_field(consts.vision_fields,44,1,'Red Min. Sat.','Red Minimum Saturation Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,45,1,'Red Max. Sat.','Red Maximum Saturation Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,46,1,'Red Min. Val.','Red Minimum Value Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,47,1,'Red Max. Val.','Red Maximum Value Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,48,1,'Red Min. Cov.','Red Minimum Coverage Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,49,1,'Red Max. Cov.','Red Maximum Coverage Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,50,2,'Red X','Red X position','R');
consts.vision_fields = add_field(consts.vision_fields,52,2,'Red Y','Red Y position','R');
consts.vision_fields = add_field(consts.vision_fields,60,2,'Yellow Hue','Yellow Hue Center','ARW');
consts.vision_fields = add_field(consts.vision_fields,62,2,'Yellow Hue Tolerance','Yellow Hue Tolerance','ARW');
consts.vision_fields = add_field(consts.vision_fields,64,1,'Yellow Min. Sat.','Yellow Minimum Saturation Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,65,1,'Yellow Max. Sat.','Yellow Maximum Saturation Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,66,1,'Yellow Min. Val.','Yellow Minimum Value Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,67,1,'Yellow Max. Val.','Yellow Maximum Value Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,68,1,'Yellow Min. Cov.','Yellow Minimum Coverage Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,69,1,'Yellow Max. Cov.','Yellow Maximum Coverage Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,70,2,'Yellow X','Yellow X position','R');
consts.vision_fields = add_field(consts.vision_fields,72,2,'Yellow Y','Yellow Y position','R');
consts.vision_fields = add_field(consts.vision_fields,80,2,'Blue Hue','Blue Hue Center','ARW');
consts.vision_fields = add_field(consts.vision_fields,82,2,'Blue Hue Tolerance','Blue Hue Tolerance','ARW');
consts.vision_fields = add_field(consts.vision_fields,84,1,'Blue Min. Sat.','Blue Minimum Saturation Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,85,1,'Blue Max. Sat.','Blue Maximum Saturation Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,86,1,'Blue Min. Val.','Blue Minimum Value Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,87,1,'Blue Max. Val.','Blue Maximum Value Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,88,1,'Blue Min. Cov.','Blue Minimum Coverage Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,89,1,'Blue Max. Cov.','Blue Maximum Coverage Threshold','ARW');
consts.vision_fields = add_field(consts.vision_fields,90,2,'Blue X','Blue X position','R');
consts.vision_fields = add_field(consts.vision_fields,92,2,'Blue Y','Blue Y position','R');

consts.ids = {};
consts.ids = add_id(consts.ids,'Right Shoulder Pitch',1,200,315);
consts.ids = add_id(consts.ids,'Left Shoulder Pitch',2,270,315);
consts.ids = add_id(consts.ids,'Right Shoulder Roll',3,140,295);
consts.ids = add_id(consts.ids,'Left Shoulder Roll',4,325,295);
consts.ids = add_id(consts.ids,'Right Elbow',5,108,297);
consts.ids = add_id(consts.ids,'Left Elbow',6,360,297);
consts.ids = add_id(consts.ids,'Right Hip Yaw',7,200,250);
consts.ids = add_id(consts.ids,'Left Hip Yaw',8,270,250);
consts.ids = add_id(consts.ids,'Right Hip Roll',9,145,185);
consts.ids = add_id(consts.ids,'Left Hip Roll',10,325,185);
consts.ids = add_id(consts.ids,'Right Hip Pitch',11,200,185);
consts.ids = add_id(consts.ids,'Left Hip Pitch',12,265,185);
consts.ids = add_id(consts.ids,'Right Knee',13,200,125);
consts.ids = add_id(consts.ids,'Left Knee',14,265,125);
consts.ids = add_id(consts.ids,'Right Ankle Pitch',15,200,60);
consts.ids = add_id(consts.ids,'Left Ankle Pitch',16,265,60);
consts.ids = add_id(consts.ids,'Right Ankle Roll',17,140,50);
consts.ids = add_id(consts.ids,'Left Ankle Roll',18,330,50);
consts.ids = add_id(consts.ids,'Head Pan',19,235,310);
consts.ids = add_id(consts.ids,'Head Tilt',20,235,355);
consts.ids = add_id(consts.ids,'Sub controller',200,235,265);
consts.ids = add_id(consts.ids,'Right Foot',111,200,20);
consts.ids = add_id(consts.ids,'Left Foot',112,265,20);
consts.ids = add_id(consts.ids,'Vision',-1,225,380);

consts.labels = struct( ...
    'figure_title','Darwin-OP communication setup (%s)', ...
    'label_read','Select items to read (ctrl+click for multiple):', ...
    'label_write','Select item to write (ctrl+click for multiple):', ...
    'label_selected_joint','selected joint', ...
    'label_read_write_joint','read/write operation', ...
    'label_write_joint','write operation', ...
    'label_read_joint','read operation', ...
    'label_no_operation_joint','no operation', ...
    'label_ip_address','IP address:', ...
    'label_port','Port:', ...
    'label_protocol','Protocol:', ...
    'label_sample_time','Sample Time (s):', ...
    'label_advanced','Advanced configuration', ...
    'label_save_and_close','Save and close' ...
  );

consts.language = 'english';

end

function fields = add_field(f, address, size, name, description, mode)
fields = f;
fields{end+1} = struct('address', address, ...
                       'size', size, ...
                       'name', name, ...
                       'description', description, ...
                       'mode', mode);
if size == 2
    fields{end+1} = struct('address', address, ...
                           'size', 1, ...
                           'name', sprintf('%s (L)', name), ...
                           'description', sprintf('Lowest byte of %s', description), ...
                           'mode', ['A' mode]);
    fields{end+1} = struct('address', address + 1, ...
                           'size', 1, ...
                           'name', sprintf('%s (H)', name), ...
                           'description', sprintf('Highest byte of %s', description), ...
                           'mode', ['A' mode]);
end

end

function ids = add_id(i, name, address, posx, posy)
ids = i;
ids{end+1} = struct('address', address, ...
                    'name', name, ...
                    'posx', posx, ...
                    'posy', posy);
end
