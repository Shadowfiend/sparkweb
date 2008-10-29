package com.inquus.spark.viewers
{
	import flash.events.Event;

	public class NewViewerEvent extends Event
	{
		public static const NEW_VIEWER:String = "newViewer";
		public var name:String;
		public var description:String;
		public var uri:String;
		public var content_type:String;
		public var image_url:String;
		public var rating:Number = 0;
		public function NewViewerEvent(type:String,name:String= null, uri:String = null, 
			description:String=null, contentType:String = null, image_url:String = null,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			
			super(type, bubbles, cancelable);
			this.name = name;
			this.description = description;
			this.uri = uri;
			this.content_type = contentType;
			this.image_url = image_url;
		}
		
	}
}