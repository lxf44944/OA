package user.action;

import java.io.IOException;


import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;

import pojo.TDatadic;
import pojo.TEmail;
import pojo.TRole;
import pojo.TUser;
import pojo.TUserRole;
import pojo.TUserRoleId;
import user.dao.PageModel;
import user.service.RoleService;
import user.service.UserService;

import com.opensymphony.xwork2.ModelDriven;

import email.service.inf.EmailServiceInf;






public class UserAction extends BaseAction implements ModelDriven<TUser>{
	private List<TDatadic> datalist;
	private List<TRole> rolelist;
	private PageModel postlist;
	private PageModel maillist;
	private EmailServiceInf emailService;
	private TUser user = new TUser();
	private static String oldusername;
	@Override
	public TUser getModel() {
		return user;
	}
	
	private UserService userService;
	private RoleService roleService;
	private String username;
	private String userid;
	private List<Integer> roleidlist;
	private List<TUserRole> roleUserAndRoles;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	public EmailServiceInf getEmailService() {
		return emailService;
	}

	public void setEmailService(EmailServiceInf emailService) {
		this.emailService = emailService;
	}

	/**
	 * 添加或修改
	 * 
	 * @return
	 */
	public String saveOrUpdate() {
		if (user.getUserid() != null && user.getUserid() > 0) {
			// 修改
			userService.deleteRole(user.getUserid());
			TUser tuser = userService.findByUserid(user.getUserid());
			user.setPassword(tuser.getPassword());
			user.setFreeze(tuser.getFreeze());
			userService.update(user, user.getRid());
			this.message="修改用户成功";
			this.addDefaultURL("", "userlist!view");
		} else {
			// 添加
			user.setPassword("111111");
			user.setFreeze(0);
			user.setRegdate(new Date());
			userService.save(user, user.getRid());
			this.message="新增用户成功";
			this.addDefaultURL("用户列表", "userlist!view");
			this.addURL("继续添加", "user!init");
		}
		return SUCCESS;

	}
	
	/**
	 * 登录用户修改个人信息
	 */
	public String onlyUpdate(){
		TUser tuser = userService.findByUserid(user.getUserid());
		user.setPassword(tuser.getPassword());
		user.setFreeze(tuser.getFreeze());
		userService.update(user);
		this.message="个人信息修改成功";
		this.addDefaultURL("", "user!dotag");
		return SUCCESS;
	}
	
	/**
	 * 去修改密码页面
	 */
	public String updatepwdview(){
		return "updatepwdjsp";
	}
	/**
	 * 修改密码
	 */
	public String updatepwd(){
		TUser nowUser=(TUser) request.getSession().getAttribute("user");
		userService.updatepwd(nowUser.getUserid(), user.getPassword());
		this.message="密码修改成功";
		this.addDefaultURL("", "user!dotag");
		return SUCCESS;
	}

	/**
	 * 去添加页面
	 * 
	 * @return
	 */
	public String init() {
		datalist = this.userService.query();
		rolelist = this.roleService.query();
		// 设置页面默认值
		 this.user.setDeptno(3);
		 this.user.setJobno(10);
		 this.user.setSex("1");
		 this.user.setMarried(1);
		 this.user.setCity("福州");
		return "edit";
	}

	/**
	 * 去修改页面
	 */
	public String updatePage() throws IllegalAccessException,
			InvocationTargetException {
		TUser user1 = userService.findByUserid(user.getUserid());
		oldusername = user1.getUsername();
		BeanUtils.copyProperties(user, user1);
		roleidlist=new ArrayList<Integer>();
		datalist = this.userService.query();
		rolelist = this.roleService.query();
		roleUserAndRoles=this.userService.findRidByUserid(user.getUserid());
		for (int i = 0; i < roleUserAndRoles.size(); i++) {
			roleidlist.add(roleUserAndRoles.get(i).getId().getRoleid());
		}
		return "edit";
	}
	/**
	 * 登录用户去修改个人信息页面
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public String onlyUpdateview() throws IllegalAccessException, InvocationTargetException{
		TUser nowUser=(TUser) request.getSession().getAttribute("user");
		TUser user1 = userService.findByUserid(nowUser.getUserid());
		oldusername = user1.getUsername();
		BeanUtils.copyProperties(user, user1);		
		datalist = this.userService.query();	
		return "onlyUpdateview";
	}
	/**
	/**
	 * 冻结/解冻
	 * 
	 * @return
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	public String dostatus() throws IllegalAccessException,
			InvocationTargetException {
		TUser user1 = userService.findByUserid(user.getUserid());
		userService.dostatus(user1.getUserid(), user1.getFreeze());
		BeanUtils.copyProperties(user, user1);
		this.message="操作成功";
		this.addDefaultURL("", "userlist!view");
		return SUCCESS;
	}
	/**
	 * 验证用户名是否存在
	 * @return
	 */
	public String checkUsername() {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out  = null;
		String lastName = null;
		try {
			out= response.getWriter();
			lastName = new String(user.getUsername().getBytes("ISO-8859-1"), "GBK");
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(!lastName.equals(oldusername)){
			boolean flag=userService.checkUsername(lastName);	
			if (user.getUsername() != null&& !"".equals(user.getUsername().trim())
					&& flag) {
				// 存在
				out.print("1");
			} else {
				// 不存在
				this.addActionMessage("恭喜你用户名可以使用");
				out.print("0");
			}
		}else{
			out.print("0");
		}
		oldusername = null;
		return null;
		
	}
	/**
	 * 验证旧密码是否正确
	 * @return
	 */
	public String checkoldpassword() {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out  = null;
		TUser nowUser=(TUser) request.getSession().getAttribute("user");
		String oldpwd=userService.findByUserid(nowUser.getUserid()).getPassword();
		try {
			out= response.getWriter();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (oldpwd.equals(user.getOldpassword())) {
			// 旧密码正确
			this.addActionMessage("旧密码输入正确");
			out.print("1");
		} else {
			// 旧密码错误		
			out.print("0");
		}
		
		return null;
	}
	
	/**
	 * 登陆后中间默认邮件，公告
	 * @return
	 */
	public String dotag(){
		TUser nowUser=(TUser) getSession().getAttribute("user");
		postlist =  userService.searchonlyUser(null, nowUser.getUserid(), 1, 10);
		this.emailService.emailList(2);
		System.out.println("公告类表"+postlist.getResult().size());
		return "dotag";
	}

	/**
	 * 用户删除
	 * @return
	 */
	public String deleteuser(){
		this.userService.deleteUser(user.getUserid());
		 this.addDefaultURL("", "userlist!view");
		 return SUCCESS;
	}
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<TDatadic> getDatalist() {
		return datalist;
	}

	public void setDatalist(List<TDatadic> datalist) {
		this.datalist = datalist;
	}

	public List<TRole> getRolelist() {
		return rolelist;
	}

	public void setRolelist(List<TRole> rolelist) {
		this.rolelist = rolelist;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public List<Integer> getRoleidlist() {
		return roleidlist;
	}

	public void setRoleidlist(List<Integer> roleidlist) {
		this.roleidlist = roleidlist;
	}

	public List<TUserRole> getRoleUserAndRoles() {
		return roleUserAndRoles;
	}

	public void setRoleUserAndRoles(List<TUserRole> roleUserAndRoles) {
		this.roleUserAndRoles = roleUserAndRoles;
	}

	

	public PageModel getPostlist() {
		return postlist;
	}

	public void setPostlist(PageModel postlist) {
		this.postlist = postlist;
	}

	public PageModel getMaillist() {
		return maillist;
	}

	public void setMaillist(PageModel maillist) {
		this.maillist = maillist;
	}
	
	

}
