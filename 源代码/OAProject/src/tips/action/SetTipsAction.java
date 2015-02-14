package tips.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsStatics;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pojo.TTips;
import tips.dao.TTipsDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SetTipsAction extends ActionSupport {

	TTips tips;

	public TTips getTips() {
		return tips;
	}

	public void setTips(TTips tips) {
		this.tips = tips;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		TTipsDAO dao = (TTipsDAO)context.getBean("TTipsDAO");
		try {
			dao.attachDirty(tips);
			ActionContext context1 = ActionContext.getContext();
			HttpServletResponse response = (HttpServletResponse) context1
					.get(StrutsStatics.HTTP_RESPONSE);
			String script = "<script>window.top.location.href='../main/main.jsp';</script>"; 
	        PrintWriter out = response.getWriter(); 
			out.print(script); 
			out.flush(); 
			out.close(); 
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		
		
	}

}
