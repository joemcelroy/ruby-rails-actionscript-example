package vyre.timesheets.view
{
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import vyre.timesheets.ApplicationFacade;
	import vyre.timesheets.view.components.TimesheetToolbarPanel;
	
	public class TimesheetToolbarMediator extends Mediator implements IMediator {
		
	    public static const NAME:String = "TimesheetToolbarMediator";
	    	    
		public function TimesheetToolbarMediator(viewComponent:TimesheetToolbarPanel) {
			super(NAME, viewComponent);
			app.addEventListener(TimesheetToolbarPanel.NEW_TIMESHEET, toggleNewTimesheet);
		}
		
		public function toggleNewTimesheet(event:Event):void {
			
			sendNotification(ApplicationFacade.TOGGLE_ADD_TIMESHEET_SCREEN);
		}
		
		protected function get app():TimesheetToolbarPanel {
			return viewComponent as TimesheetToolbarPanel;
		}		

	}
}