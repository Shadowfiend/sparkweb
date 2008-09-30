package com.inquus.spark.event
{
	import com.inquus.spark.vo.ViewerMessage;
	
	import flash.events.Event;

	public class ViewerEvent extends Event
	{
		public static const NEW_MESSAGE:String = "viewerMessage";
		public static const RESIZED:String = "viewerResized";
		public static const CLOSED:String = "viewerClosed";
		
		public var message:ViewerMessage;
		
		public function ViewerEvent(type:String, message:ViewerMessage= null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.message = message;
		}
	}
}