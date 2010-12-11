package Game.Chess{
  import Game.Piece;
  import Game.PieceType;

  public class DummyAI{
    private var validator:Validator;

    public function DummyAI(){
      validator = new Validator();
    }

    public function play(before:ChessBoard):ChessBoard{
      var actual:ChessBoard = before;
      var newx:int;
      var newy:int;
      var tries:int = 0;

      for(var i:int = 0; i < 8; i += 1){
        for(var j:int = 0; j < 8; j += 1){
          while(!validator.validateNewBoard(before, actual) && tries < 65){
            actual = before;

            newx = Math.round(Math.random() * 7);
            newy = Math.round(Math.random() * 7);
            
            actual.setPiece(i, j, new Piece(new PieceType("", "")));
            actual.setPiece(newy, newx, before.getPiece(i, j));
          }

          if(tries < 65){
            return actual;
          }
        }
      }

      return before;
    }
  }
}
