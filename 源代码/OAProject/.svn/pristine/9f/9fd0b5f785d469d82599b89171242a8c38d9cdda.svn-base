package user.action;


import java.util.List;

import javax.annotation.Resource;

import pojo.TMenu;
import user.service.MenuService;

import com.opensymphony.xwork2.ModelDriven;



public class MenuListAction extends BaseAction implements ModelDriven<TMenu> {

	private TMenu menu=new TMenu();
	private List<TMenu> menulist;
	
	private MenuService menuService;
	@Override
	public TMenu getModel() {
		return menu;
	}
	public String view(){
		menulist=menuService.seach();
		return SUCCESS;
	}

	public List<TMenu> getMenulist() {
		return menulist;
	}
	public void setMenulist(List<TMenu> menulist) {
		this.menulist = menulist;
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	

}
