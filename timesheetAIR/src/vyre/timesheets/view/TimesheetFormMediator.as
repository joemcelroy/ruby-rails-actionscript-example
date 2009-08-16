package vyre.timesheets.view
{
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import vyre.timesheets.ApplicationFacade;
	import vyre.timesheets.model.proxys.ProjectProxy;
	import vyre.timesheets.model.vo.ProjectVO;
	import vyre.timesheets.model.vo.TimesheetVO;
	import vyre.timesheets.view.components.TimesheetFormPanel;
	
	public class TimesheetFormMediator extends Mediator implements IMediator {

		public static const NAME:String = "TimesheetFormMediator";
		
		public function TimesheetFormMediator( viewComponent:TimesheetFormPanel ) {
			
			super( NAME, viewComponent );	
			app.addEventListener(TimesheetFormPanel.CREATE_TIMESHEET, createTimesheet);
			
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.PROJECTS_LOADED
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			
			switch( notification.getName() ) {
				
				case ApplicationFacade.PROJECTS_LOADED:
					
					break;
					
					
			}
				
		}
		
        override public function onRegister():void
        {
            app.projectCollection = projectProxy.projects;
            
        }

		
		protected function get app():TimesheetFormPanel {
			return viewComponent as TimesheetFormPanel;
		}
		
		private function createTimesheet(event:Event):void {
			
			var timesheet:TimesheetVO = new TimesheetVO();
			timesheet.description = app.description.text;
			timesheet.billable_type = app.billableType.text;
			timesheet.hours = Number(app.hours.text);
			timesheet.day = new Date();
			timesheet.project = app.projectId.selectedItem as ProjectVO;
			
			sendNotification(ApplicationFacade.CREATE_TIMESHEET, timesheet);
		}
		
		private function get projectProxy():ProjectProxy {
			return facade.retrieveProxy(ProjectProxy.NAME) as ProjectProxy;
		}

	}
}