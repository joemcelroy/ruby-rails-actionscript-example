package vyre.timesheets.controller
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import vyre.timesheets.model.proxys.ProjectProxy;
	
	public class ViewProjectsCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			
			var proxy:ProjectProxy = facade.retrieveProxy( ProjectProxy.NAME ) as ProjectProxy;
			proxy.retrieveProjects();
			trace("view projects command sent");
		}

	}
}