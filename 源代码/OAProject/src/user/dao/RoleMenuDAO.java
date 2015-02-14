package user.dao;

import java.util.List;

import pojo.TRoleMenu;

public interface RoleMenuDAO {
	public boolean isUse(int mid);
	
	public boolean isUser(int rid);

	public List findMidByRid(int rid);

	public void delete(int roleid);
	
	public void save(TRoleMenu transientInstance);
	
	public void deleteAll(int rid);

}
