package com.jivesoftware.spark.events
{
	import flash.events.Event;
	
	import mx.core.UIComponent;

	public class SparkWindowEvent extends Event
	{
		public var window:UIComponent;
		public static const OPEN_WINDOW:String = "spark:OpenWindow";
		public static const CLOSE_WINDOW:String = "spark:CloseWindow";
		public function SparkWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}