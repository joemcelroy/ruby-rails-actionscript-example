package vyre.timesheets.view
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import vyre.timesheets.view.components.TimesheetHeaderPanel;
	
	public class TimesheetHeaderMediator extends Mediator implements IMediator {
		
	    public static const NAME:String = "TimesheetHeaderMediator";
	    
		public function TimesheetHeaderMediator(viewComponent:TimesheetHeaderPanel) {
			super(NAME,viewComponent);
		}

	}
}