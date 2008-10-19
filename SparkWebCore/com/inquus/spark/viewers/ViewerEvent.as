package com.inquus.spark.viewers
{
	import flash.events.Event;

	public class ViewerEvent extends Event
	{
		public static const NEW_MESSAGE:String = "viewerMessage";
		public static const NEW_VIEWER:String = "viewerNew";
		public static const CLOSED:String = "viewerClosed";
		
		public var payload:Object;
		public var saveData:Boolean;
		public var forceReload:Boolean;
		
		//TODO: SaveData and ForceReload should both be abstracted into some kind of configuration
		public function ViewerEvent(type:String, payload:Object= null, saveData:Boolean=false, forceReload:Boolean=false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.payload = payload;
			this.saveData = saveData;
			this.forceReload = forceReload;
		}
	}
}