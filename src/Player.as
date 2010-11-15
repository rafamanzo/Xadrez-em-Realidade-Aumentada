package{
  import Game.Piece;
  import Game.Chess.Validator;
  import Game.Chess.ChessBoard;
  import Game.Chess.ChessPieces;
  import AugmentedReality.AROperation;
  import flash.events.KeyboardEvent;

  public class Player extends ChessPieces{
    private var actual:ChessBoard;
    private var before:ChessBoard;
    private var validator:Validator;
    private var arci:ARCInterface;
    private var arop:AROperation;

    public function Player(m:Main, a:AROperation){
      var i:Number;

      validator = new Validator();
      arci = new ARCInterface();

      actual = new ChessBoard();
      
      for(i = 0; i < 8; i += 1){
        actual.setPiece(1, i, new Piece(WHITE_PAWN));
        //actual.setPiece(6, i, new Piece(BLACK_PAWN));
      }
      
      actual.setPiece(0, 0, new Piece(WHITE_TOWER));
      actual.setPiece(0, 7, new Piece(WHITE_TOWER));
      //actual.setPiece(7, 0, new Piece(BLACK_TOWER));
      //actual.setPiece(7, 7, new Piece(BLACK_TOWER));
      actual.setPiece(0, 1, new Piece(WHITE_KNIGHT));
      actual.setPiece(0, 6, new Piece(WHITE_KNIGHT));
      //actual.setPiece(7, 1, new Piece(BLACK_KNIGHT));
      //actual.setPiece(7, 6, new Piece(BLACK_KNIGHT));
      actual.setPiece(0, 2, new Piece(WHITE_BISHOP));
      actual.setPiece(0, 5, new Piece(WHITE_BISHOP));
      //actual.setPiece(7, 2, new Piece(BLACK_BISHOP));
      //actual.setPiece(7, 5, new Piece(BLACK_BISHOP));
      actual.setPiece(0, 3, new Piece(WHITE_KING));
      actual.setPiece(0, 4, new Piece(WHITE_QUEEN));
      //actual.setPiece(7, 3, new Piece(BLACK_KING));
      //actual.setPiece(7, 4, new Piece(BLACK_QUEEN));
      
      arop = a;

      m.addEventListener(KeyboardEvent.KEY_DOWN, commands);      
    }

    private function commands(e:KeyboardEvent):void{
      //space is the code 32
      if(e.charCode == 32){
         userMove();       
      }
    }

    private function userMove():void{
      var aux_board:ChessBoard = before;
      before = actual;
      actual = arci.getBoard(before, arop);

      if(!validator.validateNewBoard(before, actual)){
        trace("Invalid board.");
        actual = before;
        before = aux_board;
      }
    }
  }
}
