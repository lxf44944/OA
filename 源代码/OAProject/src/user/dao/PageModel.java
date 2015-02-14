package user.dao;




import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class PageModel {
	public final static String PAGE_MODEL_ATTR="pagemodel";
	private List result;
	private int allCount;
	private int currentPage;
	private int pageSize;
	
	public int getAllPage() {
		return (this.allCount - 1) / this.pageSize + 1;
	}

	public static int getPageSize(HttpServletRequest request) {
		int pageSize = 20;
		try {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		} catch (Exception e) {

		}
		return pageSize;
	}

	public static int getCurrentPage(HttpServletRequest request) {
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (Exception e) {
		}
		return currentPage;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		if (currentPage < 1)
			this.currentPage = 1;
		else {
			this.currentPage = currentPage;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List getResult() {
		return result;
	}

	public void setResult(List result) {
		this.result = result;
	}

	public int getAllCount() {
		return allCount;
	}

	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
}
