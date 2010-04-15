package rcSpark.common.interfaces
{
	public interface IWinCanvas
	{
		/**
		 * 接口函数 主要用于除去某些不需要操作的对象，优化内存的目的
		 * 可以重写show函数：
		 * @param value <code><b>Boolean</b></code>
		 * <p>
		 * for instance:<p>
		 * override public function show(value:Boolean):void{}
		 */		
		function show():void;
		function hide():void;
	}
}