package vyre.timesheets.view
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import vyre.timesheets.ApplicationFacade;
	import vyre.timesheets.model.proxys.UserProxy;
	import vyre.timesheets.view.components.TimesheetPanel;
	
	public class MainViewMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "MainViewMediator";
		
		public function MainViewMediator( viewComponent:Object ) {
			
			super( NAME, viewComponent );	
			facade.registerMediator( new TimesheetStatusMediator( app.timesheetStatusPanel ));
			facade.registerMediator(new TimesheetToolbarMediator(app.timesheetToolbarPanel));
			facade.registerMediator(new TimesheetHeaderMediator(app.timesheetHeaderPanel));
			facade.registerMediator(new NotificationWindowMediator(app));
			
		}
		
		override public function listNotificationInterests():Array {
			return [
				UserProxy.LOGIN_SUCCESS,
				ApplicationFacade.TOGGLE_ADD_TIMESHEET_SCREEN
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			
			switch( notification.getName() ) {
				
				case UserProxy.LOGIN_SUCCESS:
					sendNotification(ApplicationFacade.VIEW_TIMESHEETS);
					sendNotification(ApplicationFacade.VIEW_PROJECTS);
					break;
				
				case ApplicationFacade.TOGGLE_ADD_TIMESHEET_SCREEN:
					toggleTimesheetForm();
				
			}
				
		}	
		
		private function toggleTimesheetForm():void {

			switch (app.currentState) {
				case "timesheet-expanded":
				   app.currentState = "";
				   break;
				default:
				   app.currentState = "timesheet-expanded";
				   break;
			}
		}
		
		protected function get app():TimesheetPanel {
			return viewComponent as TimesheetPanel;
		}

	}
}