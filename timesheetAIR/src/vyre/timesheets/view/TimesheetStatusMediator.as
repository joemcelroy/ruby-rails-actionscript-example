package vyre.timesheets.view
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import vyre.timesheets.ApplicationFacade;
	import vyre.timesheets.model.proxys.TimesheetProxy;
	import vyre.timesheets.model.vo.TimesheetVO;
	import vyre.timesheets.view.components.TimesheetStatusPanel;
	import vyre.timesheets.view.components.timesheetTileItemRenderer;
	
	public class TimesheetStatusMediator extends Mediator implements IMediator {
		
	    public static const NAME:String = "TimesheetStatusMediator";
	    
	    [Bindable]
	     private var runningTimesheet:timesheetTileItemRenderer;
	     
	     private var timer:Timer = new Timer((0.5*60000),0);
		
		public function TimesheetStatusMediator( viewComponent:Object ) {
			
			super( NAME, viewComponent );
			app.addEventListener(timesheetTileItemRenderer.START_WATCH, startWatch);
			app.addEventListener(timesheetTileItemRenderer.STOP_WATCH, stopWatch);
			
			timer.addEventListener(TimerEvent.TIMER, timerNotification);
			timer.start();
			
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.TIMESHEETS_LOADED,
				ApplicationFacade.VIEW_TIMESHEETS
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			
			switch( notification.getName() ) {
				
				case ApplicationFacade.TIMESHEETS_LOADED:
					
					app.timesheetCollection = timesheetProxy.dayTimesheets;
					break;
					
			}
				
		}
		
		private function startWatch(e:Event):void {
			var itemRender:timesheetTileItemRenderer = e.target as timesheetTileItemRenderer;
			if (runningTimesheet != null && itemRender != runningTimesheet && runningTimesheet.isRunningTimer) {
			   runningTimesheet.stopWatchTimer();
			}
			runningTimesheet = itemRender;
			sendNotification(ApplicationFacade.START_TIMESHEET, itemRender.data);
            timer.reset();
            timer.start();			
		}
		
		private function stopWatch(e:Event):void {
			var itemRender:timesheetTileItemRenderer = e.target as timesheetTileItemRenderer;
			runningTimesheet = null;
			sendNotification(ApplicationFacade.STOP_TIMESHEET, itemRender.data);
            timer.reset();	
            timer.start();
		}
		
		private function timerNotification(e:Event):void {
			if (runningTimesheet != null) {
			    sendNotification(ApplicationFacade.TIMESHEET_RUNNING_NOTIFICATION, runningTimesheet.data);
			} else {
			    sendNotification(ApplicationFacade.NO_TIMESHEETS_RUNNING_NOTIFICATION, new TimesheetVO);
			}
		}
		
		protected function get app():TimesheetStatusPanel {
			return viewComponent as TimesheetStatusPanel;
		}
		
		private function get timesheetProxy():TimesheetProxy {
			return facade.retrieveProxy(TimesheetProxy.NAME) as TimesheetProxy;
		}

	}
}