package{

	import AugmentedReality.AROperation;
	import Game.Chess.ChessBoard;
  import Game.Piece;
	import Game.Chess.ChessPieces;

  //AugementedRealityChessInterface
	public class ARCInterface extends ChessPieces{
    public function ARCInterface(){
    }

    private function getBoardIndex(x_axis:Vector.<Number>, origin:Vector.<Number>, y_axis:Vector.<Number>, piece:Vector.<Number>):Vector.<int>{
      var x_length:int = (origin[0] - x_axis[0]) / 8;
      var y_length:int = (y_axis[1] - origin[1]) / 8;

      var index:Vector.<int> = new Vector.<int>();
      index[0] = (origin[0] - piece[0]) % x_length;
      index[1] = (piece[1] - origin[1]) % y_length;

      return index;
    }

    private function completeUserPieces(arop:AROperation, before:ChessBoard):ChessBoard{
      var board:ChessBoard = before;

      if(arop.getVisibleById(0) && arop.getVisibleById(1) && arop.getVisibleById(2)){
        var x_axis:Vector.<Number> = arop.getPositionbyId(0); //marker 0
        var origin:Vector.<Number> = arop.getPositionbyId(1); //marker 1
        var y_axis:Vector.<Number> = arop.getPositionbyId(2); //marker 2

        //detects where white pwans are
        for(var i:int = 4; i < 12; i += 1){
          if(arop.getVisibleById(i)){
            var index:Vector.<int> = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(i));
            board.setPiece(index[1], index[0], new Piece(WHITE_PAWN));
          }
        }

        //detects where white towers are
        for(var i:int = 12; i < 14; i += 1){
          if(arop.getVisibleById(i)){
            var index:Vector.<int> = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(i));
            board.setPiece(index[1], index[0], new Piece(WHITE_TOWER));
          }
        }

        //detects where white knights are
        for(var i:int = 14; i < 16; i += 1){
          if(arop.getVisibleById(i)){
            var index:Vector.<int> = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(i));
            board.setPiece(index[1], index[0], new Piece(WHITE_KNIGHT));
          }
        }

        //detects where white bishops are
        for(var i:int = 16; i < 18; i += 1){
          if(arop.getVisibleById(i)){
            var index:Vector.<int> = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(i));
            board.setPiece(index[1], index[0], new Piece(WHITE_BISHOP));
          }
        }

        //detects where the white queen is
        if(arop.getVisibleById(18)){
          var index:Vector.<int> = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(18));
          board.setPiece(index[1], index[0], new Piece(WHITE_QUEEN));
        }

        //detects where the white knight is
        if(arop.getVisibleById(19)){
          var index:Vector.<int> = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(19));
          board.setPiece(index[1], index[0], new Piece(WHITE_KING));
        }

      }else{
        trace("Can't detect all three board delimitator markers");
        return board;
      }      
    }

    /*private function updateComputerPieces(arop:AROperation, board:ChessBoard){

    }*/

    public function getBoard(before:ChessBoard, arop:AROperation):ChessBoard{
      var actual:ChessBoard;

      actual = completeUserPieces(arop, before);

      return actual; 
    }
  }

}

