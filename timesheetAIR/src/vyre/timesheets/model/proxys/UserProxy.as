package vyre.timesheets.model.proxys
{
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import vyre.timesheets.model.business.LoginDelegate;
	import vyre.timesheets.model.responders.LoginResponder;
	import vyre.timesheets.model.vo.UserVO;
	
	
	public class UserProxy extends Proxy implements IProxy 	{
		
		public static const NAME:String ="UserProxy";
		
		public static const LOGIN_SUCCESS:String = "loginSuccess";
		public static const LOGIN_FAILED:String = "loginFailed";
		

		public function UserProxy( data:Object=null ) {
			super( NAME, data );
		}
		
		public function login( user:UserVO ):void {
			var responder:LoginResponder = new LoginResponder( this );
			var delegate:LoginDelegate = new LoginDelegate( responder );
			delegate.login( user );
		}


		public function get user():UserVO {
			return data as UserVO;
		}
		
		public function set user(user:UserVO):void {
			this.data = user;
		}
		
		
		
	}
}