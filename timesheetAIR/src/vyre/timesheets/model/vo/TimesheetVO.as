package vyre.timesheets.model.vo
{
	[RemoteClass(alias='vyre.timesheets.model.vo.TimesheetVO')]
	[Bindable]
	public class TimesheetVO {
		
		public var id:int;
		public var description:String;
		public var billable_type:String;
		public var hours:Number;
		public var day:Date;
		public var updated_at:Date;
		public var project:ProjectVO;
		
	}
	
	
}