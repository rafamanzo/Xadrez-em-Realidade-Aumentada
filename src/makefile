MXMLC=~/.flex/bin/mxmlc
FLAGS=-sp ../FLARManager_v1_0_1/src -library-path ../FLARManager_v1_0_1/libs/Papervision3D_2.1.920.swc -static-link-runtime-shared-libraries -default-script-limits 1000 100
DEBUG_FLAGS=-debug -benchmark
FILES=Main.as Scenario.as Player.as HelpScreen.as AugmentedReality/ARObject.as AugmentedReality/AROperation.as AugmentedReality/ARCronometer.as AugmentedReality/ARIndependentObject.as Game/Board.as Game/Piece.as Game/PieceType.as Game/Chess/ChessBoard.as Game/Chess/ChessPieces.as Game/Chess/Validator.as Game/Chess/DummyAI.as Interface/ARCInterface.as Interface/ComputerPiecesHandler.as Interface/UserPiecesHandler.as

Main.swf: $(FILES)
	$(MXMLC) Main.as $(FLAGS)
debug: $(FILES)
	$(MXMLC) Main.as $(FLAGS) $(DEBUG_FLAGS)	
