package  {
	import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.KeyboardEvent;
  //import Application
	
	public class Main extends Sprite{
		private var scenario:Scenario;
    private var player:Player;
    //public var:teste = new teste();
		
		public function Main() {
			//var loading:LoadingScreen;
			
			//loading = new LoadingScreen(this, 640, 480);
			//loading.start();
			scenario = new Scenario(this);
			//loading.finish();
			//scenario.displayAll();	

      player = new Player(this, scenario.getAROperation);

      //if (stage) init();
			//else addEventListener(Event.ADDED_TO_STAGE, init);
		}

    /*private function init(e:Event = null):void{
      trace("keyboard added");
      addEventListener(KeyboardEvent.KEY_DOWN, test);     
    }

    public function test(e:KeyboardEvent):void{
      trace("CharCode:"+e.charCode);
    }*/
	}

}
