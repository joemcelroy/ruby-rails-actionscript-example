package vyre.timesheets.view
{
	import flash.events.Event;
	
	import mx.core.UIComponent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import vyre.timesheets.CommonEvents;
	import vyre.timesheets.model.proxys.UserProxy;
	import vyre.timesheets.view.components.TimesheetFormPanel;
	import vyre.timesheets.view.components.TimesheetPanel;
	
	public class ApplicationMediator extends Mediator implements IMediator {
	    
	    public static const NAME:String = "ApplicationMediator";
		private static const LOGIN_SCREEN:Number = 0;
		private static const TIMESHEET_SCREEN:Number = 1;    
		
		public function ApplicationMediator( viewComponent:Object ) {
			
			super( NAME, viewComponent );
			viewComponent.addEventListener(CommonEvents.COMPONENT_INITIALIZED,onComponentReady,false,0,true);	
			
		}
		
		override public function listNotificationInterests():Array {
			return [
				UserProxy.LOGIN_SUCCESS
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			
			switch( notification.getName() ) {
				
				case UserProxy.LOGIN_SUCCESS:
					app.applicationScreens.selectedIndex = TIMESHEET_SCREEN;
					break;
				
			}
				
		}
		
		public function onComponentReady(event:Event):void {
			var comp:UIComponent = event.target as UIComponent;
			switch(comp.id) {
				case "timesheetFormPanel":
				   var timesheetFormPanel:TimesheetFormPanel = comp as TimesheetFormPanel;
				   facade.registerMediator(new TimesheetFormMediator(timesheetFormPanel));
				   break;
				    
			}	
		}
		
		protected function get app():timesheetAIR {
			return viewComponent as timesheetAIR;
		}
		

	}
}