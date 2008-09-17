/*
 * Copyright (C) 2003-2007 
 * Nick Velloff <nick.velloff@gmail.com>
 * Derrick Grigg <dgrigg@rogers.com>
 * Sean Voisen <sean@voisen.org>
 * Sean Treadway <seant@oncotype.dk>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
 *
 */
	 
package org.jivesoftware.xiff.events
{
	import flash.events.Event;
	
	import org.jivesoftware.xiff.core.UnescapedJID;

	public class RosterEvent extends Event
	{
		public static const SUBSCRIPTION_REVOCATION:String = "subscriptionRevocation";
		public static const SUBSCRIPTION_REQUEST:String = "subscriptionRequest";
		public static const SUBSCRIPTION_DENIAL:String = "subscriptionDenial";
		public static const USER_AVAILABLE:String = "userAvailable";
		public static const USER_UNAVAILABLE:String = "userUnavailable";
		public static const USER_ADDED:String = 'userAdded';
		public static const USER_REMOVED:String = 'userRemoved';
		public static const USER_PRESENCE_UPDATED:String = 'userPresenceUpdated';
		public static const USER_SUBSCRIPTION_UPDATED:String = 'userSubscriptionUpdated';
		public static const ROSTER_LOADED:String = "rosterLoaded";
		
		private var _data:*;
		private var _jid:UnescapedJID;
		
		public function RosterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		public function get jid():UnescapedJID
		{
			return _jid;
		}
		public function set jid(s:UnescapedJID):void
		{
			_jid = s;
		}
		public function get data():*
		{
			return _data;
		}
		public function set data(d:*):void
		{
			_data = d;
		}
	}
}