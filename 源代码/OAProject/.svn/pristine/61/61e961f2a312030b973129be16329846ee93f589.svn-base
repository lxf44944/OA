package user.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

import user.dao.PageModel;

import com.opensymphony.xwork2.ActionSupport;


public class BaseAction extends ActionSupport implements 
ServletRequestAware,ServletResponseAware,ServletContextAware{
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected ServletContext application;
	protected int currentPage = 1;
	protected int pageSize = 20;
	protected String message;//
	protected PageModel result;
	/**
	 * 
	 */
	private Map<String, String> urlMap=new HashMap<String, String>();
	private String defaultURL;//
	/**
	 *
	 * @param title
	 * @param url
	 */
	public void addURL(String title,String url){
		this.urlMap.put(title, url);
	}
	/**
	 * 
	 * @param title
	 * @param url
	 */
	public void addDefaultURL(String title,String url){
		this.urlMap.put(title, url);
		this.defaultURL=url;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
	}
	public HttpSession getSession(){
		return this.request.getSession();
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<String, String> getUrlMap() {
		return urlMap;
	}
	public void setUrlMap(Map<String, String> urlMap) {
		this.urlMap = urlMap;
	}
	public String getDefaultURL() {
		return defaultURL;
	}
	public void setDefaultURL(String defaultURL) {
		this.defaultURL = defaultURL;
	}
	public PageModel getResult() {
		return result;
	}
	public void setResult(PageModel result) {
		this.result = result;
	}
	
	

}
