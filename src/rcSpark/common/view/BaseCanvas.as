package rcSpark.common.view
{
	
	import mx.containers.Canvas;
	
	import rcSpark.common.events.BaseEvent;
	import rcSpark.common.manager.Loading;
	
	import redSpark.resManager.data.ResData;
	import redSpark.resManager.data.URLData;
	import redSpark.resManager.events.ResEvent;
	import redSpark.resManager.managers.ResManager;
	
	[Event(name="prepreinitialize", type="rcSpark.common.events.BaseEvent")]
	public class BaseCanvas extends Canvas
	{
		private var _res:Array;
		
		private var _count:int = 0;
		
		public function BaseCanvas()
		{
			super();
		}
		/**
		 * getter setter
		 * */
		protected function get res():Array
		{
			return _res;
		}
		
		protected function set res(value:Array):void
		{
			_res = value;
		}
		
		/**
		 * 重写 初始化 方法
		 * */
		override public function initialize():void{
			
			dispatchEvent(new BaseEvent(BaseEvent.PREPREINITIALIZE));
			
			if(res && res.length>0){
				if(res.length == 1){
					//加载 单个的资源方式
					loaderOneData();
				}else{
					loaderArrayData();
				}
			}else{
				super.initialize();
			}
			
		}
		
		private function loaderOneData():void
		{
			var urlData:URLData = new URLData(res[0]);
			ResManager.getInstance().load(urlData.initType,urlData.url,urlData.initLevel,null,loadResComplete ,loadResProgress);
		}
		private function loaderArrayData():void
		{
			for(var i:int =0 ;i<res.length ; i++){
				var urlData:URLData = new URLData(res[i]);
				ResManager.getInstance().load(urlData.initType,urlData.url,urlData.initLevel,null,loadResComplete);
			}
			
		}
		
		private function loadResComplete(evt:ResEvent):void
		{
			_count ++;
			if(_count == _res.length)
			{
				trace("------Ryan.Cao--预加载内容已加载完毕-关闭进度条-初始化界面----");
				Loading.getInstance().showLoading(false);
				super.initialize();
			}else{
				//precent = _count/_res.length   进度条 显示
				Loading.getInstance().showLoading(true,(_count/_res.length)*100);
			}
		}
		private function loadResProgress(evt:ResEvent):void
		{
			//加载进度条的显示
			Loading.getInstance().showLoading(true,(evt.resData.bytesLoaded/evt.resData.bytesTotal)*100);
		}
		
	}
}