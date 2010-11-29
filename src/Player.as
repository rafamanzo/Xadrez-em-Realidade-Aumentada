package{
  import Game.Piece;
  import Game.Chess.Validator;
  import Game.Chess.ChessBoard;
  import Game.Chess.ChessPieces;
  import AugmentedReality.AROperation;
  import Interface.ARCInterface;
  import flash.events.KeyboardEvent;
  import flash.events.Event;

  public class Player extends ChessPieces{
    private var actual:ChessBoard;
    private var before:ChessBoard;
    private var validator:Validator;
    private var arci:ARCInterface;
    private var arop:AROperation;
    private var main:Main;
    private var getAROp:Function;

    public function Player(m:Main, f:Function){
      validator = new Validator();
      arci = new ARCInterface();

      main = m;

      actual = new ChessBoard();

			if (main.stage) init();
			else main.addEventListener(Event.ADDED_TO_STAGE, init);
      
      //init();
      getAROp = f;
      arop = getAROp();      
    }

    private function init(e:Event = null):void{
      var i:Number;
      
      for(i = 0; i < 8; i += 1){
        actual.setPiece(1, i, new Piece(WHITE_PAWN));
        actual.setPiece(6, i, new Piece(BLACK_PAWN));
      }
      
      actual.setPiece(0, 0, new Piece(WHITE_TOWER));
      actual.setPiece(0, 7, new Piece(WHITE_TOWER));
      actual.setPiece(7, 0, new Piece(BLACK_TOWER));
      actual.setPiece(7, 7, new Piece(BLACK_TOWER));
      actual.setPiece(0, 1, new Piece(WHITE_KNIGHT));
      actual.setPiece(0, 6, new Piece(WHITE_KNIGHT));
      actual.setPiece(7, 1, new Piece(BLACK_KNIGHT));
      actual.setPiece(7, 6, new Piece(BLACK_KNIGHT));
      actual.setPiece(0, 2, new Piece(WHITE_BISHOP));
      actual.setPiece(0, 5, new Piece(WHITE_BISHOP));
      actual.setPiece(7, 2, new Piece(BLACK_BISHOP));
      actual.setPiece(7, 5, new Piece(BLACK_BISHOP));
      actual.setPiece(0, 3, new Piece(WHITE_KING));
      actual.setPiece(0, 4, new Piece(WHITE_QUEEN));
      actual.setPiece(7, 3, new Piece(BLACK_KING));
      actual.setPiece(7, 4, new Piece(BLACK_QUEEN));
      
      main.stage.addEventListener(KeyboardEvent.KEY_DOWN, commands);
    }

    public function commands(e:KeyboardEvent):void{
      //space is the code 32
      trace("CharCode:"+e.charCode);
      if(e.charCode == 32){
        userMove();       
      }else if(e.charCode == 122 && e.ctrlKey){
        undo();
      }
    }

    private function userMove():void{
      var aux_board:ChessBoard = before;
 
      if(arop == null){
        arop = getAROp();
      }
     
      if(arop != null){      
        before = actual;
        actual = arci.getBoard(before, arop);

        trace("Validating board...");
        if(!validator.validateNewBoard(before, actual)){
          trace("Invalid board.");
          actual = before;
          before = aux_board;
        }
      }
    }

    private function undo():void{
      if(actual == before){
        trace("You can only undo one time");
      }else{
        actual = before;
      }
    }
  }
}
