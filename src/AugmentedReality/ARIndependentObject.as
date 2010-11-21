package AugmentedReality {
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.MD2;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.scenes.Scene3D;
  import org.papervision3d.core.math.Matrix3D;
	import com.transmote.flar.utils.geom.PVGeomUtils;
	import flash.events.Event;
	
	public class ARIndependentObject {
		private var dp:DisplayObject3D;
		private var model:MD2;
    private var board_marker:ARObject;
		
		public function ARIndependentObject(md2_model:String, texture:String, scene:Scene3D, bm:ARObject) {
			model = new MD2(false);
			model.load("3d/"+md2_model, new BitmapFileMaterial("3d/"+texture), 50, 60);
			model.addEventListener(FileLoadEvent.ANIMATIONS_COMPLETE, 
				function (e:Event):void {
					dp = new DisplayObject3D();
					dp.addChild(model);
					dp.visible = false;
					scene.addChild(dp);
				});

      board_marker = bm;
		}

    public function update():void{
			if(board_marker.getVisible()){
				transform(board_marker.getTransform());
			}
		}
		
		public function setVisible(value:Boolean):void{
      if(dp != null){
			  dp.visible = value;
      }
		}
		
		public function getVisible():Boolean{
      if(dp != null){
			  return dp.visible;
      }else{
        return false;
      }
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

    public function transform(matrix:Matrix3D):void{
      var position:Vector.<Number> = getPosition();
      dp.transform = matrix;
      setPosition(position);
    }
	}

}
