package com.bigbangtechnology.preventableTabNavigator
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.containers.TabNavigator;
	import mx.controls.TabBar;
		
	[Event(name="changing", type="com.bigbangtechnology.preventableTabNavigator.PreventableTabNavigatorEvent")]
	
	public class PreventableTabNavigator extends TabNavigator
	{
		[Inspectable(enumeration="true, false", defaultValue="false")]	
		public var automaticTabSwitch:Boolean = false;
		
		public function PreventableTabNavigator()
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			addEventListener(MouseEvent.CLICK, clickListener, true, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownListener, true, 0, true);
		}	
		
		
		//we capture any events made and stop them from doing anything in the click phase
		private function clickListener(e:MouseEvent):void
		{
			if (e.target.parent == this.tabBar) {
				if (!automaticTabSwitch) {
					e.preventDefault();
					e.stopImmediatePropagation();					
				}					
			}				
		}		
		
		//we then dispatch a custom event notifying whoever is listening, and let them take action
		private function mouseDownListener(e:MouseEvent):void
		{
			if (!automaticTabSwitch) {
				if (e.target.parent == this.tabBar) {								
					var requestedIndex:int = TabBar(e.target.parent).getChildIndex(e.target as DisplayObject);				
					var currentIndex:int = selectedIndex;				
					
					var ev:PreventableTabNavigatorEvent = new PreventableTabNavigatorEvent(PreventableTabNavigatorEvent.CHANGING);
					ev.newIndex = requestedIndex;
					ev.oldIndex = currentIndex;
					dispatchEvent(ev);				
				}
			}					
		}

	}
}