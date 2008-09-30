package com.jivesoftware.spark.events
{
	import com.jivesoftware.spark.chats.SparkMessage;
	
	import flash.events.Event;

	//This class is for signaling to any listeners (e.g. ChatMediator) what kind of message this is about.  It is like the model, 
	//but defers to listeners for behavior as the behavior may change from application to application.  This is displatched from 
	//ChatRoom objects
	
	public class ChatMessageEvent extends Event
	{
		public static const INSERT_MESSAGE:String = "insertMessage";
		public static const SYSTEM_MESSAGE:String = "systemMessage";
		public static const NOTIFICATION_MESSAGE:String = "notificationMessage";
		public static const VIEWER_MESSAGE:String = "viewereMessage";
				
		public var message:Object;
		
		public function ChatMessageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}