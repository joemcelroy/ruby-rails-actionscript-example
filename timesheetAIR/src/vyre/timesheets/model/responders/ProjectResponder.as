package vyre.timesheets.model.responders
{
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	import vyre.timesheets.ApplicationFacade;
	import vyre.timesheets.model.proxys.ProjectProxy;
	
	public class ProjectResponder implements IResponder {
		
		public static const RETRIEVE_PROJECTS:String = "retrieveProjects";
		
		private var projectProxy:ProjectProxy;
		private var resultAction:String;
		
		public function ProjectResponder(proxy:ProjectProxy, action:String) {
			this.projectProxy = proxy;
			this.resultAction = action;
		}
		
		public function result(event:Object):void {
			switch (this.resultAction) {
				case (RETRIEVE_PROJECTS):
					viewProjectsResult(event);
			}
		}
		
		public function fault(event:Object):void {
			
		}
		
		public function viewProjectsResult(event:Object):void {
			var payload:ArrayCollection = event.result as ArrayCollection;
			projectProxy.projects = payload;
			projectProxy.sendNotification(ApplicationFacade.PROJECTS_LOADED, payload);
		}

	}
}