package vyre.timesheets.model.utils
{
	import vyre.timesheets.model.vo.UserVO;
	
	public class ServiceUtils
	{
		public function ServiceUtils()
		{
		}
		
		public function userToXML(user:UserVO):XML {
			var retval:XML =
                <user>
                    <login>{user.username}</login>
                    <password>{user.password}</password>
                </user>;
            return retval;
		}

	}
}