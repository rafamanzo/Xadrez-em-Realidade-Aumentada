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
		
		private var cube:ARObject;
		private var monster:ARObject;
		
			
		public function AROperation(flarm:FLARManager, c:Camera3D, v:Viewport3D, s:Scene3D) {
			cam = c;
			vp = v;
			scene = s;
			render = new BasicRenderEngine();
				
			flarm.addEventListener(FLARMarkerEvent.MARKER_ADDED, marker_add);
			flarm.addEventListener(FLARMarkerEvent.MARKER_UPDATED, marker_up);
			flarm.addEventListener(FLARMarkerEvent.MARKER_REMOVED, marker_del);
			
			cube = new ARObject("cube.md2", "marble.jpg", scene);
			//monster = new ARObject("monster_jump.md2", "monster.jpg", scene);
		}
		
		private function marker_add(e:FLARMarkerEvent):void {
			trace("ADD" + e.marker.patternId.toString());
			if(e.marker.patternId == 0){
				cube.sumAdd_count();
				if(cube.validateAdd()){
					cube.setMarker(e.marker);
				}
			}else if (e.marker.patternId == 2){
				//trace("ADD" + e.marker.patternId.toString());
				//monster.setMarker(e.marker);	
			}
		}
		
		private function marker_up(e:FLARMarkerEvent):void {
			trace("UP" + e.marker.patternId.toString());
			if(e.marker.patternId == 0){
				cube.sumUp_count();
				if(cube.validateUp()){
					cube.setMarker(e.marker);
				}
			}else if (e.marker.patternId == 2){
				//trace("UP" + e.marker.patternId.toString());
				//monster.setMarker(e.marker);	
			}
		}
		
		private function marker_del(e:FLARMarkerEvent):void {
			trace("DEL" + e.marker.patternId.toString());
			if(e.marker.patternId == 0){
				cube.sumDel_count();
				if(cube.validateDel()){
					cube.remove();
				}
			}else if(e.marker.patternId == 2){
				//trace("DEL" + e.marker.patternId.toString());
				//monster.remove();
			}
		}
		
		public function update(e:Event):void{
			cube.update();
			//monster.update();
			render.renderScene(scene, cam, vp);
		}
	}

}