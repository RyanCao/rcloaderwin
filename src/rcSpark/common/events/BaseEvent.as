package rcSpark.common.events
{
	import flash.events.Event;
	
	public class BaseEvent extends Event
	{
		//服务于 BaseCanvas的		在所有初始化动作之前  将派发此事件
		/**
		 *可以使用<code>   prepreinitialize=" prepreinit()" </code> 在
		 * <code> prepreinit </code> 函数里面可以 设置 参数
		 */		
		public static const PREPREINITIALIZE:String = "prepreinitialize";
		
		public function BaseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}