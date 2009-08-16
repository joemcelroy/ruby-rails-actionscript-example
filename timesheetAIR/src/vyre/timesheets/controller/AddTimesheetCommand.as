package vyre.timesheets.controller
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import vyre.timesheets.model.proxys.TimesheetProxy;
	import vyre.timesheets.model.vo.TimesheetVO;
	
	public class AddTimesheetCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			
			var timesheet:TimesheetVO = notification.getBody() as TimesheetVO;
			var timesheetProxy:TimesheetProxy = facade.retrieveProxy( TimesheetProxy.NAME ) as TimesheetProxy;
			timesheetProxy.addTimesheet( timesheet );
			
		}

	}
}