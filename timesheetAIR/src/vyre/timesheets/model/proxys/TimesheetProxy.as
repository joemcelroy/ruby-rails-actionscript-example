package vyre.timesheets.model.proxys
{
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import vyre.timesheets.model.business.TimesheetDelegate;
	import vyre.timesheets.model.responders.TimesheetResponder;
	import vyre.timesheets.model.vo.TimesheetVO;
	
	public class TimesheetProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "TimesheetProxy";
		
		public function TimesheetProxy() {
			super(NAME, new ArrayCollection);
		}
		
		public function get dayTimesheets():ArrayCollection {
			return data as ArrayCollection;
		}
		
		public function set dayTimesheets(timesheets:ArrayCollection):void {
			data = timesheets;
		}
		
		public function addTimesheet(timesheet:TimesheetVO):void {
			var responder:TimesheetResponder = new TimesheetResponder(this, TimesheetResponder.ADD_TIMESHEET);
			var timesheetDelegate:TimesheetDelegate = new TimesheetDelegate(responder);
			timesheetDelegate.createTimesheet(timesheet);
		}
		
		public function updateTimesheet(timesheet:TimesheetVO):void {
			var responder:TimesheetResponder = new TimesheetResponder(this, TimesheetResponder.UPDATE_TIMESHEET);
			var delegate:TimesheetDelegate = new TimesheetDelegate(responder);
		    delegate.updateTimesheet(timesheet);
		}
		
		public function getTimesheets():void {
			var responder:TimesheetResponder = new TimesheetResponder(this, TimesheetResponder.TIMESHEET_LIST);
			var delegate:TimesheetDelegate = new TimesheetDelegate(responder);
			delegate.listTimesheets();
		}
	}
}