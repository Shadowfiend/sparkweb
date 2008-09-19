package com.jivesoftware.spark.managers
{
	public class ComposableManager
	{
		private var _managers:Array;
		
		public function ComposableManager()
		{
			_managers = new Array();
			
		}
		
		public function appendManager(manager:IManager):void
		{
			_managers.push(manager);
		}
		
		public function removeManager(manager:IManager):void
		{
			var i:int = managers.indexOf(manager);
			if(i >=0)
				managers.splice(i,1);
		}
		
		public function get managers():Array
		{
			return _managers;
		}

	}
}