package vyre.timesheets.model.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.remoting.RemoteObject;
	
	import vyre.timesheets.model.responders.TimesheetResponder;
	import vyre.timesheets.model.vo.TimesheetVO;
	
	public class TimesheetDelegate
	{
		private var timesheetResponder:TimesheetResponder
		private var service:RemoteObject;
		
		public function TimesheetDelegate(timesheetResponder:TimesheetResponder) {
			this.timesheetResponder = timesheetResponder;
			this.service = ServiceLocator.getInstance().getRemoteObject("timesheetRO");
		}
		
		public function createTimesheet(timesheet:TimesheetVO) :void {
			var call:Object = this.service.create.send(timesheet); 
            call.addResponder(this.timesheetResponder); 
		}
		
		public function listTimesheets():void {
			var call:Object = this.service.index.send();
			call.addResponder(this.timesheetResponder);
			
		}
		
		public function updateTimesheet(timesheet:TimesheetVO):void {
			var call:Object = this.service.update(timesheet);
			call.addResponder(this.timesheetResponder);
		}
		
		public function destroyTimesheet(timesheet:TimesheetVO):void {
			var call:Object = this.service.destroy(timesheet.id);
			call.addResponder(this.timesheetResponder);
		}

	}
}