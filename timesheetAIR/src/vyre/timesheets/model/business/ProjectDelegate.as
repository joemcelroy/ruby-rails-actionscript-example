package vyre.timesheets.model.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.remoting.RemoteObject;
	
	import vyre.timesheets.model.responders.ProjectResponder;
	
	public class ProjectDelegate
	{
		private var projectResponder:ProjectResponder;
		private var service:RemoteObject;
		
		public function ProjectDelegate(responder:ProjectResponder) {
			this.projectResponder = responder;
			this.service = ServiceLocator.getInstance().getRemoteObject("projectRO");	
		}
		
		public function listProjects():void {
			var call:Object = this.service.index.send();
			call.addResponder(this.projectResponder);
		}

	}
}