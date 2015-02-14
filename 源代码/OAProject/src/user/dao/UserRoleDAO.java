package user.dao;

import java.util.List;


import pojo.TEmail;
import pojo.TUserRole;

public interface UserRoleDAO {
	public void save(TUserRole transientInstance);
	
	public TUserRole findByUserid(int userid);
	
	public int deleteRole(int userid);
	
	public int deleteEmail(String username);
	
	public int deletePost(int userid);
	
	public List findRidByUserid(int userid);
	
	public boolean isUser(int rid);
	
	
	


}
