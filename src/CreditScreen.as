package {
	import flash.display.Shape;
	import flash.display.DisplayObject;
  import flash.text.TextField;
  import flash.text.TextFieldAutoSize;
  import flash.text.TextFormat;

  public class CreditScreen{
		private var main:Main;
		private var do_background:DisplayObject;
		private var do_text:DisplayObject;
		private var width:int;
		private var height:int;
		private var text:TextField;
    private var background:Shape;

    public function CreditScreen(m: Main, w: int, h:int):void{
      main = m;
      width = w;
      height = h;

      background = new Shape();
			background.graphics.beginFill(0x999999);
			background.graphics.drawRect(0, 0, width, height);
			background.graphics.endFill();

      text = new TextField();
      //text.embedFonts = true;
      text.text = "Instituto de Matemática e Estatística - Universidade de São Paulo (IME - USP)\nMAC0242 - Laboratório de programação II\nXadrez Em Realidade Aumentada\n\nDouglas Bettioli Barreto (NUSP 6920223)\nGiancarlo Rigo (NUSP 6910034)\nRafael Reggiani Manzo (NUSP 6797150)\n\nThanks to Daniel Vargas for the 3D models of the pieces\n\n\nPress C again to get back";
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
