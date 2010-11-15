/**
 * @author rafael
 */
package Game {
	public class PieceType {
		private var name:String;
		private var color:String;
		
		public function PieceType(n:String = "", c:String = "") {
			name = n;
			color = c;
		}

    public function getType():PieceType{
      var ret:PieceType = new PieceType(name, color);
      return ret;
    }
		
		public function getName():String{
			return name;
		}
		
		public function getColor():String{
			return color;
		}
		
		public function sameType(p:PieceType):Boolean{
			if(p.getName() == name && p.getColor() == color){
				return true;
			}else{
				return false;
			}
		}

    public function sameColor(p:PieceType):Boolean{
      if(p.getColor() == color){
        return true;
      }else{
        return false;
      }
    }
		
    public function sameName(p:PieceType):Boolean{
      if(p.getName() == name){
        return true;
      }else{
        return false;
      }
    }

		public function isNull():Boolean{
			if(name == ""){
				return true;
			}else{
				return false;
			}
		}
	}
}
