package com.bigbangtechnology.preventableTabNavigator
{
	import flash.events.Event;
	import mx.events.IndexChangedEvent;
	import flash.display.DisplayObject;

	public class PreventableTabNavigatorEvent extends IndexChangedEvent
	{
		public static const CHANGING:String = "changing";
		
		public function PreventableTabNavigatorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, relatedObject:DisplayObject=null, oldIndex:Number=-1, newIndex:Number=-1, triggerEvent:Event=null)
		{
			super(type, bubbles, cancelable, relatedObject, oldIndex, newIndex, triggerEvent);
		}
		
	}
}