package user.dao;

import java.util.List;

import pojo.TRole;




public interface RoleDAO {
	public List<TRole> query();
	/**
	 * 角色分页
	 * @param role
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageModel search(TRole role, int currentPage, int pageSize);
	/**
	 * 保存
	 * @param role
	 */
	public void save(TRole role);
	/**
	 * 修改
	 * @param role
	 */
	public void update(TRole role);
	/**
	 * 根据rid查询出role对象
	 * @param rid
	 * @return
	 */
	public TRole findByRid(int rid);
	/**
	 * 根据rid查询出mid
	 * @param rid
	 * @return
	 */
	public List findMidByRid(int rid);
	/**
	 * 判断角色名是否存在
	 * @param rolename
	 * @return
	 */
	public boolean checkRolename(String rolename);
	/**
	 * 删除角色（伪删除）并删除属于它的菜单
	 * @param rid
	 */
	public void delete(int rid);
	/**
	 * 查看该角色是否被使用
	 * @param rid
	 * @return
	 */
	public boolean isUse(int rid);
	
	
	public int findMaxRoleId();

}
