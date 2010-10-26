MXMLC=~/.flex/bin/mxmlc
FLAGS=-sp ../FLARManager_v1_0_1/src -library-path ../FLARManager_v1_0_1/libs/Papervision3D_2.1.920.swc -static-link-runtime-shared-libraries -default-script-limits 1000 100
DEBUG_FLAGS=-debug -benchmark
FILES=Main.as Scenario.as AugmentedReality/ARObject.as AugmentedReality/AROperation.as AugmentedReality/ARCronometer.as

Main.swf: $(FILES)
	$(MXMLC) Main.as $(FLAGS)
debug: $(FILES)
	$(MXMLC) Main.as $(FLAGS) $(DEBUG_FLAGS)	
