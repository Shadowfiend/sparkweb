package com.inquus.spark.viewers
{
	import mx.core.IDataRenderer;
	
	
	public interface IViewer
	{
		//handle a viewer message
		function receiveMessage(from:String, time:Date,message:Object):void;

		
		//close and clean up the viewer
		function close():void;
		
		//resize the viewer
		function resize(width:int, height:int):void;
	}
}