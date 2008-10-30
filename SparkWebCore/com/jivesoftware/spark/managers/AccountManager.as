package com.jivesoftware.spark.managers
{
	import org.jivesoftware.xiff.core.UnescapedJID;
	
	public interface AccountManager
	{
		function createAccount(username:String, password:String, email:String, onSuccess:Function, onFailure:Function = null):void;
		function loginAccount(username:String, password:String, onSuccess:Function, onFailure:Function = null):void;
//		function getBuddyInfo(jid:UnescapedJID, onSuccess:Function, onFailure:Function):void;
	} 
}   