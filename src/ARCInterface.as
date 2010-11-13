package{

	import AugmentedReality.AROperation;
	import Game.Chess.ChessBoard;
  import Game.Piece;
	import Game.Chess.ChessPieces;

  //AugementedRealityChessInterface
	public class ARCInterface extends ChessPieces{
    public function GARInterface(){
    }

    private function getBoardIndex(x_axis:Vector.<Number>, origin:Vector.<Number>, z_axis:Vector.<Number>, piece:Vector.<Number>):Vector.<int>{
      var x_length:Number = (origin[0] - x_axis[0]) / 8;
      var z_length:Number = (z_axis[2] - origin[2]) / 8;

      var index:Vector.<Number> = new Vector.<Number>();
      index[0] = (origin[0] - piece[0]) % x_length;
      index[1] = (piece[2] - origin[2]) % z_length;

      return index;
    }

    public function getBoard(arop:AROperation):chessBoard{
      var board:ChessBoard = new ChessBoard();

      if(arop.getVisibleById(0) && arop.getVisibleById(1) && arop.getVisibleById(2)){
        var x_axis:Vector.<Number> = arop.getPositionbyId(0); //marker 0
        var origin:Vector.<Number> = arop.getPositionbyId(1); //marker 1
        var z_axis:Vector.<Number> = arop.getPositionbyId(2); //marker 2

        var col_size:Number = x_axis[0]

        //detect where pwans are
        for(var i:int = 4; i < 13; i += 1){
          if(arop.getVisibleById(i)){
            
          }
        }
      }else{
        trace("Can't detect all three board delimitator markers");
        return board;
      }
      
      
    }
  }

}

