MXMLC=~/.flex/bin/mxmlc
FLAGS=-sp ../FLARManager_v1_0_1/src -library-path ../FLARManager_v1_0_1/libs/Papervision3D_2.1.920.swc -static-link-runtime-shared-libraries
DEBUG_FLAGS=-debug -benchmark
Main.swf: Main.as Scenario.as AugmentedReality/ARObject.as AugmentedReality/AROperation.as
	$(MXMLC) Main.as $(FLAGS)
debug: Main.as Scenario.as AugmentedReality/ARObject.as AugmentedReality/AROperation.as
	$(MXMLC) Main.as $(FLAGS) $(DEBUG_FLAGS)        

