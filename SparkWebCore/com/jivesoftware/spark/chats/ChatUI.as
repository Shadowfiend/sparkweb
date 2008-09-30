package com.jivesoftware.spark.chats
{
	import mx.core.UIComponent;
		
	public interface ChatUI
	{
		function get isTyping():Boolean;
		function set isTyping(flag:Boolean):void;
		
		function addMessage(message:SparkMessage, extra:UIComponent = null):void;
		function addNotification(notification:String, color:String):void;
		function addSystemMessage(body:String, time:Date = null):void;
	}
}