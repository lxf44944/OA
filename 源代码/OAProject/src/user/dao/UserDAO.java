package user.dao;

import java.util.List;



import pojo.TDatadic;
import pojo.TEmail;
import pojo.TMenu;

import pojo.TUser;
import post.pojo.TPost;

import sun.reflect.generics.tree.BaseType;



public interface UserDAO{

	public PageModel search(TUser userBean, int currentPage, int pageSize);

	
	public TUser findByUserid(int userid);
	
	public boolean dostatus(int userid,int freeze);
	
	public int findUserByUserId();
	
	public void save(TUser user);
	
	public int deleteRole(int userid);
	
	public boolean checkUsername(String username);
	
	public void delete(TUser persistentInstance);
	/**
	 * 修改密码
	 * @param userid
	 * @param password
	 */
	public void updatepwd(int userid,String password);
	/**
	 * 根据用户id获取他的角色id
	 * @param userid
	 * @return
	 */
	public List findRidByUserid(int userid);
	/**
	 * 登录用户修改自己的信息
	 * @param user
	 */
	public void update(TUser user);
	/**
	 * 根据用户名获取用户对象
	 * @param username
	 * @return
	 */
	public TUser findUserbeanByUsername(String username);
	
   public boolean isExit(TUser userBean);
	
	public TUser findByUsername(String username);
	/**
	 * 左边菜单列表
	 * @param userid
	 * @return
	 */
	public List<TMenu> findUserRoleMenu(int userid);
	
	public List<TDatadic> query();


	public int findMaxUserid();
	
	
	/**
	 * 分页
	 * @param notice
	 * @param userid　根据登录用户id显示该用户的所有公告
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageModel searchonlyUser(TPost post,int userid, int currentPage, int pageSize);
	
	/**
	 * 
	 * @param mail 查询条件
	 * @param userid 用户id
	 * @param status 邮箱类型（发件箱，收件箱，垃圾箱，草稿箱）
	 * @param currentPage 当前页
	 * @param pageSize 每页显示条数
	 * @return
	 */
	public PageModel searchBox(TEmail mail,String username,int status, int currentPage, int pageSize);
}
