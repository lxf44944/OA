package email.tools;

import javax.servlet.http.HttpServletRequest;

public class PageSupport {
	public static final String PAGE = "pageSupport";
	public static final String CUR_PAGE="curPage";
	public static final String PAGE_SIZE="pageSize";
	private int curPage=1;
	private int pageSize = 10;
	//总条数
	private int totalCount;
	
	public int getTotalCount() {
		return totalCount;
	}

	public PageSupport(){
		System.currentTimeMillis();
	}
	
	public int getTotalPage(){
		return (totalCount-1)/pageSize+1;
	}
	
	public PageSupport(HttpServletRequest request){
		try {
			String curPageText = request.getParameter(CUR_PAGE);
			//设置当前页
			if(curPageText != null && !curPageText.trim().equals("")){
				curPage = Integer.parseInt(curPageText);
			}
		} catch (NumberFormatException e) {
			curPage=1;
		}
		curPage = curPage<1?curPage=1:curPage;
		//设置每页的数量
		/*try {
			String pageSizeText = request.getParameter(PAGE_SIZE);
			if(pageSizeText != null && !pageSizeText.trim().equals("")){
				pageSize = Integer.parseInt(pageSizeText);
			}
		} catch (NumberFormatException e) {
			pageSize=4;
		}
		pageSize = pageSize>100?4:pageSize;*/
		request.setAttribute(PAGE, this);
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getMinRownum(){
		return (curPage-1)*pageSize;
	}
	
	public int getMaxRownum(){
		return curPage*pageSize;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
}
