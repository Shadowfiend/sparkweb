package com.inquus.spark.viewers
{
	import flash.events.Event;

	public class ViewerEvent extends Event
	{
		public static const NEW_MESSAGE:String = "viewerMessage";
		public static const NEW_VIEWER:String = "viewerNew";
		public static const CLOSED:String = "viewerClosed";
		
		public var payload:Object;
		
		public function ViewerEvent(type:String, payload:Object= null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.payload = payload;
		}
	}
}