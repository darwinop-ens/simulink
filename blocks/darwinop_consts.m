function consts = darwinop_consts

    try
        if ispref('darwinoplib','consts')
            pref = getpref('darwinoplib','consts');
            if strcmp(pref,'darwinop_consts')
                lang = darwinop_consts_en;
            else
                lang = eval(pref);
            end
        else
            lang = darwinop_consts_en;
        end
    catch
        lang = darwinop_consts_en;
    end 

consts.mx28_fields = {};
consts.mx28_fields = add_field(consts.mx28_fields,lang,0,2,'model_number','AR');
consts.mx28_fields = add_field(consts.mx28_fields,lang,2,1,'firmware_version','AR');
consts.mx28_fields = add_field(consts.mx28_fields,lang,3,1,'ID','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,4,1,'baud_rate','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,5,1,'return_delay_time','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,6,2,'clockwise_limit','RW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,8,2,'counterclockwise_limit','RW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,11,1,'highest_temperature','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,12,1,'lowest_voltage','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,13,1,'highest_voltage','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,14,2,'max_torque','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,16,1,'status_return_level','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,17,1,'alarm_LED','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,18,1,'alarm_shutdown','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,24,1,'torque_enable','RW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,25,1,'LED','RW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,26,1,'derivative_gain','RW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,27,1,'integral_gain','RW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,28,1,'proportional_gain','RW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,30,2,'goal_position','RW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,32,2,'moving_speed','RW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,34,2,'torque_limit','RW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,36,2,'current_position','R');
consts.mx28_fields = add_field(consts.mx28_fields,lang,38,2,'current_speed','R');
consts.mx28_fields = add_field(consts.mx28_fields,lang,40,2,'current_load','R');
consts.mx28_fields = add_field(consts.mx28_fields,lang,42,1,'current_voltage','AR');
consts.mx28_fields = add_field(consts.mx28_fields,lang,43,1,'current_temperature','AR');
consts.mx28_fields = add_field(consts.mx28_fields,lang,44,1,'registered','AR');
consts.mx28_fields = add_field(consts.mx28_fields,lang,46,1,'moving','AR');
consts.mx28_fields = add_field(consts.mx28_fields,lang,47,1,'lock','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,48,2,'punch','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,52,2,'pot','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,lang,54,2,'pwm','R');
consts.mx28_fields = add_field(consts.mx28_fields,lang,56,2,'p_error','R');
consts.mx28_fields = add_field(consts.mx28_fields,lang,58,2,'i_error','R');
consts.mx28_fields = add_field(consts.mx28_fields,lang,60,2,'d_error','R');
consts.mx28_fields = add_field(consts.mx28_fields,lang,62,2,'p_out','R');
consts.mx28_fields = add_field(consts.mx28_fields,lang,64,2,'i_out','R');
consts.mx28_fields = add_field(consts.mx28_fields,lang,66,2,'d_out','R');
consts.mx28_fields = add_field(consts.mx28_fields,lang,73,1,'goal_acceleration','RW');

consts.rx24f_fields = {};
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,0,2,'model_number','AR');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,2,1,'firmware_version','AR');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,3,1,'ID','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,4,1,'baud_rate','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,5,1,'return_delay_time','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,6,2,'clockwise_limit','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,8,2,'counterclockwise_limit','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,11,1,'highest_temperature','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,12,1,'lowest_voltage','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,13,1,'highest_voltage','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,14,2,'max_torque','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,16,1,'status_return_level','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,17,1,'alarm_LED','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,18,1,'alarm_shutdown','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,24,1,'torque_enable','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,25,1,'LED','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,26,1,'clockwise_compliance_margin','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,27,1,'counterclockwise_compliance_margin','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,28,1,'clockwise_compliance_slope','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,29,1,'counterclockwise_compliance_slope','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,30,2,'goal_position','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,32,2,'moving_speed','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,34,2,'torque_limit','RW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,36,2,'current_position','R');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,38,2,'current_speed','R');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,40,2,'current_load','R');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,42,1,'current_voltage','AR');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,43,1,'current_temperature','AR');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,44,1,'registered','AR');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,46,1,'moving','AR');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,47,1,'lock','ARW');
consts.rx24f_fields = add_field(consts.rx24f_fields,lang,48,2,'punch','RW');

consts.cm730_fields = {};
consts.cm730_fields = add_field(consts.cm730_fields,lang,0,2,'model_number','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,2,1,'firmware_version','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,3,1,'ID','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,lang,4,1,'baud_rate','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,lang,5,1,'return_delay_time','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,lang,16,1,'status_return_level','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,lang,24,1,'dynamixel_power','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,lang,25,1,'LED_panel','RW');
consts.cm730_fields = add_field(consts.cm730_fields,lang,26,2,'LED_head','RW');
consts.cm730_fields = add_field(consts.cm730_fields,lang,28,2,'LED_eye','RW');
consts.cm730_fields = add_field(consts.cm730_fields,lang,30,1,'button','R');
consts.cm730_fields = add_field(consts.cm730_fields,lang,38,2,'gyroZ','R');
consts.cm730_fields = add_field(consts.cm730_fields,lang,40,2,'gyroY','R');
consts.cm730_fields = add_field(consts.cm730_fields,lang,42,2,'gyroX','R');
consts.cm730_fields = add_field(consts.cm730_fields,lang,44,2,'accX','R');
consts.cm730_fields = add_field(consts.cm730_fields,lang,46,2,'accY','R');
consts.cm730_fields = add_field(consts.cm730_fields,lang,48,2,'accZ','R');
consts.cm730_fields = add_field(consts.cm730_fields,lang,50,1,'current_voltage','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,51,2,'mic_left','R');
consts.cm730_fields = add_field(consts.cm730_fields,lang,53,2,'ADC2','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,55,2,'ADC3','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,57,2,'ADC4','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,59,2,'ADC5','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,61,2,'ADC6','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,63,2,'ADC7','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,65,2,'ADC8','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,67,2,'mic_right','R');
consts.cm730_fields = add_field(consts.cm730_fields,lang,69,2,'ADC10','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,71,2,'ADC11','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,73,2,'ADC12','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,75,2,'ADC13','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,77,2,'ADC14','AR');
consts.cm730_fields = add_field(consts.cm730_fields,lang,79,2,'ADC15','AR');

consts.fsr_fields = {};
consts.fsr_fields = add_field(consts.fsr_fields,lang,0,2,'model_number','AR');
consts.fsr_fields = add_field(consts.fsr_fields,lang,2,1,'firmware_version','AR');
consts.fsr_fields = add_field(consts.fsr_fields,lang,3,1,'ID','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,lang,4,1,'baud_rate','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,lang,5,1,'return_delay_time','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,lang,16,1,'status_return_level','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,lang,19,1,'operating_mode','RW');
consts.fsr_fields = add_field(consts.fsr_fields,lang,25,1,'LED','RW');
consts.fsr_fields = add_field(consts.fsr_fields,lang,26,2,'FSR1','R');
consts.fsr_fields = add_field(consts.fsr_fields,lang,28,2,'FSR2','R');
consts.fsr_fields = add_field(consts.fsr_fields,lang,30,2,'FSR3','R');
consts.fsr_fields = add_field(consts.fsr_fields,lang,32,2,'FSR4','R');
consts.fsr_fields = add_field(consts.fsr_fields,lang,34,1,'FSRX','R');
consts.fsr_fields = add_field(consts.fsr_fields,lang,35,1,'FSRY','R');
consts.fsr_fields = add_field(consts.fsr_fields,lang,42,1,'current_voltage','AR');
consts.fsr_fields = add_field(consts.fsr_fields,lang,44,1,'registered','AR');
consts.fsr_fields = add_field(consts.fsr_fields,lang,47,1,'lock','ARW');

consts.vision_fields = {};
consts.vision_fields = add_field(consts.vision_fields,lang,1,1,'vision_enable','RW');
consts.vision_fields = add_field(consts.vision_fields,lang,2,1,'ball_enable','RW');
consts.vision_fields = add_field(consts.vision_fields,lang,3,1,'red_enable','RW');
consts.vision_fields = add_field(consts.vision_fields,lang,4,1,'yellow_enable','RW');
consts.vision_fields = add_field(consts.vision_fields,lang,5,1,'blue_enable','RW');
consts.vision_fields = add_field(consts.vision_fields,lang,9,1,'webcam_stream','RW');
consts.vision_fields = add_field(consts.vision_fields,lang,10,2,'webcam_width','R');
consts.vision_fields = add_field(consts.vision_fields,lang,12,2,'webcam_height','R');
consts.vision_fields = add_field(consts.vision_fields,lang,20,2,'ball_hue_cen','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,22,2,'ball_hue_tol','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,24,1,'ball_min_sat','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,25,1,'ball_max_sat','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,26,1,'ball_min_val','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,27,1,'ball_max_val','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,28,1,'ball_min_cov','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,29,1,'ball_max_cov','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,30,2,'ball_X','R');
consts.vision_fields = add_field(consts.vision_fields,lang,32,2,'ball_Y','R');
consts.vision_fields = add_field(consts.vision_fields,lang,40,2,'red_hue_cen','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,42,2,'red_hue_tol','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,44,1,'red_min_sat','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,45,1,'red_max_sat','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,46,1,'red_min_val','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,47,1,'red_max_val','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,48,1,'red_min_cov','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,49,1,'red_max_cov','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,50,2,'red_X','R');
consts.vision_fields = add_field(consts.vision_fields,lang,52,2,'red_Y','R');
consts.vision_fields = add_field(consts.vision_fields,lang,60,2,'yellow_hue_cen','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,62,2,'yellow_hue_tol','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,64,1,'yellow_min_sat','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,65,1,'yellow_max_sat','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,66,1,'yellow_min_val','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,67,1,'yellow_max_val','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,68,1,'yellow_min_cov','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,69,1,'yellow_max_cov','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,70,2,'yellow_X','R');
consts.vision_fields = add_field(consts.vision_fields,lang,72,2,'yellow_Y','R');
consts.vision_fields = add_field(consts.vision_fields,lang,80,2,'blue_hue_cen','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,82,2,'blue_hue_tol','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,84,1,'blue_min_sat','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,85,1,'blue_max_sat','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,86,1,'blue_min_val','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,87,1,'blue_max_val','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,88,1,'blue_min_cov','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,89,1,'blue_max_cov','ARW');
consts.vision_fields = add_field(consts.vision_fields,lang,90,2,'blue_X','R');
consts.vision_fields = add_field(consts.vision_fields,lang,92,2,'blue_Y','R');

consts.ids = {};
consts.ids = add_id(consts.ids,lang,'right_shoulder_pitch',1,200,315);
consts.ids = add_id(consts.ids,lang,'left_shoulder_pitch',2,270,315);
consts.ids = add_id(consts.ids,lang,'right_shoulder_roll',3,140,295);
consts.ids = add_id(consts.ids,lang,'left_shoulder_roll',4,325,295);
consts.ids = add_id(consts.ids,lang,'right_elbow',5,108,297);
consts.ids = add_id(consts.ids,lang,'left_elbow',6,360,297);
consts.ids = add_id(consts.ids,lang,'right_hip_yaw',7,200,250);
consts.ids = add_id(consts.ids,lang,'left_hip_yaw',8,270,250);
consts.ids = add_id(consts.ids,lang,'right_hip_roll',9,145,185);
consts.ids = add_id(consts.ids,lang,'left_hip_roll',10,325,185);
consts.ids = add_id(consts.ids,lang,'right_hip_pitch',11,200,185);
consts.ids = add_id(consts.ids,lang,'left_hip_pitch',12,265,185);
consts.ids = add_id(consts.ids,lang,'right_knee',13,200,125);
consts.ids = add_id(consts.ids,lang,'left_knee',14,265,125);
consts.ids = add_id(consts.ids,lang,'right_ankle_pitch',15,200,60);
consts.ids = add_id(consts.ids,lang,'left_ankle_pitch',16,265,60);
consts.ids = add_id(consts.ids,lang,'right_ankle_roll',17,140,50);
consts.ids = add_id(consts.ids,lang,'left_ankle_roll',18,330,50);
consts.ids = add_id(consts.ids,lang,'head_pan',19,235,310);
consts.ids = add_id(consts.ids,lang,'head_tilt',20,235,355);
consts.ids = add_id(consts.ids,lang,'sub_controller',200,235,265);
consts.ids = add_id(consts.ids,lang,'right_foot',111,200,20);
consts.ids = add_id(consts.ids,lang,'left_foot',112,265,20);
consts.ids = add_id(consts.ids,lang,'vision',-1,225,380);

consts.models = {};
consts.models = add_model(consts.models,24,'RX24F');
consts.models = add_model(consts.models,29,'MX28');

consts.labels.darwinop_title = lang.darwinop_title_name;
consts.labels.usb2dynamixel_title = lang.usb2dynamixel_title_name;
consts.labels.label_read = lang.label_read_name;
consts.labels.label_write = lang.label_write_name;
consts.labels.label_selected_joint = lang.label_selected_joint_name;
consts.labels.label_read_write_joint = lang.label_read_write_joint_name;
consts.labels.label_write_joint = lang.label_write_joint_name;
consts.labels.label_read_joint = lang.label_read_joint_name;
consts.labels.label_no_operation_joint = lang.label_no_operation_joint_name;
consts.labels.label_ip_address = lang.label_ip_address_name;
consts.labels.label_port = lang.label_port_name;
consts.labels.label_protocol = lang.label_protocol_name;
consts.labels.label_sample_time = lang.label_sample_time_name;
consts.labels.label_advanced = lang.label_advanced_name;
consts.labels.label_save_and_close = lang.label_save_and_close_name;
consts.labels.label_com_port = lang.label_com_port_name;
consts.labels.label_baud_rate = lang.label_baud_rate_name;
consts.labels.label_auto_detect = lang.label_auto_detect_name;
consts.labels.label_auto_detect_progress = lang.label_auto_detect_progress_name;
consts.labels.label_new_node = lang.label_new_node_name;
consts.labels.label_del_node = lang.label_del_node_name;
consts.labels.label_replace_existing_node = lang.label_replace_existing_node_name;
consts.labels.label_replace_existing_node2 = lang.label_replace_existing_node2_name;
consts.labels.label_yes = lang.label_yes_name;
consts.labels.label_no = lang.label_no_name;
consts.labels.label_new_id = lang.label_new_id_name;
consts.labels.label_invalid_id = lang.label_invalid_id_name;
consts.labels.label_node_name = lang.label_node_name_name;
consts.labels.label_ok = lang.label_ok_name;
consts.labels.label_cancel = lang.label_cancel_name;
consts.labels.label_optimizations = lang.label_optimizations_name;
consts.labels.label_status_return = lang.label_status_return_name;

end

function fields = add_field(f, lang, address, size, name, mode)
fields = f;
field_name = getfield(lang,[name '_name']); %#ok<GFLD>
field_descr = getfield(lang,[name '_descr']); %#ok<GFLD>

fields{end+1} = struct('address', address, ...
                       'size', size, ...
                       'name', field_name, ...
                       'description', field_descr, ...
                       'mode', mode);

if size == 2
    fields{end+1} = struct('address', address, ...
                           'size', 1, ...
                           'name', sprintf(lang.low_name, field_name), ...
                           'description', sprintf(lang.low_descr, field_descr), ...
                           'mode', ['A' mode]);
    fields{end+1} = struct('address', address + 1, ...
                           'size', 1, ...
                           'name', sprintf(lang.high_name, field_name), ...
                           'description', sprintf(lang.high_descr, field_descr), ...
                           'mode', ['A' mode]);
end

end

function ids = add_id(i, lang, name, address, posx, posy)
ids = i;
ids{end+1} = struct('address', address, ...
                    'name', getfield(lang,[name '_name']), ...
                    'posx', posx, ...
                    'posy', posy); %#ok<GFLD>
end

function models = add_model(m, version, name)
  models = m;
  models{end+1} = struct('version_number', version, ...
                         'name', name);
end
