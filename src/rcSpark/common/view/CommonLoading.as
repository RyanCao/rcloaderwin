package rcSpark.common.view
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.filters.GlowFilter;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import mx.core.UIComponent;
	
	import rcSpark.tools.ToolSet;
	
	public class CommonLoading extends UIComponent
	{
		private var percentTxt:TextField;
		private var msgTxt:TextField;
		public function CommonLoading()
		{
			super();
		}
		private var _percent:int;
		
		public function get percent():int
		{
			return _percent;
		}
		public function set percent(value:int):void
		{
			if(value == _percent) return;
			_percent = value;
			invalidateProperties();	
		}
		private var _alertMsgChanged:Boolean = false;
		private var _alertMsg:String = "正在加载中...";
		public function set alertMsg(value:String):void
		{
			if(value == _alertMsg){
				return;
			}
			_alertMsgChanged = true;
			_alertMsg = value;
			invalidateProperties();
		}
		public function get alertMsg():String
		{
			return _alertMsg;	
		}
		
		override protected function createChildren():void
		{
			try{
				var pie:Class = ToolSet.getDefinition("pie1_stage");
				var mc:MovieClip = new pie();
				addChild(mc);
			}catch(e:*){
				trace("-------Ryan.Cao---CommonLoading---need-a-MC");
			}
			
			//百分比
			percentTxt =new TextField();
			percentTxt.autoSize = TextFieldAutoSize.CENTER;
			percentTxt.textColor = 0xFFFFFF;
			percentTxt.selectable = false;
			percentTxt.filters = [new GlowFilter(0,1,2,2,16)];
			
			percentTxt.x = -8;
			percentTxt.y = -9
			
			var tf:TextFormat = new TextFormat();
			tf.size = 20;
			percentTxt.defaultTextFormat = tf;
			addChild(percentTxt);
			
			//提示信息
			msgTxt=new TextField();
		    msgTxt.autoSize=TextFieldAutoSize.CENTER;
		    msgTxt.height = 20;
		    msgTxt.textColor=0xffffff;
			msgTxt.selectable=false;
			msgTxt.text = _alertMsg;
		    msgTxt.x = -40;
		    msgTxt.y = 50;
		    addChild(msgTxt);
		}
		override protected function commitProperties():void
		{
			super.commitProperties();
			percentTxt.text = _percent + "%";
			if(_alertMsgChanged){
				msgTxt.text = _alertMsg;
				_alertMsgChanged = false;
			}
		}
		
	}
}