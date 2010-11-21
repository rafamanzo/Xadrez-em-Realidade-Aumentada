package Interface{
	import AugmentedReality.AROperation;
	import Game.Chess.ChessBoard;
  import Game.Piece;
	import Game.Chess.ChessPieces;

  public class UserPiecesHandler extends ChessPieces{
    public function UserPiecesHandler(){
    }

    //used to determinate the board index of one of the user's pieces
    private function getBoardIndex(x_axis:Vector.<Number>, origin:Vector.<Number>, y_axis:Vector.<Number>, piece:Vector.<Number>):Vector.<int>{
      var x_length:int = (origin[0] - x_axis[0]) / 8;
      var y_length:int = (y_axis[1] - origin[1]) / 8;

      var index:Vector.<int> = new Vector.<int>();
      index[0] = (origin[0] - piece[0]) % x_length;
      index[1] = (piece[1] - origin[1]) % y_length;

      return index;
    }

    public function completeUserPieces(arop:AROperation, before:ChessBoard):ChessBoard{
      var board:ChessBoard = before;
      var i:int = 0;
      var index:Vector.<int>;

      if(arop.getVisibleById(0) && arop.getVisibleById(1) && arop.getVisibleById(2)){
        var x_axis:Vector.<Number> = arop.getPositionById(0); //marker 0
        var origin:Vector.<Number> = arop.getPositionById(1); //marker 1
        var y_axis:Vector.<Number> = arop.getPositionById(2); //marker 2

        //detects where white pwans are
        for(i = 4; i < 12; i += 1){
          if(arop.getVisibleById(i)){
            index = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(i));
            board.setPiece(index[1], index[0], new Piece(WHITE_PAWN));
          }
        }

        //detects where white towers are
        for(i = 12; i < 14; i += 1){
          if(arop.getVisibleById(i)){
            index = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(i));
            board.setPiece(index[1], index[0], new Piece(WHITE_TOWER));
          }
        }

        //detects where white knights are
        for(i = 14; i < 16; i += 1){
          if(arop.getVisibleById(i)){
            index = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(i));
            board.setPiece(index[1], index[0], new Piece(WHITE_KNIGHT));
          }
        }

        //detects where white bishops are
        for(i = 16; i < 18; i += 1){
          if(arop.getVisibleById(i)){
            index = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(i));
            board.setPiece(index[1], index[0], new Piece(WHITE_BISHOP));
          }
        }

        //detects where the white queen is
        if(arop.getVisibleById(18)){
          index = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(18));
          board.setPiece(index[1], index[0], new Piece(WHITE_QUEEN));
        }

        //detects where the white knight is
        if(arop.getVisibleById(19)){
          index = getBoardIndex(x_axis, origin, y_axis, arop.getPositionById(19));
          board.setPiece(index[1], index[0], new Piece(WHITE_KING));
        }

      }else{
        trace("Can't detect all three board delimitator markers");
      }

      return board;      
    }

  }
}
