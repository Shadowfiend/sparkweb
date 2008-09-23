package com.inquus.spark.managers
{
	import com.jivesoftware.spark.managers.AccountManager;
	
	public interface IManagerFactory
	{
		function get accountManager():AccountManager;
	}
}