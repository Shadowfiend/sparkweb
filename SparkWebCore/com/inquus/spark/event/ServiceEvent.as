package com.inquus.spark.event
{
	import flash.events.Event;

	public class ServiceEvent extends Event
	{
//		public var:onSuccess:Function;
//		public var:onFailure:Function;
		
		public function ServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}