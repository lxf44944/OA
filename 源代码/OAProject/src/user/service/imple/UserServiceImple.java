package user.service.imple;

import java.util.List;




import pojo.TDatadic;
import pojo.TEmail;
import pojo.TMenu;
import pojo.TRoleMenu;
import pojo.TTips;
import pojo.TUser;
import pojo.TUserRole;
import pojo.TUserRoleId;
import post.pojo.TPost;

import tips.dao.TTipsDAO;
import user.dao.PageModel;
import user.dao.RoleMenuDAO;
import user.dao.TDatadicDAO;
import user.dao.UserDAO;
import user.dao.UserRoleDAO;
import user.service.UserService;

public class UserServiceImple implements UserService{
	
	private UserDAO userDAO;
	
    private UserRoleDAO userRoleDAO;
    
    private RoleMenuDAO roleMenuDAO;
    
    private TDatadicDAO datadicDAO;
    
    private TTipsDAO tipsDAO;
    
    
	public TTipsDAO getTipsDAO() {
		return tipsDAO;
	}

	public void setTipsDAO(TTipsDAO tipsDAO) {
		this.tipsDAO = tipsDAO;
	}

	public UserRoleDAO getUserRoleDAO() {
		return userRoleDAO;
	}

	public void setUserRoleDAO(UserRoleDAO userRoleDAO) {
		this.userRoleDAO = userRoleDAO;
	}

	@Override
	public boolean checkUsername(String username) {
		return this.userDAO.checkUsername(username);
	}

	@Override
	public int deleteRole(int userid) {
		return this.userRoleDAO.deleteRole(userid);
	}

	@Override
	public boolean dostatus(int userid, int freeze) {
		return this.userDAO.dostatus(userid, freeze);
	}

	@Override
	public TUser findByUserid(int userid) {
		return this.userDAO.findByUserid(userid);
	}

	@Override
	public List findRidByUserid(int userid) {
		return this.userRoleDAO.findRidByUserid(userid);
	}

	@Override
	public int findUserByUserId() {
		return this.userDAO.findUserByUserId();
	}

	

	@Override
	public void save(TUser user, List list) {
		this.userDAO.save(user);
		int userid = this.userDAO.findMaxUserid();
		TTips tips = new TTips();
		tips.setTuserid(userid);
		tips.setShowtime(3600);
		tips.setTisshow(1);
		tips.setTshowemail(1);
		tips.setTshowpost(1);
		this.tipsDAO.save(tips);
		if(list != null){
			for (int i = 0; i < list.size(); i++) {
				TUserRoleId roleid = new TUserRoleId();
				int id = Integer.valueOf(list.get(i).toString());
				roleid.setRoleid(id);
				roleid.setUserid(userid);
				TUserRole userRole = new TUserRole();
				userRole.setId(roleid);
				this.userRoleDAO.save(userRole);
			}
		}
	}

	@Override
	public void update(TUser user, List list) {
		this.userDAO.update(user);
		if(list != null){
			this.userRoleDAO.deleteRole(user.getUserid());
			for (int i = 0; i < list.size(); i++) {
				TUserRoleId userRoleid = new TUserRoleId();
				int id = Integer.valueOf(list.get(i).toString());
				userRoleid.setRoleid(id);
				userRoleid.setUserid(user.getUserid());
				TUserRole userRole = new TUserRole();
				userRole.setId(userRoleid);
				this.userRoleDAO.save(userRole);
			}
		}
	}

	@Override
	public void update(TUser user) {
		this.userDAO.update(user);
	}

	@Override
	public void updatepwd(int userid, String password) {
		this.userDAO.updatepwd(userid, password);
	}

	@Override
	public TUser findByUsername(String username) {
		return this.userDAO.findUserbeanByUsername(username);
	}

	@Override
	public List<TMenu> findUserRoleMenu(int userid) {
		return this.userDAO.findUserRoleMenu(userid);
	}

	@Override
	public boolean isExit(TUser userBean) {
		
		return this.userDAO.isExit(userBean);
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public PageModel search(TUser userBean, int currentPage, int pageSize) {
		
		return this.userDAO.search(userBean, currentPage, pageSize);
	}

	@Override
	public List<TDatadic> query() {
		return this.datadicDAO.findAll();
	
	}

	

	public RoleMenuDAO getRoleMenuDAO() {
		return roleMenuDAO;
	}

	public void setRoleMenuDAO(RoleMenuDAO roleMenuDAO) {
		this.roleMenuDAO = roleMenuDAO;
	}

	public TDatadicDAO getDatadicDAO() {
		return datadicDAO;
	}

	public void setDatadicDAO(TDatadicDAO datadicDAO) {
		this.datadicDAO = datadicDAO;
	}

	@Override
	public void deleteUser(int userid) {
		this.userRoleDAO.deleteRole(userid);
		TUser user = this.userDAO.findByUserid(userid);
		this.userRoleDAO.deleteEmail(user.getUsername());
		this.userRoleDAO.deletePost(userid);
		this.userDAO.delete(user);
		this.tipsDAO.deleteByUser(userid);
	}

	
	public PageModel searchonlyUser(TPost post, int userid,
			int currentPage, int pageSize) {
		return this.userDAO.searchonlyUser(post, userid, currentPage, pageSize);
	}

	@Override
	public PageModel searchBox(TEmail mail, String username, int status,
			int currentPage, int pageSize) {
		return this.userDAO.searchBox(mail, username, status, currentPage, pageSize);
	}

	
	

}
