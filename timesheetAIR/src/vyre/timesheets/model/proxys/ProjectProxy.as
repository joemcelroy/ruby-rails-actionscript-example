package vyre.timesheets.model.proxys
{
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import vyre.timesheets.model.business.ProjectDelegate;
	import vyre.timesheets.model.responders.ProjectResponder;
	
	public class ProjectProxy extends Proxy implements IProxy {
		
		public static const NAME:String = 'ProjectProxy';
		
		public function ProjectProxy() {
			super(NAME, new ArrayCollection);
		}
		
		public function retrieveProjects():void {
			var responder:ProjectResponder = new ProjectResponder(this, ProjectResponder.RETRIEVE_PROJECTS);
			var delegate:ProjectDelegate = new ProjectDelegate(responder);
			delegate.listProjects();
		}
		
		public function set projects(projects:ArrayCollection):void {
			this.data = projects;
		}
		
		public function get projects():ArrayCollection {
			return data as ArrayCollection;
		}

	}
}