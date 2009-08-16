package vyre.timesheets.model.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.http.HTTPService;
	
	import vyre.timesheets.model.responders.LoginResponder;
	import vyre.timesheets.model.vo.UserVO;
	
	public class LoginDelegate {
		private var loginResponder:LoginResponder;
		
		public function LoginDelegate(loginResponder:LoginResponder)  {
			this.loginResponder = loginResponder;
		}
		
		public function login(user:UserVO) : void {
			var service:HTTPService = ServiceLocator.getInstance().getHTTPService("userWS");
			var token:AsyncToken = service.send( user.userToXML);
			token.addResponder(this.loginResponder);
			
			 
		}

	}
}