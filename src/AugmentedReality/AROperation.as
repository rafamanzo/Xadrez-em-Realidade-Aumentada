/**
 * @author rafael
 */
package AugmentedReality {
	import flash.events.Event;
	import com.transmote.flar.FLARManager;
	import com.transmote.flar.marker.FLARMarkerEvent;
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;
	
	public class AROperation {
		private var cam:Camera3D;
		private var vp:Viewport3D;
		private var scene:Scene3D;
		private var render:BasicRenderEngine;
		
		private var cube0:ARObject;
		private var cube1:ARObject;
		private var cube2:ARObject;
		private var cube3:ARObject;
		private var cube4:ARObject;
		private var cube5:ARObject;
		private var cube6:ARObject;
		private var cube7:ARObject;
		private var cube8:ARObject;
		private var cube9:ARObject;
		private var cube10:ARObject;
		private var cube11:ARObject;
			
		public function AROperation(flarm:FLARManager, c:Camera3D, v:Viewport3D, s:Scene3D) {
			cam = c;
			vp = v;
			scene = s;
			render = new BasicRenderEngine();
				
			flarm.addEventListener(FLARMarkerEvent.MARKER_ADDED, marker_add);
			flarm.addEventListener(FLARMarkerEvent.MARKER_UPDATED, marker_up);
			flarm.addEventListener(FLARMarkerEvent.MARKER_REMOVED, marker_del);
			
			cube0 = new ARObject("cube.md2", "marble.jpg", scene);
			cube1 = new ARObject("cube.md2", "marble.jpg", scene);
			cube2 = new ARObject("cube.md2", "marble.jpg", scene);
			cube3 = new ARObject("cube.md2", "marble.jpg", scene);
			cube4 = new ARObject("cube.md2", "marble.jpg", scene);
			cube5 = new ARObject("cube.md2", "marble.jpg", scene);
			cube6 = new ARObject("cube.md2", "marble.jpg", scene);
			cube7 = new ARObject("cube.md2", "marble.jpg", scene);
			cube8 = new ARObject("cube.md2", "marble.jpg", scene);
			cube9 = new ARObject("cube.md2", "marble.jpg", scene);
			cube10 = new ARObject("cube.md2", "marble.jpg", scene);
			cube11 = new ARObject("cube.md2", "marble.jpg", scene);
			
		}
		
		private function marker_add(e:FLARMarkerEvent):void {
			switch(e.marker.patternId.toString()){
				case "0":
					trace("ADD" + e.marker.patternId.toString());
					cube0.setMarker(e.marker);
					break;
				case "1":
					trace("ADD" + e.marker.patternId.toString());
					cube1.setMarker(e.marker);
					break;
				case "2":
					trace("ADD" + e.marker.patternId.toString());
					cube2.setMarker(e.marker);
					break;
				case "3":
					trace("ADD" + e.marker.patternId.toString());
					cube3.setMarker(e.marker);
					break;
				case "4":
					trace("ADD" + e.marker.patternId.toString());
					cube4.setMarker(e.marker);
					break;
				case "5":
					trace("ADD" + e.marker.patternId.toString());
					cube5.setMarker(e.marker);
					break;
				case "6":
					trace("ADD" + e.marker.patternId.toString());
					cube6.setMarker(e.marker);
					break;
				case "7":
					trace("ADD" + e.marker.patternId.toString());
					cube7.setMarker(e.marker);
					break;
				case "8":
					trace("ADD" + e.marker.patternId.toString());
					cube8.setMarker(e.marker);
					break;
				case "9":
					trace("ADD" + e.marker.patternId.toString());
					cube9.setMarker(e.marker);
					break;
				case "10":
					trace("ADD" + e.marker.patternId.toString());
					cube10.setMarker(e.marker);
					break;
				case "11":
					trace("ADD" + e.marker.patternId.toString());
					cube11.setMarker(e.marker);
					break;
			}
		}
		
		private function marker_up(e:FLARMarkerEvent):void {
			switch(e.marker.patternId.toString()){
				case "0":
					trace("UP" + e.marker.patternId.toString());
					cube0.setMarker(e.marker);
					break;
				case "1":
					trace("UP" + e.marker.patternId.toString());
					cube1.setMarker(e.marker);
					break;
				case "2":
					trace("UP" + e.marker.patternId.toString());
					cube2.setMarker(e.marker);
					break;
				case "3":
					trace("UP" + e.marker.patternId.toString());
					cube3.setMarker(e.marker);
					break;
				case "4":
					trace("UP" + e.marker.patternId.toString());
					cube4.setMarker(e.marker);
					break;
				case "5":
					trace("UP" + e.marker.patternId.toString());
					cube5.setMarker(e.marker);
					break;
				case "6":
					trace("UP" + e.marker.patternId.toString());
					cube6.setMarker(e.marker);
					break;
				case "7":
					trace("UP" + e.marker.patternId.toString());
					cube7.setMarker(e.marker);
					break;
				case "8":
					trace("UP" + e.marker.patternId.toString());
					cube8.setMarker(e.marker);
					break;
				case "9":
					trace("UP" + e.marker.patternId.toString());
					cube9.setMarker(e.marker);
					break;
				case "10":
					trace("UP" + e.marker.patternId.toString());
					cube10.setMarker(e.marker);
					break;
				case "11":
					trace("UP" + e.marker.patternId.toString());
					cube11.setMarker(e.marker);
					break;
			}
		}
		
		private function marker_del(e:FLARMarkerEvent):void {
			switch(e.marker.patternId.toString()){
				case "0":
					trace("DEL" + e.marker.patternId.toString());
					cube0.remove();
					break;
				case "1":
					trace("DEL" + e.marker.patternId.toString());
					cube1.remove();
					break;
				case "2":
					trace("DEL" + e.marker.patternId.toString());
					cube2.remove();
					break;
				case "3":
					trace("DEL" + e.marker.patternId.toString());
					cube3.remove();
					break;
				case "4":
					trace("DEL" + e.marker.patternId.toString());
					cube4.remove();
					break;
				case "5":
					trace("DEL" + e.marker.patternId.toString());
					cube5.remove();
					break;
				case "6":
					trace("DEL" + e.marker.patternId.toString());
					cube6.remove();
					break;
				case "7":
					trace("DEL" + e.marker.patternId.toString());
					cube7.remove();
					break;
				case "8":
					trace("DEL" + e.marker.patternId.toString());
					cube8.remove();
					break;
				case "9":
					trace("DEL" + e.marker.patternId.toString());
					cube9.remove();
					break;
				case "10":
					trace("DEL" + e.marker.patternId.toString());
					cube10.remove();
					break;
				case "11":
					trace("DEL" + e.marker.patternId.toString());
					cube11.remove();
					break;
			}
		}
		
		public function update(e:Event):void{
			cube0.update();
			cube1.update();
			cube2.update();
			cube3.update();
			cube4.update();
			cube5.update();
			cube6.update();
			cube7.update();
			cube8.update();
			cube9.update();
			cube10.update();
			cube11.update();
			
			render.renderScene(scene, cam, vp);
		}
	}

}