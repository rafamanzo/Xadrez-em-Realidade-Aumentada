/**
 * @author rafael
 */
package  {
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Shape;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
		
	public class LoadingScreen{
		
		private var main:Main;
		private var do_background:DisplayObject;
		private var do_points:DisplayObject;
		private var do_text:DisplayObject;
		private var timer:Timer;
		private var width:int;
		private var height:int;
		private var loading:Boolean;
		private var points:TextField;
		
		public function LoadingScreen(m:Main, w:int, h:int):void {			
			main = m;
			width = w;
			height = h;
			loading = true;
			points = new TextField();
		}
		
		private function runTimer(func:Function):void{
			timer = new Timer(1000, 1);
			timer.addEventListener(TimerEvent.TIMER, func);
			timer.start();
		}
		
		private function runLoadingAnimation(e:TimerEvent):void{
			if(loading == true){
				do_background.visible = true;
				do_text.visible = true;
				do_points.visible = true;
				if(points.text == ""){
					points.text = ".";
				}else if(points.text == "."){
					points.text = "..";
				}else if(points.text == ".."){
					points.text = "...";
				}else{
					points.text = "";
				}
				runTimer(runLoadingAnimation);
			}else{
				main.removeChild(do_background);
				main.removeChild(do_text);
				main.removeChild(do_points);
				trace("Loading finished");
			}
		}
		
		public function start():void{
			var background:Shape;
			var loading:Boolean;
			var text:TextField;
			
			background = new Shape();
			background.graphics.beginFill(0x999999);
			background.graphics.drawRect(0, 0, width, height);
			background.graphics.endFill();
			
			text = new TextField();
			
			text.text = "Loading";
			points.text = "";
			
			do_background = main.addChild(background);
			do_text = main.addChild(text);
			do_points = main.addChild(points);
			
			do_text.x = 320;
			do_text.y = 240;
			do_points.x = 350;
			do_points.y = 240;
			
			loading = true;
			
			runTimer(runLoadingAnimation);
			trace("Loading started");
		}
		
		public function finish():void{
			loading = false;
		}
	}

}