package rcSpark.common.manager
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	
	import mx.core.Application;
	
	import rcSpark.common.view.CommonLoading;

	public class Loading
	{
		private static var _instance:Loading ;
		public var commomLoading:CommonLoading ;
		
		public function Loading()
		{
			if(_instance != null){
				throw new Error("该类是单例模式");
			}
			_instance = this;
			commomLoading = new rcSpark.common.view.CommonLoading();
			
			Application.application.addChild(commomLoading);
			commomLoading.x = Application.application.width /2;
			commomLoading.y = Application.application.height /2;
			commomLoading.visible = false;
		}

		public static function getInstance():Loading
		{
			if(!_instance){
				_instance = new Loading();
			}
			return _instance;
		}
		public function showLoading(value:Boolean , precent:int = 0 ,message:String = ""):void{
			if(value){
				commomLoading.visible = true;
				commomLoading.parent.setChildIndex(commomLoading,commomLoading.parent.numChildren - 1);
				commomLoading.percent = precent;
				if(message!=""){
					commomLoading.alertMsg = message;
				}
			}else{
				commomLoading.visible = false;
			}
			
		}

	}
}