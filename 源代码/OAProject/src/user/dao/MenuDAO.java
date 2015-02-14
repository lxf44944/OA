package user.dao;

import java.util.List;

import pojo.TMenu;




public interface MenuDAO {
	public List<TMenu> seach();
	/**
	 * 上移
	 * @param menu
	 */
	public void up(TMenu menu);
	/**
	 * 下移
	 * @param menu
	 */
	public void down(TMenu menu);
	/**
	 * 保存
	 * @param menu
	 */
	public void save(TMenu menu);
	/**
	 * 修改
	 * @param menu
	 */
	public void update(TMenu menu);
	/**
	 * 根据mid查询menu对象
	 * @param mid
	 * @return
	 */
	public TMenu findByMid(int mid);
	/**
	 * 伪删除
	 * @param mid
	 * @param pid
	 */
	public void delete(int mid,int pid);
	/**
	 * 验证菜单名是否存在
	 * @param menuname
	 * @param mid
	 * @return
	 */
	public boolean checkMenuname(String menuname, int mid,int pid);
	/**
	 * 判断菜单是否被使用
	 * @param mid
	 * @return
	 */
	public boolean isUse(int mid);
	
	List<Integer> queryByOrderidAsc(int pid);
	
	void updateOrderid(int changeOrderid, int orderid, int mid);
	
	void updateOrderid(int changeOrderid, int orderid);
	
	List<Integer> queryByOrderid(int pid);

}
