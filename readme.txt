This directory and its subdirectories contain Matlab code and Simulink libraries to communicate with the DarwinOP humanoid robot.

About this library:

At this time, only the "Software In Loop (SIL)" mode is supported and the robot must execute the program /darwin/Linux/project/instrumentation/instrumentation from the darwinop-ens repository located at https://github.com/darwinop-ens/darwin-op

This project is still under heavy development and might support embedded development "Hardware In Loop" (HIL) in the future.

Installation steps:

1. Open Matlab
2. Download zip file https://github.com/darwinop-ens/darwin-op/archive/master.zip
3. Extract this archive to your local hard disk
4. Browse to darwinoplib
5. Execute script darwinoplib_setup.m

You should get "DarwinOP Target Path Setup Complete.", then you can select your language (English or French as of now).

6. Restart Matlab

You should now have a Simulink library named "DarwinOP Lib", demos are located in darwinoplibdemos