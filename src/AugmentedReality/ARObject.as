package  AugmentedReality{
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.MD2;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.scenes.Scene3D;
  import org.papervision3d.core.math.Matrix3D;
	import com.transmote.flar.marker.FLARMarker;
	import com.transmote.flar.utils.geom.PVGeomUtils;
	import flash.events.Event;
  import flash.errors.IOError;
			
	public class ARObject extends ARCronometer{
		
		private var dp:DisplayObject3D;
		private var marker:FLARMarker;
		private var model:MD2;
		private var loaded:Boolean;
			
		public function ARObject(md2_model:String, texture:String, scene:Scene3D) {
			super();
			
      try{				
			  marker = null;
			  loaded = false;
			  model = new MD2(false);
			  model.load("3d/"+md2_model, new BitmapFileMaterial("3d/"+texture), 50, 60);
			  model.addEventListener(FileLoadEvent.ANIMATIONS_COMPLETE, 
				  function (e:Event):void {
					  loaded = true;
					  dp = new DisplayObject3D();
					  dp.addChild(model);
					  dp.visible = false;
					  scene.addChild(dp);
				  });
			  //trace("3");
      }catch(erro:IOError){
        trace("The 3D model "+md2_model+".md2 could not be found or the texture "+texture+" could not be found");
      }
		}
		
		public function getLoaded():Boolean{
			return loaded;
		}
		
		public function update():void{
			if(marker != null && marker.transformMatrix != null){
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
		
    public function getTransform():Matrix3D{
      return dp.transform;
    }	
	}
}
