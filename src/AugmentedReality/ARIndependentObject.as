/**
 * @author rafael
 */
package AugmentedReality {
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.MD2;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.scenes.Scene3D;
  import org.papervision3d.core.Matrix3D;
	import com.transmote.flar.utils.geom.PVGeomUtils;
	import flash.events.Event;
	
	public class ARIndependentObject {
		private var dp:DisplayObject3D;
		private var model:MD2;
		
		public function ARIndependentObject() {
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
		
		public function setVisible(value:Boolean):void{
			dp.visible = value;
		}
		
		public function getVisible():Boolean{
			return dp.visible;
		}
		
		public function getPosition():Vector.<Number>{
			var position:Vector.<Number>;
			position = new Vector.<Number>();
			
			position[0] = dp.x;
			position[1] = dp.y;
			position[2] = dp.z;
			
			return position;
		}
		
		public function setPosition(position:Vector.<Number>):void{
			dp.x = position[0];
			dp.y = position[1];
			dp.z = position[2];
		}

    public function setTransform(matrix:Matrix3D):void{
      dp.transform = matrix;
    }
	}

}
