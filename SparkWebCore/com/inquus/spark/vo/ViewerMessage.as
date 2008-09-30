package com.inquus.spark.vo
{
	public class ViewerMessage
	{
		//messages have the following structure for viewers:   VIEWER_DELIMITER::CREATE|UPDATE|CHANGE::moduleName::id::action::payload1::payload2.... 
		public static const VIEWER_DELIMITER:String = "INQUUSVIEWERDELIMITER"; //FIXME:This should be set from host app.
		public static const MESSAGE_DELIMITER:String = "::";
		public static const VIEWER_UPDATE:String = "UPDATE";
		public static const VIEWER_CHANGE:String = "CHANGE";
		public static const VIEWER_CREATE:String = "CREATE";		 

		private var _msg:String;
		private var _type:String;
		private	var _moduleName:String;
		private	var _viewerId:String;
		private	var _action:String;
		private	var _payload:Array;
		

		
		public function ViewerMessage(msg:String)
		{
			this._msg = msg;
			loadMessage();
		}
		
		public function get stringMessage():String
		{
			return _msg;
		} 
		
		public function get type():String
		{
			return _type;
		}
		public function get moduleName():String
		{
			return _moduleName;
		}
		public function get viewerId():String
		{
			return _viewerId;
		}
		public function get action():String
		{
			return _action;
		}
		public function get payload():Array
		{
			return _payload;
		}		
		
		public static function createViewerMessage(type:String, moduleName:String, viewerId:String,action:String,payload:Object)
		{
			var msg:String = ViewerMessage.VIEWER_DELIMITER + //designates this is a viewer message
				ViewerMessage.MESSAGE_DELIMITER + 
				type +  //designates that this viewer is being shared inline with the existing room, otherwise it is a unique jid
				ViewerMessage.MESSAGE_DELIMITER +  //::
				moduleName +  //designates that this viewer is being shared inline with the existing room, otherwise it is a unique jid
				ViewerMessage.MESSAGE_DELIMITER + //::
				viewerId +  //designates that this viewer is being shared inline with the existing room, otherwise it is a unique jid
				ViewerMessage.MESSAGE_DELIMITER + //::
				action; //Custom viewer message to be interpreted by IViewerMediator
				
				
			for(var i in payload){
				msg = msg + ViewerMessage.MESSAGE_DELIMITER + payload[i];
			}
			
			var viewerMessage:ViewerMessage = new ViewerMessage(msg);
			return viewerMessage;
		}

		public static function getViewerMessage(msg:String):ViewerMessage
		{
			if(msg != null && msg.indexOf(VIEWER_DELIMITER) >= 0)
			{
				return new ViewerMessage(msg);
			}
			return null;
		}
		
		private function loadMessage():void
		{
			var parts:Array = _msg.split(ViewerMessage.MESSAGE_DELIMITER);
			_type = parts[1];
			_moduleName = parts[2];
			_viewerId = parts[3];
			_action = parts[4];
			_payload = new Array();
			var i:int = 5;
			while(i < parts.length){
				_payload.push(parts[i++]);
			}
		}
	}
}