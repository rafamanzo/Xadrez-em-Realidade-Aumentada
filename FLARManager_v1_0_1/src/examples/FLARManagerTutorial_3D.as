package examples {
	import com.transmote.flar.FLARManager;
	import com.transmote.flar.camera.FLARCamera_PV3D;
	import com.transmote.flar.marker.FLARMarker;
	import com.transmote.flar.marker.FLARMarkerEvent;
	import com.transmote.flar.tracker.FLARToolkitManager;
	import com.transmote.flar.utils.geom.PVGeomUtils;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import org.libspark.flartoolkit.support.pv3d.FLARCamera3D;
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.lights.PointLight3D;
	import org.papervision3d.materials.shadematerials.FlatShadeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.render.LazyRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;
	
	/**
	 * FLARManager_Tutorial3D demonstrates how to set up a basic augmented reality application,
	 * using FLARManager, FLARToolkit, and Papervision3D. 
	 * see the accompanying tutorial writeup here:
	 * http://words.transmote.com/wp/flarmanager/inside-flarmanager/basic-augmented-reality/
	 * 
	 * @author	Eric Socolofsky
	 * @url		http://transmote.com/flar
	 */
	public class FLARManagerTutorial_3D extends Sprite {
		private var flarManager:FLARManager;
		
		private var scene3D:Scene3D;
		private var camera3D:Camera3D;
		private var viewport3D:Viewport3D;
		private var renderEngine:LazyRenderEngine;
		private var pointLight3D:PointLight3D;
		
		private var activeMarker:FLARMarker;
		private var cubeContainer:DisplayObject3D;
		
		
		public function FLARManagerTutorial_3D () {
			this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
		}
		
		private function onAdded (evt:Event) :void {
			this.removeEventListener(Event.ADDED_TO_STAGE, this.onAdded);
			
			// pass the path to the FLARManager xml config file into the FLARManager constructor.
			// FLARManager creates and uses a FLARCameraSource by default.
			// the image from the first detected camera will be used for marker detection.
			// also pass an IFLARTrackerManager instance to communicate with a tracking library,
			// and a reference to the Stage (required by some trackers).
			this.flarManager = new FLARManager("../resources/flar/flarConfig.xml", new FLARToolkitManager(), this.stage);
			
			// to switch tracking engines, pass a different IFLARTrackerManager into FLARManager.
			// refer to this page for information on using different tracking engines:
			// http://words.transmote.com/wp/inside-flarmanager-tracking-engines/
			//			this.flarManager = new FLARManager("../resources/flar/flarConfig.xml", new FlareManager(), this.stage);
			//			this.flarManager = new FLARManager("../resources/flar/flarConfig.xml", new FlareNFTManager(), this.stage);
			
			// add FLARManager.flarSource to the display list to display the video capture.
			this.addChild(Sprite(this.flarManager.flarSource));
			
			// begin listening for FLARMarkerEvents.
			this.flarManager.addEventListener(FLARMarkerEvent.MARKER_ADDED, this.onMarkerAdded);
			this.flarManager.addEventListener(FLARMarkerEvent.MARKER_UPDATED, this.onMarkerUpdated);
			this.flarManager.addEventListener(FLARMarkerEvent.MARKER_REMOVED, this.onMarkerRemoved);
			
			// wait for FLARManager to initialize before setting up Papervision3D environment.
			this.flarManager.addEventListener(Event.INIT, this.onFlarManagerInited);
		}
		
		private function onFlarManagerInited (evt:Event) :void {
			this.flarManager.removeEventListener(Event.INIT, this.onFlarManagerInited);
			
			this.scene3D = new Scene3D();
			this.viewport3D = new Viewport3D(this.stage.stageWidth, this.stage.stageHeight);
			this.addChild(this.viewport3D);
			
			this.camera3D = new FLARCamera_PV3D(this.flarManager, new Rectangle(0, 0, this.stage.stageWidth, this.stage.stageHeight));
			
			this.renderEngine = new LazyRenderEngine(this.scene3D, this.camera3D, this.viewport3D);
			
			this.pointLight3D = new PointLight3D();
			this.pointLight3D.x = 1000;
			this.pointLight3D.y = 1000;
			this.pointLight3D.z = -1000;
			
			// create the cube to display on the detected marker.
			var cubeMaterial:FlatShadeMaterial = new FlatShadeMaterial(this.pointLight3D, 0xFF1919, 0x730000);
			var materialsList:MaterialsList = new MaterialsList({all: cubeMaterial});
			var cube:Cube = new Cube(materialsList, 40, 40, 40);
			cube.z += 20;
			
			// create a container for the cube, that will accept matrix transformations.
			this.cubeContainer = new DisplayObject3D();
			this.cubeContainer.addChild(cube);
			this.scene3D.addChild(this.cubeContainer);
			
			this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
		}
		
		private function onMarkerAdded (evt:FLARMarkerEvent) :void {
			trace("["+evt.marker.patternId+"] added");
			this.cubeContainer.visible = true;
			this.activeMarker = evt.marker;
		}
		
		private function onMarkerUpdated (evt:FLARMarkerEvent) :void {
			trace("["+evt.marker.patternId+"] updated");
			this.cubeContainer.visible = true;
			this.activeMarker = evt.marker;
		}
		
		private function onMarkerRemoved (evt:FLARMarkerEvent) :void {
			trace("["+evt.marker.patternId+"] removed");
			this.cubeContainer.visible = false;
			this.activeMarker = null;
		}
		
		private function onEnterFrame (evt:Event) :void {
			// apply the FLARToolkit transformation matrix to the Cube.
			if (this.activeMarker) {
				this.cubeContainer.transform = PVGeomUtils.convertMatrixToPVMatrix(this.activeMarker.transformMatrix, this.flarManager.flarSource.mirrored);
			}
			
			// update the Papervision3D view.
			this.renderEngine.render();
		}
	}
}