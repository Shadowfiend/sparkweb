/*
 *This file is part of SparkWeb.
 *
 *SparkWeb is free software: you can redistribute it and/or modify
 *it under the terms of the GNU Lesser General Public License as published by
 *the Free Software Foundation, either version 3 of the License, or
 *(at your option) any later version.
 *
 *SparkWeb is distributed in the hope that it will be useful,
 *but WITHOUT ANY WARRANTY; without even the implied warranty of
 *MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *GNU Lesser General Public License for more details.
 *
 *You should have received a copy of the GNU Lesser General Public License
 *along with SparkWeb.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
Copyright (c) 2007 FlexLib Contributors.  See:
    http://code.google.com/p/flexlib/wiki/ProjectContributors

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

package com.jivesoftware.spark
{
	import flash.display.DisplayObject;
	
	import mx.containers.Canvas;
	import mx.controls.Button;
	import mx.core.EdgeMetrics;
	import mx.core.IContainer;
	import mx.core.IDataRenderer;
	import mx.core.IFlexDisplayObject;
	import mx.core.IRawChildrenContainer;
	import mx.core.ScrollPolicy;
	import mx.core.UIComponent;
	import mx.core.UIComponentDescriptor;
	import mx.core.mx_internal;
	import mx.managers.IFocusManagerContainer;
	
	use namespace mx_internal;

	/**
	 * A Button control that allows you to add any UI components to the Button via MXML.
	 * 
	 * <p>The CanvasButton is an extension of Button that lets you set the contents of the Button
	 * to any UI components, as opposed to only a single icon and label like the normal Button control
	 * allows.</p>
	 * 
	 * <p>
	 * Example usage:
	 * <pre>
	 * &lt;flexlib:CanvasButton width="150" &gt;
	 *		&lt;mx:VBox height="100%" width="100%" verticalGap="0"&gt;
	 * 			&lt;mx:Label text="This is a" width="100%" textAlign="left" /&gt;
	 * 			&lt;mx:Label text="crazy" textAlign="center" fontSize="20" fontStyle="italic" fontWeight="bold" width="100%" /&gt;
	 * 			&lt;mx:Label text="button!" width="100%" textAlign="right" /&gt;
	 *		&lt;/mx:VBox&gt;
	 * &lt;/flexlib:CanvasButton&gt;
	 * </pre>
	 * </p>
	 * 
	 * @see mx.controls.Button
	 */
	public class CompatibleCanvasButton extends Button implements IContainer
	{
		/**
		 * @private 
		 * 
		 * The internal canvas that's going to hold all the child components.
		 */
		private var canvas:Canvas;
		
		public function CompatibleCanvasButton():void {
			super();
			
			
		}
		
		/* Begin compatibility hack. Jive changes */
		
		public function get defaultButton():IFlexDisplayObject
		{
			return canvas.defaultButton;
		}
		
		public function set defaultButton(b:IFlexDisplayObject):void
		{
			canvas.defaultButton = b;
		}
		
		public function get creatingContentPane():Boolean
		{
			return canvas.creatingContentPane;
		}
		
   		public function set creatingContentPane(value:Boolean):void
   		{
   			canvas.creatingContentPane = value;
   		}
   		
   		public function get horizontalScrollPosition():Number 
   		{
   			return canvas.horizontalScrollPosition;	
   		}
   		
    	public function set horizontalScrollPosition(value:Number):void 
    	{
    		canvas.horizontalScrollPosition = value;
    	}
    	
    	public function get viewMetrics():EdgeMetrics 
    	{
    		return canvas.viewMetrics;
    	}
    	
    	public function get verticalScrollPosition():Number
    	{
    		return canvas.verticalScrollPosition;
    	}
    	
    	public function set verticalScrollPosition(value:Number):void
    	{
    		canvas.verticalScrollPosition = value;
    	}
   		
   		/* End compatibility hack */
		
		private var _childrenCreated:Boolean = false;
		
		override protected function createChildren():void {
			super.createChildren();
			
			//create our canvas and add it to the display list
			canvas = new Canvas();
			canvas.verticalScrollPolicy = _verticalScrollPolicy;
			canvas.horizontalScrollPolicy = _horizontalScrollPolicy;
			super.addChild(canvas);
			
			//if child components have been specified in MXML then we need 
			//to add them all now
			createComponents();
			
			mouseChildren = true;
			
			_childrenCreated = true;	
		}
		
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			//make sure our wrapper canvas is the right size
			canvas.setActualSize(unscaledWidth, unscaledHeight);
		}
		
		override protected function measure():void {
			super.measure();
			
			// we're using the canvas size as our measured height and width, instead of
			// the normal button measure sizes, which measures the icon and textfield for the label.
			// For this component we'll ignore the textfield and icon.
			measuredHeight = canvas.getExplicitOrMeasuredHeight();
			measuredWidth = canvas.getExplicitOrMeasuredWidth();
		}
    	
    	/**
    	 * @private
    	 */
    	override mx_internal function layoutContents(unscaledWidth:Number,
                                        unscaledHeight:Number,
                                        offset:Boolean):void
        {
        	super.layoutContents(unscaledWidth, unscaledHeight, offset);
        	
        	//gotta make sure the canvas is above the skin
        	setChildIndex(canvas, numChildren - 1);
        }
    	
    	
		
		/**
		 * @private
		 * 
		 * Array to hold the UIComponentDescriptor objects that get set since this component implements IContainer.
		 * These will get added the our wrapper canvas once it gets created.
		 */
		private var _childDescriptors:Array;
		
		/**
		 * Since this class implements IContainer, when it is created it's parent container will set
		 * the childDescriptors property with UIComponentDescriptor objects. These are used to create 
		 * the child components that are set in MXML.
		 */
		
		public function set childDescriptors(value:Array):void {
			_childDescriptors = value;
		}
		
		mx_internal function setDocumentDescriptor(desc:UIComponentDescriptor):void {
			
			if (_documentDescriptor && _documentDescriptor.properties.childDescriptors) {
            	if (desc.properties.childDescriptors) {
                	throw new Error("Multiple sets of visual children have been specified for this component (base component definition and derived component definition).");
				}
			} else {
				_documentDescriptor = desc;
				_documentDescriptor.document = this;
			}
                   
            if(desc.properties.childDescriptors) {
				this.childDescriptors = desc.properties.childDescriptors; 
			}
		}
		
		/**
		 * @private
		 * 
		 * Calls createComponentFromDescriptor() on the canvas component and passes all the UIComponentDescriptor objects
		 * that have been set.
		 */
		private function createComponents():void {
			for each(var desc:UIComponentDescriptor in _childDescriptors) {
				canvas.createComponentFromDescriptor(desc, true);
			}
		}
		
		private var _horizontalScrollPolicy:String = ScrollPolicy.AUTO;
	    
		public function get horizontalScrollPolicy():String
	    {
	        return _horizontalScrollPolicy;
	    }
	
	    /**
	     *  @private
	     */
	    public function set horizontalScrollPolicy(value:String):void
	    {
	        _horizontalScrollPolicy = value;
	        
	        if(canvas)
	        	canvas.horizontalScrollPolicy = value;
	    }
	    
	    private var _verticalScrollPolicy:String = ScrollPolicy.AUTO;
	    
	    public function get verticalScrollPolicy():String
	    {
	        return _verticalScrollPolicy;
	    }
	
	    /**
	     *  @private
	     */
	    public function set verticalScrollPolicy(value:String):void
	    {
	        _verticalScrollPolicy = value;
	        
	        if(canvas)
	        	canvas.verticalScrollPolicy = value;
	    }
		
		
		
	}
}