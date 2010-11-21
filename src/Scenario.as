package
{
	import com.transmote.flar.camera.FLARCamera_PV3D;
	import com.transmote.flar.FLARManager;
	import com.transmote.flar.tracker.FLARToolkitManager;
	import com.transmote.flar.utils.geom.PVGeomUtils;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;
	import AugmentedReality.AROperation;
  import AugmentedReality.ARObject;

	public class Scenario{
		private var cam:Camera3D;
		private var vp:Viewport3D;
		private var scene:Scene3D;
		
		private var flarm:FLARManager;
		
		//private var t:TextField;
		private var m:Main;
		
		private var arop:AROperation;
		
		public function Scenario(mn:Main):void
		{
			m = mn;
			
			if (m.stage) init();
			else m.addEventListener(Event.ADDED_TO_STAGE, init);
		}

    private function init(e:Event = null):void{
			m.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			flarm = new FLARManager("../resources/flar/flarConfig.xml", new FLARToolkitManager(), m.stage);
			flarm.mirrorDisplay = true;
			flarm.addEventListener(Event.INIT, setup_AR);
			m.addChild(Sprite(flarm.flarSource));
		}
		
		private function setup3d():void {
			cam = new FLARCamera_PV3D(flarm, new Rectangle(0, 0, m.stage.width, m.stage.height));;
			cam.x = cam.y = 0;
			cam.z = -100;
			scene = new Scene3D();
			vp = new Viewport3D(640, 480, true, true);
			m.addChild(vp);
		}
				
		private function setup_AR(e:Event):void {
			var i:Number;
			
			setup3d();

			arop = new AROperation(flarm, cam, vp, scene);

      //loading table markers
			for(i = 0; i < 4; i +=1){
				arop.createARObject("cube.md2", "marble.jpg");
			}

      //loading users pieces markers
			for(i = 0; i < 8; i +=1){
				arop.createARObject("pawn.md2", "white.png");
			}
			arop.createARObject("tower.md2", "white.png");
			arop.createARObject("tower.md2", "white.png");
			arop.createARObject("knight.md2", "white.png");
			arop.createARObject("knight.md2", "white.png");
			arop.createARObject("bishop.md2", "white.png");
			arop.createARObject("bishop.md2", "white.png");
			arop.createARObject("queen.md2", "white.png");
			arop.createARObject("king.md2", "white.png");

      //loading computer pieces
      var board_marker:ARObject = arop.getObjectById(1);

      for(i = 0; i < 8; i += 1){
        arop.createARIndependentObject("pawn.md2", "black.png", board_marker);
      }
      arop.createARIndependentObject("tower.md2", "black.png", board_marker);
		  arop.createARIndependentObject("tower.md2", "black.png", board_marker);
      arop.createARIndependentObject("knight.md2", "black.png", board_marker);
      arop.createARIndependentObject("knight.md2", "black.png", board_marker);
      arop.createARIndependentObject("bishop.md2", "black.png", board_marker);
      arop.createARIndependentObject("bishop.md2", "black.png", board_marker);
      arop.createARIndependentObject("queen.md2", "black.png", board_marker);
      arop.createARIndependentObject("king.md2", "black.png", board_marker);

			m.addEventListener(Event.ENTER_FRAME, arop.update);
			
		}

    public function getAROperation():AROperation{
      return arop;
    }
	}

}
