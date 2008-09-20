package com.jivesoftware.spark.managers
{
	public interface AccountManager
	{
		function createAccount(username:String, password:String, callBackFunction:Function):void;
	} 
}   