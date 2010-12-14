package {
	import flash.display.Shape;
	import flash.display.DisplayObject;
  import flash.text.TextField;
  import flash.text.TextFieldAutoSize;
  import flash.text.TextFormat;

  public class MenuScreen{
		private var main:Main;
		private var do_background:DisplayObject;
		private var do_text:DisplayObject;
		private var width:int;
		private var height:int;
		private var text:TextField;
    private var background:Shape;

    public function MenuScreen(m: Main, w: int, h:int):void{
      main = m;
      width = w;
      height = h;

      background = new Shape();
			background.graphics.beginFill(0x999999);
			background.graphics.drawRect(0, 0, width, height);
			background.graphics.endFill();

      text = new TextField();
      //text.embedFonts = true;
      text.text = "Agmented Reality Chess\n\n\nPress P to play\n\nPress H to get help\n\nPress C to see the credits";
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
