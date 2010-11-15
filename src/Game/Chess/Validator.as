package Game {
	public class Validator extends ChessPieces{
		public function Validator() {
			
		}
		
		public function valideteNewBoard(before:ChessBoard, actual:ChessBoard):Boolean{
			var changes:Vector.<Vector.<int>> = new Vector.<Vector.<int>>();
			var change_index:int = 0;
				
			for(var i:int = 0; i < 8; i += 1){
				for(var j:int = 0; j < 8; j += 1){
					if(!before.getPiece(i,j).sameType(actual.getPiece(i,j).getType())){
						changes[change_index][0] = i;
						changes[change_index][1] = j;
						change_index += 1;
					}
				}
			}
			
			if(changes.length == 2){					
				if(actual.getPiece(changes[1][0], changes[1][1]).isNull()){
					return switchPieces(actual.getPiece(changes[0][0], changes[0][1]).getType(), changes[1], changes[0]);
				}else if(actual.getPiece(changes[0][0], changes[0][1]).isNull()){
					return switchPieces(actual.getPiece(changes[1][0], changes[1][1]).getType(), changes[0], changes[1]);	
				}else{
          trace("None cordinate was left empty on new board");
					return false; //always one coordinate was left empty				
				}
			}else{
        trace("The number of changes between the old board and the new one are different than 2");
				return false; //always two coordinates changes his values. if more or less than two have changed, something went wrong
			}
		}
		
		private function switchPieces(type:PieceType, origin:Vector.<int>, destiny:Vector.<int>, before:ChessBoard):Boolean{
			if(type.sameName(WHITE_PAWN)){
				return validatePawnMove(origin, destiny, before, type);		
			}else if(type.sameName(WHITE_TOWER)){
        return validateTowerMove(origin, destiny, before, type);
      }else if(type.sameName(WHITE_KNIGHT)){
        return validateKnightMove(origin, destiny, before, type);
      }else if(type.sameName(WHITE_BISHOP)){
        return validateBishopMove(origin, destiny, before, type);
      }else if(type.sameName(WHITE_QUEEN)){
        return validateQueenMove(origin, destiny, before, type);
      }else if(type.sameName(WHITE_KING)){
        return validateKingMove(origin, destiny, before, type);
      }else{
        trace("Unexpected PieceType");
        return false;
      }
		}

    private function movingToSameColor(destiny:Vector.<int>, before:ChessBoard, type:PieceType):Boolean{
      if(before.getPiece(destiny[0], destiny[1]).sameColor(type)){
        return false;
      }else{
        trace("Trying to move to a place with a piece of the same color.");
        return true;
      }
    }
		
		private function validatePawnMove(origin:Vector.<int>, destiny:Vector.<int>, before:ChessBoard, type:PieceType):Boolean{
			var x_desloc:Number = origin[0] - destiny[0];
      var y_desloc:Number = origin[1] - destiny[1];

      if(x_desloc > 1 || x_desloc < -1 || y_desloc > 1 || y_desloc < -1){
        trace("Invalid pawn move. Piece moved more than one coordinate");
        return false;
      }else if(movingToSameColor(destiny, before, type)){
        trace("Invalid pawn move.");
        return false;
      }else{  
        return true;
      }
		}
		
		private function validateKnightMove(origin:Vector.<int>, destiny:Vector.<int>, before:ChessBoard, type:PieceType):Boolean{
			var x_desloc:Number = origin[0] - destiny[0];
      var y_desloc:Number = origin[1] - destiny[1];

      if(movingToSameColor(destiny, before, type)){
        trace("Invalid knight move.");
        return false;
      }else if((x_desloc == 3 || x_desloc == -3) && (y_desloc == 1 || y_desloc == -1)){
        return true;
      }else if((y_desloc == 3 || y_desloc == -3) && (x_desloc == 1 || x_desloc == -1){
        return true;
      }else{
        trace("Invalid knight move. Invalid deslocation pattern.");
        return false;
      }
		}

    private function validateStraightMove(origin:Vector.<int>, destiny:Vector.<int>, before:ChessBoard, type:PieceType):Boolean{
      var x_desloc:Number = origin[0] - destiny[0];
      var y_desloc:Number = origin[1] - destiny[1];

      if(x_desloc != 0 && y_desloc != 0){
        trace("Not a straight move.");
        return false;
      }else if(x_desloc > 0){
        for(var i:int = origin[0] - 1; i > destiny[0]; i += -1){
          if(!before.getPiece(i, origin[1]).isNull()){
            trace("There is a pice on the way.");
            return false;
          }
        }
      }else if(x_desloc < 0){
        for(var i:int = origin[0] + 1; i < destiny[0]; i += 1){
          if(!before.getPiece(i, origin[1]).isNull()){
            trace("There is a pice on the way.");
            return false;
          }
        }
      }else if(y_desloc > 0){
        for(var j:int = origin[1] - 1; j > destiny[1]; j += -1){
          if(!before.getPiece(origin[0], j).isNull()){
            trace("There is a pice on the way.");
            return false;
          }
        }
      }else if(y_desloc < 0){
        for(var j:int = origin[1] + 1; j < destiny[1]; j += 1){
          if(!before.getPiece(origin[0], j).isNull()){
            trace("There is a pice on the way.");
            return false;
          }
        }
      }else if(movingToSameColor(destiny, before, type)){
        trace("Invalid stright move.");
        return false;
      }

      return true;
    }
		
		private function validateTowerMove(origin:Vector.<int>, destiny:Vector.<int>, before:ChessBoard, type:PieceType):Boolean{
			return validateStraightMove(origin, destiny, before, type);
		}

    private function validateDiagonalMove(origin:Vector.<int>, destiny:Vector.<int>, before:ChessBoard, type:PieceType):Boolean{
      var x_desloc:Number = origin[0] - destiny[0];
      var y_desloc:Number = origin[1] - destiny[1];
      var sgn_x_desloc:Number = 1;
      var sgn_y_desloc:Number = 1;

      if(x_desloc < 0){
        sgn_x_desloc = -1;
        x_desloc *= -1;
      }
      if(y_desloc < 0){
        sgn_y_desloc = -1;
        y_desloc *= -1;
      }

      if(x_desloc != y_desloc){
        trace("Not a diagonal move");
        return false;
      }else if(movingToSameColor(destiny, before, type)){
        trace("Not a diagonal move");
        return false;
      }

      for(var i:int = 0; i < x_desloc; i += 1){
        var row:Number = origin[0] - sgn_x_desloc*i;
        var col:Number = origin[1] - sgn_y_desloc*i;

        if(!before.getPiece(row, col).isNull()){
          trace("There is a pice on the way.");
          return false;
        }
      }

      return true;
    }
		
		private function validateBishopMove(origin:Vector.<int>, destiny:Vector.<int>, before:ChessBoard, type:PieceType):Boolean{
			return validateDiagonalMove(origin, destiny, before, type);
		}
		
		private function validateQueenMove(origin:Vector.<int>, destiny:Vector.<int>, before:ChessBoard, type:PieceType):Boolean{
			if(validateStraightMove(origin, destiny, before, type) || validateDiagonalMove(origin, destiny, before, type)){
        return true;
      }else{
        trace("Invalid queen move");
        return false;
      }
		}
		
		private function validateKingMove(origin:Vector.<int>, destiny:Vector.<int>, before:ChessBoard, type:PieceType):Boolean{
      var x_desloc:Number = origin[0] - destiny[0];
      var y_desloc:Number = origin[1] - destiny[1];
			
      if(x_desloc > 1 || x_desloc < -1 || y_desloc > 1 || y_desloc < -1){
        trace("Invalid king move. Piece moved more than one coordinate");
        return false;
      }

      for(var i:int = 0; i < 8; i += 1){
        for(var j:int = 0; j < 8; j+= 1){
          if(i != destiny[0] && j != destiny[1]){
            var piece:Piece = before.getPiece(i,j);
            if(!piece.sameColor(type)){
              var piece_origin:Vector.<int> = Vector.<int>();
              piece_origin[0] = i;
              piece_origin[1] = j;

              if(switchPieces(piece.getType(), piece_origin, origin, before)){
                trace("Invalid king move. You are giving your king.");
                return false;
              } 
            }
          }
        }
      }

      return true; 
		}
	}

}
