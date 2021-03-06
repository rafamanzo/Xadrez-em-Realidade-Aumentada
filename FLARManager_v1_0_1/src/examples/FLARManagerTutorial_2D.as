package examples {
	import com.transmote.flar.FLARManager;
	import com.transmote.flar.marker.FLARMarkerEvent;
	import com.transmote.flar.tracker.FLARToolkitManager;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * FLARManagerTutorial_2D demonstrates how to set up a basic 2D FLARManager application. 
	 * see the accompanying tutorial writeup here:
	 * http://words.transmote.com/wp/flarmanager/inside-flarmanager/2d-marker-tracking/
	 * 
	 * @author	Eric Socolofsky
	 * @url		http://transmote.com/flar
	 */
	public class FLARManagerTutorial_2D extends Sprite {
		private var flarManager:FLARManager;
		private var squareContainer:Sprite;
		private var squareShape:Shape;
		
		public function FLARManagerTutorial_2D () {
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
			
			// draw a square, and store it inside a container to set its position and scale.
			this.squareContainer = new Sprite();
			this.addChild(this.squareContainer);
			this.squareShape = new Shape();
			this.squareShape.graphics.lineStyle(2, 0x00FF00);
			this.squareShape.graphics.drawRect(-40, -40, 80, 80);
			this.squareContainer.addChild(this.squareShape);
			this.squareContainer.visible = false;
			
			// begin listening for FLARMarkerEvents.
			this.flarManager.addEventListener(FLARMarkerEvent.MARKER_ADDED, this.onMarkerAdded);
			this.flarManager.addEventListener(FLARMarkerEvent.MARKER_UPDATED, this.onMarkerUpdated);
			this.flarManager.addEventListener(FLARMarkerEvent.MARKER_REMOVED, this.onMarkerRemoved);
		}
		
		private function onMarkerAdded (evt:FLARMarkerEvent) :void {
			trace("["+evt.marker.patternId+"] added");
			
			// display the square, and set its position, rotation, and scale.
			this.squareContainer.visible = true;
			this.squareContainer.x = evt.marker.x;
			this.squareContainer.y = evt.marker.y;
			this.squareContainer.rotation = evt.marker.rotationZ;
			this.squareContainer.scaleX = this.squareContainer.scaleY = evt.marker.scale2D;
		}
		
		private function onMarkerUpdated (evt:FLARMarkerEvent) :void {
			trace("["+evt.marker.patternId+"] updated");
			
			// set the square's position, rotation, and scale.
			this.squareContainer.visible = true;
			this.squareContainer.x = evt.marker.x;
			this.squareContainer.y = evt.marker.y;
			this.squareContainer.rotation = evt.marker.rotationZ;
			this.squareContainer.scaleX = this.squareContainer.scaleY = evt.marker.scale2D;
		}
		
		private function onMarkerRemoved (evt:FLARMarkerEvent) :void {
			trace("["+evt.marker.patternId+"] removed");
			
			// hide the square.
			this.squareContainer.visible = false;
		}
	}
}