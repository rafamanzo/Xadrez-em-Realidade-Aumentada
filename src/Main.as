/**
 * @author rafael
 */
package  {
	import flash.display.Sprite;
	
	public class Main extends Sprite{
		private var scenario:Scenario;
		
		public function Main() {
			var loading:LoadingScreen;
			
			//loading = new LoadingScreen(this, 640, 480);
			//loading.start();
			scenario = new Scenario(this);
			//loading.finish();
			//scenario.displayAll();	
		}
	}

}