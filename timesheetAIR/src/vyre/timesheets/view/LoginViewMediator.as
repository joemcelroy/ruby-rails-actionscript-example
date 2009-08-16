package vyre.timesheets.view
{
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import vyre.timesheets.ApplicationFacade;
	import vyre.timesheets.model.proxys.UserProxy;
	import vyre.timesheets.model.vo.UserVO;
	import vyre.timesheets.view.components.LoginPanel;
	
	public class LoginViewMediator extends Mediator implements IMediator  {
		
		public static const NAME:String = "LoginViewMediator";
		
		public function LoginViewMediator(viewComponent:LoginPanel) {
			super(NAME, viewComponent);
			app.addEventListener(LoginPanel.APP_LOGIN, login);
		}
		
		override public function listNotificationInterests():Array {
			return [
				UserProxy.LOGIN_FAILED
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			
			switch( notification.getName() ) {
				
				case UserProxy.LOGIN_FAILED:
					app.loginFailed();
					break;
				
			}
				
		}
		
		protected function get app():LoginPanel {
			return viewComponent as LoginPanel;
		}
		
	    private function login(event:Event):void {
	      
	      var user:UserVO = new UserVO();
	      user.username = app.usernameInput.text;
	      user.password = app.passwordInput.text;
	      sendNotification(ApplicationFacade.LOGIN, user);
	      
	    }

	}
}