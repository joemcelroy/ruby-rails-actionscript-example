package vyre.timesheets.model.vo
{
	public class UserVO  {
		public var id:Number;
		public var username:String;
		public var password:String;
		
		public function UserVO() {
			
		}
		
		public function get userToXML():XML {
			var retval:XML =
                <user>
                    <login>{this.username}</login>
                    <password>{this.password}</password>
                </user>;
            return retval;
		}

	}
}