package com.jivesoftware.spark.events
{
	import flash.events.Event;

	public class SparkErrorEvent extends Event
	{
		public var priority:String;
		public var message:String;
		
		public static const ERROR:String =  "application_error";
		public function SparkErrorEvent(type:String, message:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}