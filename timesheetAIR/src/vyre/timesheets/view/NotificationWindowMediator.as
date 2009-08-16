package vyre.timesheets.view
{
	import flash.display.NativeWindowSystemChrome;
	import flash.display.NativeWindowType;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.core.Window;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import vyre.timesheets.ApplicationFacade;
	import vyre.timesheets.model.vo.TimesheetVO;
	import vyre.timesheets.view.components.NotificationWindow;
	import vyre.timesheets.view.components.TimesheetPanel;
	
	public class NotificationWindowMediator extends Mediator implements IMediator {
		
	    public static const NAME:String = "NotificationWindowMediator";
	    
	    private var closingTimer:Timer = new Timer(4000,1);
	    private var window:Window = null;
		
		public function NotificationWindowMediator(viewComponent:TimesheetPanel) {
			super(NAME, viewComponent);
			closingTimer.addEventListener(TimerEvent.TIMER, closeWindow);
			
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.TIMESHEET_RUNNING_NOTIFICATION,
				ApplicationFacade.NO_TIMESHEETS_RUNNING_NOTIFICATION	
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			
			switch( notification.getName() ) {
				
				case ApplicationFacade.TIMESHEET_RUNNING_NOTIFICATION:
					notificationWindow(notification.getBody() as TimesheetVO);
					break;
				
				case ApplicationFacade.NO_TIMESHEETS_RUNNING_NOTIFICATION:
					notificationWindow(notification.getBody() as TimesheetVO);
					break;
					
			}
				
		}
		
		private function closeWindow(e:Event):void {
			window.close();
		}
		
		private function notificationWindow(timesheet:TimesheetVO):void {
			this.window = new NotificationWindow();
			window.data = timesheet;
			window.systemChrome = NativeWindowSystemChrome.NONE;
			window.type = NativeWindowType.LIGHTWEIGHT;
			window.transparent = false;
			window.open(true);
			window.nativeWindow.x = flash.display.Screen.mainScreen.bounds.width - (window.width + 20);
			window.nativeWindow.y = 30;
            closingTimer.reset();
            closingTimer.start();
		}

	}
}