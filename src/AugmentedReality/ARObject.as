/**
 * @author rafael
 */
package  AugmentedReality{
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.MD2;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.scenes.Scene3D;
	import com.transmote.flar.marker.FLARMarker;
	import com.transmote.flar.utils.geom.PVGeomUtils;
	import flash.events.Event;
			
	public class ARObject {
		
		private var dp:DisplayObject3D;
		private var marker:FLARMarker;
		private var model:MD2;
			
		public function ARObject(md2_model:String, texture:String, scene:Scene3D) {
			marker = null;
			model = new MD2(false);
			model.load("3d/"+md2_model, new BitmapFileMaterial("3d/"+texture), 50, 60);
			model.addEventListener(FileLoadEvent.ANIMATIONS_COMPLETE, 
				function (e:Event):void {
					dp = new DisplayObject3D();
					dp.addChild(model);
					dp.visible = false;
					scene.addChild(dp);
				});
		}
		
		public function update():void{
			if(marker){
				setVisible(true);
				dp.transform = PVGeomUtils.convertMatrixToPVMatrix(marker.transformMatrix);
			}
		}
		
		public function remove():void{
			setVisible(false);
			setMarker(null);
		}
		
		public function setMarker(m:FLARMarker):void{
			marker = m;
		}
		
		public function getMarker():FLARMarker{
			return marker;
		}
		
		public function setVisible(value:Boolean):void{
			dp.visible = value;
		}
		
		public function getVisible():Boolean{
			return dp.visible;
		}
		
		public function getPosition():Vector.<Number>{
			var position:Vector.<Number>;
			position = new Vector.<Number>();
			
			position[0] = marker.x;
			position[1] = marker.y;
			position[2] = marker.z;
			
			return position;
		}
		
	}
}