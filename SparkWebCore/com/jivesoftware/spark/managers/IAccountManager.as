package com.jivesoftware.spark.managers
{
	public interface IAccountManager
	{
		function createAccount(username:String, password:String, callBackFunction:Function):void;
	} 
}   