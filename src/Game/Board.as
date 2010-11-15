package Game {
	public class Board {
		private var map:Vector.<Vector.<Piece>>;
		
		public function Board(row:Number = 1, col:Number = 1) {
			map = new Vector.<Vector.<Piece>>();
			for(var i:int = 0; i < row; i+=1){
        map[i] = new Vector.<Piece>();
				for(var j:int = 0; j < col; j+=1){
					map[i][j] = new Piece(new PieceType("", ""));
				}
			}
		}
		
		public function setPiece(row:Number, col:Number, piece:Piece):Boolean{
			map[row][col] = piece;
			return true;
		}
		
		public function getPiece(row:Number, col:Number):Piece{
			return map[row][col];
		}
	}

}
