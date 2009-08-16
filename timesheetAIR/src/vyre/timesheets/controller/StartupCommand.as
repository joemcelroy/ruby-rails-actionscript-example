package vyre.timesheets.controller
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import vyre.timesheets.ApplicationFacade;
	import vyre.timesheets.model.proxys.TimesheetProxy;
	import vyre.timesheets.view.ApplicationMediator;
	import vyre.timesheets.view.LoginViewMediator;
	import vyre.timesheets.view.MainViewMediator;
	
	public class StartupCommand extends SimpleCommand {
		
	    override public function execute(note:INotification):void {
	    	
	      var app:timesheetAIR = note.getBody() as timesheetAIR;
	      facade.registerMediator(new ApplicationMediator(app));
	      
	      var timesheetProxy:TimesheetProxy = facade.retrieveProxy(TimesheetProxy.NAME) as TimesheetProxy;
	      
	      switch (note.getName()) {
	      	case ApplicationFacade.STARTUP:
	      	    facade.registerMediator( new LoginViewMediator( app.loginPanel ));
				facade.registerMediator( new MainViewMediator( app.timesheetPanel ));
	      		break;
	      		
	      }
	      
	    }
	}
}