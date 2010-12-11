package {
	import flash.display.Shape;
	import flash.display.DisplayObject;
  import flash.text.TextField;
  import flash.text.TextFieldAutoSize;
  import flash.text.TextFormat;

  public class HelpScreen{
		private var main:Main;
		private var do_background:DisplayObject;
		private var do_text:DisplayObject;
		private var width:int;
		private var height:int;
		private var text:TextField;
    private var background:Shape;

    public function HelpScreen(m: Main, w: int, h:int):void{
      var format:TextFormat = new TextFormat();
      format.size = 24;
      format.color = 0x000000;
      format.font = "Liberation Sans";

      main = m;
      width = w;
      height = h;

      background = new Shape();
			background.graphics.beginFill(0x999999);
			background.graphics.drawRect(0, 0, width, height);
			background.graphics.endFill();

      text = new TextField();
      //text.embedFonts = true;
      text.htmlText = "<font face='Liberation Sans' size='48'>Welcome to the Aumented Relity Chess!<BR><BR>Here you can read at any time in the game a few instructions about the game.<BR><BR>First, the board tags (see the user manual) must be placed in the three corners of your chess board.<BR>Second, put your pieces in position on the board and press SPACE to start the game.<BR>Third, every time you make a move you have to press SPACE too.<BR><BR>Enjoy it!</font>";
      text.text = "Welcome to the Aumented Relity Chess!\n\nHere you can read at any time in the game a few instructions about the game.\n\nFirst, the board tags (see the user manual) must be placed in the three corners of your chess board.\nSecond, put your pieces in position on the board and press SPACE to start the game.\nThird, every time you make a move you have to press SPACE too.\n\nEnjoy it!";
      text.autoSize = TextFieldAutoSize.CENTER;
      //text.defaultTextFormat = format;

      do_background = null;
      do_text = null;
    }

    public function show():void{
      do_background = main.addChild(background);
      do_text = main.addChild(text);

      do_text.x = 20;
      do_text.y = 20;
    }

    public function hide():void{
      main.removeChild(do_background);
			main.removeChild(do_text);
      do_background = null;
      do_text = null;
    }

    public function visible():Boolean{
      if(do_background == null  && do_text == null){
        return false;
      }else{
        return true;
      }
    }
  }
}
