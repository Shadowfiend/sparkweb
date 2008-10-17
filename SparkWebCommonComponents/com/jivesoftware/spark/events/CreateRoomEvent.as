package com.jivesoftware.spark.events
{
	import flash.events.Event;
	
	import org.jivesoftware.xiff.core.UnescapedJID;

	public class CreateRoomEvent extends Event
	{
		
		public static var CREATE:String = "createRoom";
		public var jid:UnescapedJID;
		public function CreateRoomEvent(type:String, jid:UnescapedJID = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.jid = jid;
		}
		
	}
}