package vyre.timesheets.controller
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import vyre.timesheets.model.proxys.TimesheetProxy;
	
	
	public class ViewTimesheetsCommand extends SimpleCommand  {
		
		override public function execute(notification:INotification):void {
			
			var timesheetProxy:TimesheetProxy = facade.retrieveProxy( TimesheetProxy.NAME ) as TimesheetProxy;
			timesheetProxy.getTimesheets();
			trace("timesheets command sent");
		}
		
    }
}