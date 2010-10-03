package 
{
	import com.transmote.flar.camera.FLARCamera_PV3D;
	import com.transmote.flar.FLARManager;
	import com.transmote.flar.marker.FLARMarker;
	import com.transmote.flar.tracker.FLARToolkitManager;
	import com.transmote.flar.marker.FLARMarkerEvent;
	import com.transmote.flar.utils.geom.PVGeomUtils;
	import flash.display.DisplayObject;
	import flash.display.Scene;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TextEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	import flash.text.TextField;
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.core.animation.clip.AnimationClip3D;
	import org.papervision3d.core.proto.MaterialObject3D;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.MD2;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;
	import org.papervision3d.events.FileLoadEvent;
	
	
	/**
	 * ...
	 * @author igordsm
	 */
	public class Main extends Sprite 
	{
		private var cam:Camera3D;
		private var vp:Viewport3D;
		private var scene:Scene3D;
		private var render:BasicRenderEngine;
		
		/*private var monster:MD2;*/
		private var cube:MD2
		private var dp:DisplayObject3D;
		
		private var flarm:FLARManager;
		private var marker:FLARMarker;
		
		private var t:TextField;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function setup3d():void {
			cam = new FLARCamera_PV3D(flarm, new Rectangle(0, 0, stage.width, stage.height));;
			cam.x = cam.y = 0;
			cam.z = -100;
			scene = new Scene3D();
			render = new BasicRenderEngine();
			vp = new Viewport3D(640, 480, true, true);
			addChild(vp);
			
			create_cube();
		}
		
		private function create_cube():void {
			
			cube = new MD2(false);
			cube.load("./cube.md2", new BitmapFileMaterial("./marble.jpg"), 50, 60);
			cube.addEventListener(FileLoadEvent.ANIMATIONS_COMPLETE, 
				function (e:Event):void {
					/*cube.animation.addClip(
						new AnimationClip3D("stand", 0, 0));
					cube.animation.addClip(
						new AnimationClip3D("jump", 0, 2));
					cube.play("stand");*/
					dp = new DisplayObject3D();
					dp.addChild(cube);
					dp.visible = false;
					scene.addChild(dp);
				});
		}
		
		/*private function create_monster():void {
			
			monster = new MD2(false);
			monster.load("./cube.md2", new BitmapFileMaterial("./marble.jpg"), 25,30);
			monster.addEventListener(FileLoadEvent.ANIMATIONS_COMPLETE, 
				function (e:Event):void {
					monster.animation.addClip(
						new AnimationClip3D("stand", 0, 0));
					monster.animation.addClip(
						new AnimationClip3D("jump", 0, 2));
					monster.play("stand");
					dp = new DisplayObject3D();
					dp.addChild(monster);
					dp.visible = false;
					scene.addChild(dp);
				});
		}*/
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			flarm = new FLARManager("../resources/flar/flarConfig.xml", new FLARToolkitManager(), stage);
			flarm.mirrorDisplay = true;
			addChild(Sprite(flarm.flarSource));
			marker = null;
			flarm.addEventListener(Event.INIT, setup_AR);
		}
		
		private function setup_AR(e:Event):void {
			setup3d();
			t = new TextField();
			t.text = "0";
			t.transform.matrix = new Matrix(3, 0, 0, 3);
			addChild(t);
			flarm.addEventListener(FLARMarkerEvent.MARKER_ADDED, marker_add);
			flarm.addEventListener(FLARMarkerEvent.MARKER_UPDATED, marker_up);
			flarm.addEventListener(FLARMarkerEvent.MARKER_REMOVED, marker_del);
			
			addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, key_down);
		}
		
		private function marker_add(e:FLARMarkerEvent):void {
			trace("ADD" + e.marker.patternId.toString());
			marker = e.marker;
		}
		
		private function marker_up(e:FLARMarkerEvent):void {
			trace("UP" + e.marker.patternId.toString());
			marker = e.marker;
		}
		
		private function marker_del(e:FLARMarkerEvent):void {
			trace("DEL" + e.marker.patternId.toString());
			/*marker = null;
			dp.visible = false;*/
		}
		
		private function key_down(evt:KeyboardEvent):void {
			/*if (evt.keyCode == Keyboard.ENTER) {
				monster.play("jump", false);
				t.text = (int(t.text) + 1).toString();
			} else if (evt.keyCode == Keyboard.LEFT) {
				monster.x -= 1;
			} else if (evt.keyCode == Keyboard.RIGHT) {
				monster.x += 1;
			}*/
		}
		
		private function update(e:Event):void {
			if (marker) {
				dp.visible = true;
				trace(marker.z);
				dp.transform = PVGeomUtils.convertMatrixToPVMatrix(marker.transformMatrix);
			}
			render.renderScene(scene, cam, vp);
			
		}
		
	}
	
}