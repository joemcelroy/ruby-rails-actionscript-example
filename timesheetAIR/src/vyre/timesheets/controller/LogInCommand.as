package vyre.timesheets.controller
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
    import vyre.timesheets.ApplicationFacade;
  	
	import vyre.timesheets.model.proxys.UserProxy;
	import vyre.timesheets.model.vo.UserVO;
	
	public class LogInCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			
			var userVO:UserVO = notification.getBody() as UserVO;
			var userProxy:UserProxy = facade.retrieveProxy( UserProxy.NAME ) as UserProxy;
			userProxy.login( userVO );
			
		}

	}
}