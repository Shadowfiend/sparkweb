package com.jivesoftware.spark.events
{
	import flash.events.Event;

	public class InviteUserEvent extends Event
	{
		public var email:String;
		public static const INVITE:String = "invite_user";
		
		public function InviteUserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}