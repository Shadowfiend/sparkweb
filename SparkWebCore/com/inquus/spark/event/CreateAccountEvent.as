package com.inquus.spark.event
{
	import flash.events.Event;

	public class CreateAccountEvent extends Event
	{
		public static const CREATE:String = "accountCreate";
		public static const ACCOUNT_CREATED:String = "accountCreated";
		public static const ACCOUNT_ERROR:String = "accountError";
		public static const ACCOUNT_CANCEL:String = "accountCancel";
				
		public var username:String;
		public var password:String;
		public var email:String;
		
		public function CreateAccountEvent(type:String, username:String=null, password:String=null, email:String=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.username = username;
			this.password = password;
			this.email = email;
		}
		
		// Override the inherited clone() method. 
        override public function clone():Event {
            return new CreateAccountEvent(type, username, password, email, bubbles, cancelable);
        }

		
		
		
	}
}