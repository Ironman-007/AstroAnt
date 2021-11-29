# AstroAnt
Phase II of Rovables

The AstroAnt is the second generation of the Rovable project. The AstroAant also use magnetic wheels to attach to magnetic surface.

The AstroAnt is a modular design, and can carry different sensors to finish different kinds of diognostic missions, such as finding abnormal heating source, check CO2 leakage, detect metal flaw, and streaming video from remote.

Files descriptions:

- The 3D model of the robot is in the [Small_magnets_R821_with_gearbox](3dmodel/Small_magnets_R821_with_gearbox).

- The firmware of the robot is in [AstroAnt](Software/AstroAnt).

- The PC program (UI) is the [gui.py](Software/GUI_python/gui.py). Open with command line: ```python3 gui.py```

- The PCB design is in the [PCB](PCB). The [mainboard_v1](PCB/Mainboard/mainboard_v1/) is the design of the main control board, developed with KiCAD. The others are sensor modules design.

- The software of the central station for collecting data and distributing command is in [central_station](Software/Central_station/central_station/).

- The software of the central station for Camera in [cam_central](Software/Central_station/cam_central/).

- The Box design for the Zero-G flight test is in [Ant_Test_Box_DEC](3dmodel/Ant_Box_DEC/).
