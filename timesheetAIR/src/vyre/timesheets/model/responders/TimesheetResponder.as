package vyre.timesheets.model.responders
{
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	import vyre.timesheets.ApplicationFacade;
	import vyre.timesheets.model.proxys.TimesheetProxy;
	
	public class TimesheetResponder implements IResponder {
		
		public static const ADD_TIMESHEET:String = "addTimesheet";
		public static const TIMESHEET_LIST:String = "timesheetList";
		public static const UPDATE_TIMESHEET:String = "updateTimesheet";
		
		private var timesheetProxy:TimesheetProxy;
		private var resultAction:String;
		
		public function TimesheetResponder(timesheetProxy:TimesheetProxy, resultAction:String) {
			this.timesheetProxy = timesheetProxy;
			this.resultAction = resultAction;
		}
		
		public function result(event:Object):void {
			switch (this.resultAction) {
				case ADD_TIMESHEET:
					addTimesheetResult(event);
					break;
				case TIMESHEET_LIST:
					timesheetListResult(event);
					break;
				case UPDATE_TIMESHEET:
					updateTimesheetResult(event);
			}
		}
		
		public function fault(event:Object):void {
			trace("error in timesheet responder" + event.result);
		}
		
		private function addTimesheetResult(event:Object):void {
			timesheetProxy.dayTimesheets.addItem(event.result);
			timesheetProxy.sendNotification(ApplicationFacade.TIMESHEETS_LOADED, event.result);	
		}
		
		private function updateTimesheetResult(event:Object):void {
			timesheetProxy.dayTimesheets.itemUpdated(event.result);
			timesheetProxy.sendNotification(ApplicationFacade.TIMESHEETS_LOADED, event.result);
		}
		
		private function timesheetListResult(event:Object):void {
			timesheetProxy.dayTimesheets = event.result as ArrayCollection;
			timesheetProxy.sendNotification(ApplicationFacade.TIMESHEETS_LOADED, event.result);
		}

	}
}