package {
	import examples.*;
	
	import flash.display.Sprite;

	[SWF(width="640", height="480", frameRate="60", backgroundColor="#FFFFFF")]
	public class FLARManagerExampleLauncher extends Sprite {
		
		public function FLARManagerExampleLauncher () {
			// simply uncomment whichever tutorial/example you would like to launch.
			
			// simple tutorials for 2D, 3D, and 3D external models
//			this.addChild(new FLARManagerTutorial_2D());
//			this.addChild(new FLARManagerTutorial_3D());
			this.addChild(new FLARManagerTutorial_Collada());
			
			// 2D and 3D examples using only FLARToolkit and native AS3
//			this.addChild(new FLARManagerExample_2D());
//			this.addChild(new FLARManagerExample_Flash3D());

			// 3D examples using third-party 3D frameworks
//			this.addChild(new FLARManagerExample_Alternativa3D());
//			this.addChild(new FLARManagerExample_Away3D());
//			this.addChild(new FLARManagerExample_Away3DLite());
//			this.addChild(new FLARManagerExample_PV3D());
//			this.addChild(new FLARManagerExample_Sandy3D());
			
			// miscellaneous examples
//			this.addChild(new FLARManagerExample_2D_Loader());
//			this.addChild(new FLARManagerExample_PV3D_Wide());
		}
	}
}