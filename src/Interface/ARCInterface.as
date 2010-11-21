package Interface{
	import AugmentedReality.AROperation;
	import Game.Chess.ChessBoard;

  //AugementedRealityChessInterface
	public class ARCInterface{
    public function ARCInterface(){
    }

    public function getBoard(before:ChessBoard, arop:AROperation):ChessBoard{
      var actual:ChessBoard;
      var uphandler:UserPiecesHandler = new UserPiecesHandler();

      actual = uphandler.completeUserPieces(arop, before);

      return actual; 
    }

    public function updatePiecesPosition(board:ChessBoard, arop:AROperation):void{
      var cphandler:ComputerPiecesHandler = new ComputerPiecesHandler();

      cphandler.updateComputerPieces(arop, board);
    }
  }

}

