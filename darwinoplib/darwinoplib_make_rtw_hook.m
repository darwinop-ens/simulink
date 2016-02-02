function darwinoplib_make_rtw_hook(hookMethod,modelName,~,~,~,~)

  switch hookMethod
   case 'error'
    % Called if an error occurs anywhere during the build.  If no error occurs
    % during the build, then this hook will not be called.  Valid arguments
    % at this stage are hookMethod and modelName. This enables cleaning up
    % any static or global data used by this hook file.
    disp(['### Build procedure for model: ''' modelName...
          ''' aborted due to an error.']);
      
   case 'entry'
    % Called at start of code generation process (before anything happens.)
    % Valid arguments at this stage are hookMethod, modelName, and buildArgs.
    setup_settings();

   case 'before_tlc'
    % Called just prior to invoking TLC Compiler (actual code generation.)
    % Valid arguments at this stage are hookMethod, modelName, and
    % buildArgs
    
   case 'after_tlc'
    % Called just after to invoking TLC Compiler (actual code generation.)
    % Valid arguments at this stage are hookMethod, modelName, and
    % buildArgs

   case {'before_make','before_makefilebuilder_make'}
    % Called after code generation is complete, and just prior to kicking
    % off make process (assuming code generation only is not selected.)  All
    % arguments are valid at this stage.

   case 'after_make'
    % Called after make process is complete. All arguments are valid at 
    % this stage.
    copy_additional_files();
    archiveName = package_archive(modelName);
    send_archive(modelName, archiveName);

   case 'exit'
    % Called at the end of the RTW build process.  All arguments are valid
    % at this stage.
    
    disp(['### Successful completion of build ',...
          'procedure for model: ', modelName]);
      
  end
end

function setup_settings()
     % verify current settings from Simulink
     if isExtMode()
         % automatically setup external mode mex arguments
         ExtModeMexArgs = get_string_param('ExtModeMexArgs');
         DarwinOPIP = get_string_param('DarwinOPIP');
         ExpectedExtModeMexArgs = ['''' DarwinOPIP ''' 1 17725'];
         if ~strcmp(ExtModeMexArgs, ExpectedExtModeMexArgs)
             fprintf('### setting "external mode mex arguments" to "%s"\n', ExpectedExtModeMexArgs);
             set_param(gcs,'ExtModeMexArgs',ExpectedExtModeMexArgs);
         end
     end
     % ensure gen code only is checked
     GenCodeOnly = get_string_param('GenCodeOnly');
     if strcmp(GenCodeOnly,'off')
         fprintf('### setting "generate code only" to "on"\n');
         set_param(gcs,'GenCodeOnly','on');
     end
end

function copy_file(filename)
  [e,m] = copyfile(filename);
  if e == 0
    warning('While copying file "%s" to working directory', filename);
    warning(m);
  end
end

function em = isExtMode()
  em = 0;
  ExtMode = get_string_param('ExtMode');
  if strcmp(ExtMode, 'on')
    em = 1;
  end
end

function copy_additional_files()
     MatFileLogging = get_string_param('MatFileLogging');
     if strcmp(MatFileLogging,'on')
         copy_file(fullfile(matlabroot,'rtw','c','src','rt_logging.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','rt_logging.c'));
         copy_file(fullfile(matlabroot,'rtw','c','src','rt_mxclassid.h'));
         copy_file(fullfile(matlabroot,'simulink','include','rtw_matlogging.h'));
     end
     if isExtMode()
         copy_file(fullfile(matlabroot,'extern','include','matrix.h'));
         copy_file(fullfile(matlabroot,'extern','include','mex.h'));
         copy_file(fullfile(matlabroot,'extern','include','tmwtypes.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','dt_info.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','ext_share.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','ext_svr.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','ext_svr.c'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','ext_svr_transport.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','ext_test.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','ext_work.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','ext_work.c'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','ext_types.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','updown.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','updown.c'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','updown_util.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','ext_mode','common','upsup_public.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','rtiostream.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','rtiostream','rtiostreamtcpip','rtiostream_tcpip.c'));
         copy_file(fullfile(matlabroot,'rtw','c','src','rtiostream','utils','rtiostream_loadlib.h'));
         %copy_file(fullfile(matlabroot,'rtw','c','src','rtiostream','utils','rtiostream_utils.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','rtw_capi.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','rtw_modelmap.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','rtw_modelmap_logging.h'));
         copy_file(fullfile(matlabroot,'rtw','c','src','rtw_modelmap_utils.c'));
         copy_file(fullfile(matlabroot,'simulink','include','rtw_extmode.h'));
         copy_file(fullfile(matlabroot,'simulink','include','sysran_types.h'));
         copy_file(fullfile(matlabroot,'toolbox','coder','rtiostream','src','utils','rtiostream_utils.c'));
         copy_file(fullfile(matlabroot,'toolbox','coder','rtiostream','src','utils','rtiostream_utils.h'));
         % get current script directory
         scriptName = mfilename('fullpath');
         [scriptDirectory,~,~] = fileparts(scriptName);
         % matlabroot\rtw\c\src\ext_mode\common\rtiostream_interface.c has
         % a problem near line 193, here is a fixed one
         copy_file(fullfile(scriptDirectory,'rtiostream_interface.c'));
     end
     GenerateASAP2 = get_string_param('GenerateASAP2');
     if strcmp(GenerateASAP2, 'on')
         error('ASAP2 is not supported');
     end
     RTWCAPISignals = get_string_param('RTWCAPISignals');
     RTWCAPIParams = get_string_param('RTWCAPIParams');
     RTWCAPIStates = get_string_param('RTWCAPIStates');
     RTWCAPIRootIO = get_string_param('RTWCAPIRootIO');
     if strcmp(RTWCAPISignals,'on') || strcmp(RTWCAPIParams,'on') || strcmp(RTWCAPIStates,'on') || strcmp(RTWCAPIRootIO,'on')
         error('C API is not supported');
     end
end

function archiveName = package_archive(modelName)
  currentDirectory = pwd;
  archiveName = fullfile(currentDirectory, [modelName '.tar']);

  if exist(archiveName, 'file') == 2
    disp(['### removing existing archive "', archiveName, ...
          '"']);
    delete(archiveName);
  end

  disp(['### Creating archive "', archiveName, ...
        '" for model "', modelName, ...
        '" in working directory "', currentDirectory, ...
        '"']);

  fileList = dir(currentDirectory);
  archiveList = cell(length(fileList)-2, 1);
  c = 0;
  for i = 1:length(fileList)
    if ~strcmp(fileList(i).name, '.') && ~strcmp(fileList(i).name, '..')
      c = c+1;
      archiveList{c} = fileList(i).name;
    end
  end
  
  tar(archiveName, archiveList);
end

function send_archive(modelName, archiveName)

  % get current settings from Simulink
  DarwinOPIP = get_string_param('DarwinOPIP');
  DarwinOPPort = get_string_param('DarwinOPPort');
  DarwinOPTimeout = str2double(get_string_param('DarwinOPTimeout'));
  DarwinOPDisconnect = str2double(get_string_param('DarwinOPDisconnect'));
  DarwinOPUser = get_string_param('DarwinOPUser');
  DarwinOPPassword = get_string_param('DarwinOPPassword');
  DarwinOPWork = get_string_param('DarwinOPWork');

  % print current settings
  fprintf('### Settings are:\n');
  fprintf('###   IP = %s\n', DarwinOPIP);
  fprintf('###   Port = %s\n', DarwinOPPort);
  fprintf('###   Timeout = %d s\n', DarwinOPTimeout);
  fprintf('###   Disconnect = %d s\n', DarwinOPDisconnect);
  fprintf('###   User = %s\n', DarwinOPUser);
  fprintf('###   Password = %s\n', DarwinOPPassword);
  fprintf('###   Work = %s\n', DarwinOPWork);
  fprintf('###\n');

  % get current script directory
  scriptName = mfilename('fullpath');
  [scriptDirectory,~,~] = fileparts(scriptName);

  % build scp command line
  scpName = fullfile(scriptDirectory, '..', 'putty', 'pscp.exe');
  scpCmd = {scpName, ...
            '-l', ...
            DarwinOPUser, ...
            '-pw', ...
            DarwinOPPassword, ...
            '-P', ...
            DarwinOPPort, ...
            '-4', ...
            '-noagent', ...
            archiveName, ...
            [DarwinOPIP, ...
             ':', ...
             DarwinOPWork, ...
            ], ...
           };

  % initialize scp process
  scp_pb = java.lang.ProcessBuilder(scpCmd);
  scp_pb.redirectErrorStream(true);
  %disp('### SCP command line:');
  %disp(scp_pb.command());

  % build ssh command line
  sshName = fullfile(scriptDirectory, '..', 'putty', 'plink.exe');
  sshCmd = {sshName, ...
            '-l', ...
            DarwinOPUser, ...
            '-pw', ...
            DarwinOPPassword, ...
            '-P', ...
            DarwinOPPort, ...
            '-ssh', ...
            '-4', ...
            '-noagent', ...
            DarwinOPIP, ...
           };

  % initialize ssh process
  ssh_pb = java.lang.ProcessBuilder(sshCmd);
  ssh_pb.redirectErrorStream(true);
  %disp('### SSH command line:');
  %disp(ssh_pb.command());

  ssh_proc = [];
  scp_proc = [];

  new_line = char(10);

  try
    % start ssh process
    disp('### connecting to darwin');
    ssh_proc = ssh_pb.start();
    ssh_os = java.io.PrintWriter(ssh_proc.getOutputStream());
    
    if ssh_wait_ready(ssh_proc, -DarwinOPTimeout) ~= 0
        % accept RSA key
        disp('### accepting RSA key');
        ssh_os.write(['y', ...
                     new_line]);
        ssh_os.flush();
        ssh_wait_ready(ssh_proc, DarwinOPTimeout);
    end

    % configure remote shell
    disp('### configuring remote shell');
    ssh_os.write(['export PS1=\$', ...
                  new_line]);
    ssh_os.flush();
    ssh_wait_ready(ssh_proc, DarwinOPTimeout); % skip '$' in command
    ssh_wait_ready(ssh_proc, DarwinOPTimeout);

    % create base directory
    disp(sprintf('### creating base directory %s', DarwinOPWork)); %#ok
    ssh_os.write(['mkdir -p ', ...
                  DarwinOPWork, ...
                  new_line]);
    ssh_os.flush();
    ssh_wait_ready(ssh_proc, DarwinOPTimeout);

    % start scp process
    disp('### uploading archive to Darwin');
    scp_proc = scp_pb.start();
    scp_is = scp_proc.getInputStream();
    scp_proc.getOutputStream().close();
    % wait for scp to finish
    scp_proc.waitFor();
    % print SCP result
    while scp_is.available()
      fprintf('%c',scp_is.read());
    end
    scp_is.close();
    scp_proc.getErrorStream().close();
    % print scp status
    if scp_proc.exitValue() == 0
      disp('### upload command success');
    else
      disp('### upload command failure, return value is %d',scp_proc.exitValue());
      error('SCP command failure, return value is %d',scp_proc.exitValue());
    end
 
    disp('### kill existing programs');
    ssh_os.write(['kill `lsof -t /dev/ttyUSB0`', ...
                  new_line]);
    ssh_os.flush();
    ssh_wait_ready(ssh_proc, DarwinOPTimeout);

    disp('### removing existing files for this model');
    ssh_os.write(['rm -rf ', ...
                  DarwinOPWork, ...
                  '/', ...
                  modelName, ...
                  new_line]);
    ssh_os.flush();
    ssh_wait_ready(ssh_proc, DarwinOPTimeout);

    disp('### creating work directory');
    ssh_os.write(['mkdir -p ', ...
                  DarwinOPWork, ...
                  '/', ...
                  modelName, ...
                  new_line]);
    ssh_os.flush();
    ssh_wait_ready(ssh_proc, DarwinOPTimeout);
  
    disp('### moving to work directory');
    ssh_os.write(['cd ', ...
                  DarwinOPWork, ...
                  '/', ...
                  modelName, ...
                  new_line]);
    ssh_os.flush();
    ssh_wait_ready(ssh_proc, DarwinOPTimeout);

    [~,archiveFile,archiveExt] = fileparts(archiveName);
    disp('### extracting archive');
    ssh_os.write(['tar -xf ', ...
                  DarwinOPWork, ...
                  '/', ...
                  archiveFile, archiveExt, ...
                  new_line]);
    ssh_os.flush();
    ssh_wait_ready(ssh_proc, DarwinOPTimeout);

    disp('### making executable');
    ssh_os.write(['make -f ', ...
                  modelName, ...
                  '.mk', ...
                  new_line]);
    ssh_os.flush();
    ssh_wait_ready(ssh_proc, DarwinOPTimeout);

    disp('### check build success');
    ssh_os.write(['if [ -f ', modelName, ' ];', ...
                    'then printf "\x21\n" ;', ...
                  'fi', ...
                  new_line]);
    ssh_os.flush();
    status = ssh_wait_ready(ssh_proc, DarwinOPTimeout);
    if (status == 1)
      disp('### success');
      disp('### launching program');
      ssh_os.write(['./', ...
                    modelName, ...
                    '&', ...
                    new_line]);
      ssh_os.flush();
    else
      disp('### compilation failure');
    end

    ssh_wait_disconnect(ssh_proc, DarwinOPDisconnect);

    % close SSH connection
    disp('### closing connection');
    ssh_os.write(['exit', ...
                  new_line]);
    ssh_os.flush();
    % wait for the plink process to terminate
    ssh_proc.waitFor();
    % print ssh status
    if ssh_proc.exitValue() == 0
      disp('### SSH command success');
    else
      disp('### SSH command failure, return value is %d', ssh_proc.exitValue());
      error('SSH command failure, return value is %d', ssh_proc.exitValue());
    end
    if status ~= 1
      error('make returned an error and the executable was not created');
    end
  catch me
    if ssh_proc ~= [] %#ok
      ssh_proc.destroy();
    end
    if scp_proc ~= [] %#ok
      scp_proc.destroy();
    end
    rethrow(me);
  end
end

function val = get_string_param(name)
  val = get_param(gcs,name);
  switch class(val)
    case 'char'
      return;
    case {'single','double'}
      val = sprintf('%d', val);
    otherwise
      disp(sprintf('### unknown setting class %s', class(val))); %#ok
      error('unknown setting class %s', class(val));
  end
end

function error = ssh_wait_ready(ssh_proc, timeout)
  % no error
  error = 0;
  % get ssh input stream
  ssh_is = ssh_proc.getInputStream();
  % time reference
  start = tic;
  % check for timeout
  while toc(start) < abs(timeout)
    if ssh_is.available()
      c = ssh_is.read();
      if c == 36 % '$'
        return;
      else
        fprintf('%c', c);
      end
      if c == 33 % '!'
        error = 1;
      end
    else
      pause(0.01);
    end
  end
  disp('### SSH command timeout');
  error = 1;
  if timeout > 0
    error('SSH command timeout');
  end
end

function ssh_wait_disconnect(ssh_proc, timeout)
  % get ssh input stream
  ssh_is = ssh_proc.getInputStream();
  % time reference
  start = tic;
  % check for timeout
  while toc(start) < timeout
    if ssh_is.available()
      c = ssh_is.read();
      fprintf('%c', c);
    else
      pause(0.01);
    end
  end
end
