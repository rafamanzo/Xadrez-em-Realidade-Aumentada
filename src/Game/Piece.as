/**
 * @author rafael
 */
package Game {
	public class Piece extends PieceType{								
		public function Piece(t:PieceType):void {
			super(t.getName(), t.getColor());
		}
	}

}