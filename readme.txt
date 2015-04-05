Matlab Simulink Library for the darwinop-ens robot

Development version

Stable releases can be viewed and downloaded from the following links:
v1.0 https://github.com/darwinop-ens/simulink/tree/v1.0

This directory and its subdirectories contain Matlab code and Simulink libraries to communicate with the DarwinOP humanoid robot.

About this library:

At this time, the "Software In Loop (SIL)" and "Hardware In Loop (HIL)" modes are supported:
- During simulation, Matlab Simulink communicates with the robot using a custom instrumentation protocol with embedded program /darwin/Linux/project/instrumentation/instrumentation from the darwinop-op repository located at https://github.com/darwinop-ens/darwin-op . The installation steps are described at https://github.com/darwinop-ens/darwin-op/wiki/Installation-guide
- During execution, Matlab generates a C++ program based on the Simulink model, this program is automatically sent, compiled and executed on the robot.

Installation steps:

1. Open Matlab
2. Download zip file https://github.com/darwinop-ens/darwin-op/archive/master.zip
3. Extract this archive to your local hard disk
4. Execute script darwinoplib_setup.m located in directory subdirectory darwinoplib

You should get "DarwinOP Target Path Setup Complete.", then you can select your language (English or French as of now).

5. Restart Matlab

You should now have a Simulink library named "DarwinOP Lib", demos are located in darwinoplibdemos
