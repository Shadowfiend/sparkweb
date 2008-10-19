package com.inquus.spark.viewers
{
	import flash.xml.XMLNode;
	
	import mx.rpc.xml.SimpleXMLDecoder;
	import mx.rpc.xml.SimpleXMLEncoder;
	
	import org.jivesoftware.xiff.data.Extension;
	import org.jivesoftware.xiff.data.ExtensionClassRegistry;
	import org.jivesoftware.xiff.data.IExtension;
	import org.jivesoftware.xiff.data.ISerializable;

	public class ViewerExtension extends Extension implements ISerializable, IExtension
	{
		public static var NS:String = "inquus:viewer";
		public static var ELEMENT:String = "x";
		
		public static var UPDATE_MESSAGE:String = "update";
		public static var CREATE_MESSAGE:String = "create";		
		public static var CLOSE_MESSAGE:String = "close";		
		    
		private var _viewerId:String;
		//type is the type of message: update, new, close
		private var _type:String;
		//the name of the module - may not be necessary after refactoring
		private var _reload:Boolean;
		private var _moduleName:String;
		private var _payload:Object;
		
		
		
		public function ViewerExtension(parent:XMLNode=null, extraParams:Object = null)
		{
			super(parent);
			
			if (extraParams != null)
			{
				_viewerId = extraParams.viewerId as String;
				_type = extraParams.type as String;
				_payload = extraParams.payload as Object;
				_moduleName = extraParams.moduleName as String;
				_reload = extraParams['reload'] as Boolean == true ? true : false;
			}
		}

		public function getNS():String
		{
			return NS;
		}
		
		public function getElementName():String
		{
			return ELEMENT;
		}
		
		public function get viewerId():String
		{
			return _viewerId;
		}
		public function get type():String
		{
			return _type;
		}
		public function get payload():Object
		{
			return _payload;
		}		
		
		public function get moduleName():String{
			return _moduleName;
		}
	
		public function get reload():Boolean
		{
			return _reload;
		}
		
		public function set reload(r:Boolean):void
		{
			_reload = r;
		}
		public function serialize(parentNode:XMLNode):Boolean
		{
			var node:XMLNode = getNode();
	
			node.attributes['id'] = _viewerId;
			node.attributes['type'] = _type;
			node.attributes['moduleName'] = _moduleName;
			node.attributes['reload'] = reload ? 'y' : 'n';
			
			var serializer:SimpleXMLEncoder = new SimpleXMLEncoder(null);
			serializer.encodeValue(_payload, new QName("openstudy", "payload"), node);
			if (parentNode != node.parentNode) {
				parentNode.appendChild(node.cloneNode(true));
			}
	
			return true;
		}
		
		public function deserialize(node:XMLNode):Boolean
		{
			setNode(node);
			_viewerId = node.attributes['id'];
			_type = node.attributes['type'];
			_moduleName = node.attributes['moduleName'];
			_reload = node.attributes['reload'] == 'y' ? true : false;
			_payload = new SimpleXMLDecoder(null).decodeXML(node.firstChild);
			return true;
		}
		
	    /**
	     * Performs the registration of this extension into the extension registry.  
	     * 
		 * @availability Flash Player 7
	     */
	    public static function enable():void
	    {
	        ExtensionClassRegistry.register(ViewerExtension);
	    }
				
		
	}
}