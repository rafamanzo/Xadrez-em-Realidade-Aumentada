package Interface{
  import Game.Chess.ChessBoard;
  import Game.Chess.ChessPieces;
  import Game.PieceType;
  import Game.Piece;
  import AugmentedReality.AROperation;

  public class ComputerPiecesHandler extends ChessPieces{
    private var pawn_count:Number;
    private var tower_count:Number;
    private var knight_count:Number;
    private var bishop_count:Number;
    private var queen_count:Number;
    private var king_count:Number;

    public function ComputerPiecesHandler(){
      pawn_count = 0;
      tower_count = 0;
      knight_count = 0;
      bishop_count = 0;
      queen_count = 0;
      king_count = 0;
    }

    private function getBoardPosition(x_axis: Vector.<Number>, origin:Vector.<Number>, y_axis:Vector.<Number>, index:Vector.<int>):Vector.<Number>{
      var x_length:int = (origin[0] - x_axis[0]) / 8;
      var y_length:int = (y_axis[1] - origin[1]) / 8;
      var z_var_on_x:Number = ((origin[2] - x_axis[2]) / 8) * index[0];
      var z_var_on_y:Number = ((y_axis[2] - origin[2]) / 8) * index[1];

      var position:Vector.<Number> = new Vector.<Number>();

      position[0] = origin[0] + (x_length * index[0]);
      position[1] = origin[1] + (y_length * index[1]);
      //we take the maximum of the variations on x and y to determinate the z of the piece
      position[2] = origin[2];
      if(z_var_on_x > z_var_on_y){
        position[2] += z_var_on_x;
      }else{
        position[2] += z_var_on_y;
      }

      return position;
    }

    private function switchPieces(type:PieceType, x_axis: Vector.<Number>, origin:Vector.<Number>, y_axis:Vector.<Number>, index:Vector.<int>, arop:AROperation):void{
      if(type.sameName(BLACK_PAWN)){
				arop.setVisibleById(pawn_count, true);
        arop.setPositionById(pawn_count, getBoardPosition(x_axis, origin, y_axis, index));
        pawn_count += 1;
			}else if(type.sameName(BLACK_TOWER)){
        arop.setVisibleById(tower_count + 8, true);
        arop.setPositionById(tower_count + 8, getBoardPosition(x_axis, origin, y_axis, index));
        tower_count += 1;
      }else if(type.sameName(BLACK_KNIGHT)){
        arop.setVisibleById(knight_count + 10, true);
        arop.setPositionById(knight_count + 10, getBoardPosition(x_axis, origin, y_axis, index));
        knight_count += 1;
      }else if(type.sameName(BLACK_BISHOP)){
        arop.setVisibleById(bishop_count, true);
        arop.setPositionById(bishop_count, getBoardPosition(x_axis, origin, y_axis, index));
        bishop_count += 1;
      }else if(type.sameName(BLACK_QUEEN)){
        arop.setVisibleById(14, true);
        arop.setPositionById(14, getBoardPosition(x_axis, origin, y_axis, index));
        queen_count += 1;
      }else if(type.sameName(BLACK_KING)){
        arop.setVisibleById(15, true);
        arop.setPositionById(15, getBoardPosition(x_axis, origin, y_axis, index));
        king_count += 1;
      }else{
        trace("Unexpected PieceType");
      }
    }

    private function hideUnusedObjects(arop:AROperation):void{
      var i:int;

      for(i = pawn_count; i < 8; i += 1){
        arop.setVisibleById(i, true);
      }
      
      for(i = (tower_count + 8); i < 10; i += 1){
        arop.setVisibleById(i, true);
      }
      
      for(i = (tower_count +10); i < 12; i += 1){
        arop.setVisibleById(i, true);
      }

      for(i = (tower_count + 12); i < 14; i += 1){
        arop.setVisibleById(i, true);
      }

      if(queen_count != 1){
        arop.setVisibleById(14, true);
      }

      if(king_count != 1){
        arop.setVisibleById(15, true);
      }

    }

    public function updateComputerPieces(arop:AROperation, board:ChessBoard):void{
      if(arop.getVisibleById(0) && arop.getVisibleById(1) && arop.getVisibleById(2)){
        var x_axis:Vector.<Number> = arop.getPositionById(0); //marker 0
        var origin:Vector.<Number> = arop.getPositionById(1); //marker 1
        var y_axis:Vector.<Number> = arop.getPositionById(2); //marker 2
        var piece:Piece;
        var index:Vector.<int>;

        for(var i:int = 0; i < 8; i +=1){
          for(var j:int = 0; j < 8; j += 1){
            piece = board.getPiece(i,j);
            if(piece.sameColor(BLACK_PAWN)){
              index = new Vector.<int>();
              index[0] = i;
              index[1] = j;
              switchPieces(piece.getType(), x_axis, origin, y_axis, index, arop);
            }
          }
        }

        hideUnusedObjects(arop); 
      }else{
        trace("Can't detect all three board delimitator markers");
      }
    }
  }
  
}
