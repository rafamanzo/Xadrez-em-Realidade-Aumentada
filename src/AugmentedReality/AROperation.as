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
		
		private var arobjects:Vector.<ARObject>;
		
			
		public function AROperation(flarm:FLARManager, c:Camera3D, v:Viewport3D, s:Scene3D) {
			cam = c;
			vp = v;
			scene = s;
			render = new BasicRenderEngine();
				
			flarm.addEventListener(FLARMarkerEvent.MARKER_ADDED, marker_add);
			flarm.addEventListener(FLARMarkerEvent.MARKER_UPDATED, marker_up);
			flarm.addEventListener(FLARMarkerEvent.MARKER_REMOVED, marker_del);
			
			arobjects = new Vector.<ARObject>();
		}
		
		public function createARObject(model:String, texture:String):void{
			var arobject:ARObject = new ARObject(model, texture, scene);
			arobjects.push(arobject);
		}

    
		
		public function allLoaded():Boolean{
			var status:Boolean = true;
			if(arobjects.length > 0){
				arobjects.forEach(
					function (obj:ARObject, index:int, vector:Vector.<ARObject>):void{
						status = obj.getLoaded();
					}
				);
			}
			return status;
		}
		
		private function marker_add(e:FLARMarkerEvent):void {
			trace("ADD" + e.marker.patternId.toString());
			arobjects.forEach(
				function (obj:ARObject, index:int, vector:Vector.<ARObject>):void{
					if(e.marker.patternId == index){
						 obj.sumAdd_count();
						 if(obj.validateAdd()){
						 	obj.setMarker(e.marker);
						 }
					}
				}
			);
		}
		
		private function marker_up(e:FLARMarkerEvent):void {
			trace("UP" + e.marker.patternId.toString());
			arobjects.forEach(
				function (obj:ARObject, index:int, vector:Vector.<ARObject>):void{
					if(e.marker.patternId == index){
						 obj.sumUp_count();
						 if(obj.validateUp()){
						 	obj.setMarker(e.marker);
						 }
					}
				}
			);
		}
		
		private function marker_del(e:FLARMarkerEvent):void {
			trace("DEL" + e.marker.patternId.toString());
			arobjects.forEach(
				function (obj:ARObject, index:int, vector:Vector.<ARObject>):void{
					if(e.marker.patternId == index){
						 obj.sumDel_count();
						 obj.waitToDel(obj.remove);
					}
				}
			);
		}
		
		public function update(e:Event):void{
			if(arobjects.length > 0){
				arobjects.forEach(
					function (obj:ARObject, index:int, vector:Vector.<ARObject>):void{
						obj.update();
					}
				);
			}
			//trace("4");
			render.renderScene(scene, cam, vp);
			//trace("5");
		}

    public function getPositionById(id:Number = -1):Vector.<Number>{
      if((arobjects.length - 1) < id || id < 0){
        return null;
      }

      return arobjects[id].getPosition();
    }
	}

}
