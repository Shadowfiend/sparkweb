package com.jivesoftware.spark.managers
{
	public interface AccountManager
	{
		function createAccount(username:String, password:String, email:String, onSuccess:Function, onFailure:Function = null):void;
	} 
}   