/**
 * @author rafael
 */
package AugmentedReality {
	public class Cronometer {
		private static const DELAY:Number = 0.5;
		private static const ADD_RATE:Number = 15; //need to X MARKER_UPDATED events to add or X MARKER_UPDATED in less then one second
		private static const UP_RATE:Number = 5; //need to X MARKER_UPDATED events to update the marker in less than one second
		private static const DEL_DELAY:Number = 1; // time in seconds with 0 MARKER_UPDATED events to delete the marker
		private var date:Date;
		private var time:Vector.<Number>;//[minutes, seconds, milliseconds]
		private var add_count:Number;
		private var del_count:Number;
		private var up_count:Number;
			
		public function Cronometer() {
			date = new Date();
			add_count = 0;
			del_count = 0;
			up_count = 0;
			time = null;
		}
		
		private function setTime():void{
			time[0] = date.getMinutes();
			time[1] = date.getSeconds();
			time[2] = date.getMilliseconds();
		}
		
		//return the interval between actual time and the time sotred on the time atribute
		private function getInterval():Number{
			var actual:Number;
			var before:Number;
			
			if(time = null){
				return 0;
			}
			
			actual = ((date.getMinutes()*60) + (date.getSeconds()) + (date.getMilliseconds()/1000));
			before = ((time[0]*60) + (time[1]) + (time[2]/1000));
			
			return (actual - before);
		}
		
		public function sumUp_count():void{
			if(getInterval() <= DELAY && getInterval > 0){
				up_count += 1;
				if(del_count > 0){
					del_count = 0;
				}
			}else{
				setTime();
			}
		}
		
		public function resetUp_count():void{
			up_count = 0;
		}
		
		public function sumAdd_count():void{
			if(getInterval() <= DELAY && getInterval > 0){
				add_count += 1;
				if(del_count > 0){
					del_count = 0;
				}else if(up_count > 0){
					up_count = 0;
				}
			}
			setTime();
		}
		
		public function resetAdd_count():void{
			add_count = 0;
		}
		
		public function sumDel_count():void{
			if(getInterval() <= DELAY && getInterval > 0){
				del_count += 1;
				if(add_count > 0){
					add_count = 0;
				}else if(up_count > 0){
					up_count = 0;
				}
			}
			setTime();
		}
		
		public function resetDel_count():void{
			del_count = 0;
		}
		
		public function validateAdd():Boolean{
			if(add_count > 0 && up_count >= UP_RATE){
				return true;
			}else{
				setTime();
				return false;
			}
			
		}
		
		public function validateUp():Boolean{
			if(up_count > UP_RATE){
				return true;
			}else{
				setTime();
				return false;
			}
		}
		
		public function validateDel():Boolean{
			if(del_count > 0 && getInterval >= DEL_DELAY){
				return true;
			}else{
				setTime();
				return false;
			}
		}
	
	}

}