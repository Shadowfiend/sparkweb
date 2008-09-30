package com.inquus.spark.mediators
{
	import com.inquus.spark.vo.ViewerMessage;
	
	import mx.core.UIComponent;
	
	public interface IViewerMediator
	{
		//handle a viewer message
		function handleMessage(message:ViewerMessage):void;
		//get something that represents the header information for the thing being viewed
		function getHeader():UIComponent;
		//get the main View
		function getContent():UIComponent;
		//get the main View
		function getThumbNail(message:ViewerMessage):UIComponent;
		//close the viewer
		function close():void;
		//resize the viewer
		function resize(width:int, height:int):void;
	}
}