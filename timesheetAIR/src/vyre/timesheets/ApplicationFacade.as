package vyre.timesheets
{
	
	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.facade.*;
	
	import vyre.timesheets.controller.*;
	import vyre.timesheets.model.proxys.CompanyProxy;
	import vyre.timesheets.model.proxys.ProjectProxy;
	import vyre.timesheets.model.proxys.TimesheetProxy;
	import vyre.timesheets.model.proxys.UserProxy;
    
	public class ApplicationFacade extends Facade {
		
		public static const STARTUP:String = "startup";
		public static const LOGIN:String = "login";
		
		public static const CREATE_TIMESHEET:String = "createTimesheet";
		public static const START_TIMESHEET:String = "startTimesheet";
		public static const STOP_TIMESHEET:String = "stopTimesheet";
		
		public static const VIEW_TIMESHEETS:String = "retrieveTimesheets";
		public static const TIMESHEETS_LOADED:String = "timesheetsLoaded";
		
		public static const VIEW_PROJECTS:String = "retrieveProjects";
		public static const PROJECTS_LOADED:String = "projectsLoaded";
		
		/** view screen events **/
		
		public static const TOGGLE_ADD_TIMESHEET_SCREEN:String = "addTimesheetScreen";
		
		/** notification events **/
		
		public static const NO_TIMESHEETS_RUNNING_NOTIFICATION:String = "noTimesheetsRunningNotification";
		public static const TIMESHEET_RUNNING_NOTIFICATION:String = "timesheetRunningNotification";
		
				
        public static function getInstance() : ApplicationFacade {
            if (instance == null) instance = new ApplicationFacade();
            return instance as ApplicationFacade;
        }

        override protected function initializeController():void {
            super.initializeController();
            // here we register notification constants to commands
            registerCommand(STARTUP,StartupCommand);
            registerCommand(LOGIN, LogInCommand);
            
            registerCommand(VIEW_TIMESHEETS, ViewTimesheetsCommand);
            registerCommand(CREATE_TIMESHEET, AddTimesheetCommand);
            
            registerCommand(START_TIMESHEET, UpdateTimesheetCommand);
            registerCommand(STOP_TIMESHEET, UpdateTimesheetCommand);
            
            registerCommand(VIEW_PROJECTS, ViewProjectsCommand);
            
        }
      
	    public function startup(app:timesheetAIR):void {
	      sendNotification(STARTUP, app);
	    }
	    
        override public function retrieveProxy (proxyName:String):IProxy {
        	var proxy:IProxy;
        	if(model.retrieveProxy(proxyName) != null)
        	{
        		proxy = model.retrieveProxy(proxyName);
        	}
        	else
        	{
        		proxy = createProxy(proxyName);
        	}
        	return proxy;
		}
		
		private function createProxy(proxyName:String):IProxy 
		{
			var proxy:IProxy;
			switch(proxyName)
			{
				case CompanyProxy.NAME:
					proxy = new CompanyProxy;
					break;
				case ProjectProxy.NAME:
					proxy = new ProjectProxy;
					break;
				case TimesheetProxy.NAME:
					proxy = new TimesheetProxy;
					break;
				case UserProxy.NAME:
					proxy = new UserProxy;
					break;
			}
			// Register the proxy and return it
			registerProxy(proxy);
			return model.retrieveProxy(proxyName);
		}

	}
}