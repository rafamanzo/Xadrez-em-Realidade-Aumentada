/**
 * @author rafael
 */
package  {
	import flash.display.Sprite;
  //import Application
	
	public class Main extends Sprite{
		private var scenario:Scenario;
    private var player:Player;
    //public var:teste = new teste();
		
		public function Main() {
			var loading:LoadingScreen;
			
			//loading = new LoadingScreen(this, 640, 480);
			//loading.start();
			scenario = new Scenario(this);
			//loading.finish();
			//scenario.displayAll();	

      player = new Player(this, scenario.getAROperation());
		}
	}

}
