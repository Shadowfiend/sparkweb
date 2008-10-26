package com.jivesoftware.spark.events
{
	import flash.events.Event;
	
	import org.jivesoftware.xiff.core.UnescapedJID;

	public class CreateChatEvent extends Event
	{
		public static const CREATE:String = "create_private_chat";
		public var jid:UnescapedJID;
		public var activate:Boolean;
		
		public function CreateChatEvent(type:String, jid:UnescapedJID, activate:Boolean = true, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.jid = jid;
			this.activate = activate;
		}
		
	}
}