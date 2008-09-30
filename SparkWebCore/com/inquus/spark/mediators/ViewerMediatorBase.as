package com.inquus.spark.mediators
{
	import flash.events.EventDispatcher;

	public class ViewerMediatorBase extends EventDispatcher
	{
		private var _viewerId:String;
		
		
		public function ViewerMediatorBase(viewerId:String)
		{
			super(null);
			this._viewerId = viewerId;
		}
		
		[Bindable]
		public function get viewerId():String
		{
			return _viewerId;
		}
	}
}