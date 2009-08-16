package vyre.timesheets.model.responders
{	
	import flash.xml.XMLNode;
	
	import mx.rpc.IResponder;
	
	import vyre.timesheets.model.proxys.UserProxy;
	import vyre.timesheets.model.vo.UserVO;
	
	public class LoginResponder implements IResponder {
		
		private var userProxy:UserProxy;
		
		public function LoginResponder(userProxy:UserProxy)  {
			this.userProxy = userProxy;
		}
		
		public function result(event:Object):void {
			var userXML:XML = XML(event.result) ;
			
			if (userXML != "badlogin") {
				userProxy.sendNotification(UserProxy.LOGIN_SUCCESS, userXML);
			} else {
				userProxy.sendNotification(UserProxy.LOGIN_FAILED, userXML);
			}
			
		}
		
		public function fault(event:Object):void {
			
		}

	}
}