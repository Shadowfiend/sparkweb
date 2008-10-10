package com.inquus.spark.viewers
{
	import flash.events.Event;

	public class NewViewerEvent extends Event
	{
		public static const NEW_VIEWER:String = "newViewer";
		public var title:String;
		public var description:String;
		public var uri:String;
		
		public function NewViewerEvent(type:String, title:String= null, uri:String = null, description:String=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.title = title;
			this.description = description;
			this.uri = uri;
		}
		
	}
}