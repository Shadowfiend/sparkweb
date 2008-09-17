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
	
	import org.jivesoftware.xiff.conference.Room;
	import org.jivesoftware.xiff.core.UnescapedJID;
	import org.jivesoftware.xiff.data.Message;

	public class InviteEvent extends Event
	{
		public static var INVITED:String = "invited";
		private var _from:UnescapedJID;
		private var _reason:String;
		private var _room:Room;
		private var _data:Message;
		public function InviteEvent()
		{
			super(INVITED);
		}
		public function get from():UnescapedJID
		{
			return _from;
		}
		public function set from(s:UnescapedJID) : void
		{
			_from = s;
		}
		public function get reason() : String
		{
			return _reason;
		}
		public function set reason(s:String) : void
		{
			_reason = s;
		}
		public function get room() : Room
		{
			return _room;
		}
		public function set room(d:Room) : void
		{
			_room = d;
		}
		public function get data() : Message
		{
			return _data;
		}
		public function set data(d:Message) : void
		{
			_data = d;
		}
	}
}