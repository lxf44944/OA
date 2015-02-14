package tips.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.StrutsStatics;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import tips.dao.TTipsDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TipCountAction extends ActionSupport {

	
	

	@Override
	public String execute() throws Exception {
		 ActionContext context=null;
		 ApplicationContext context2=null;
		context = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) context
				.get(StrutsStatics.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) context
				.get(StrutsStatics.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String userid = request.getParameter("userid");
//		String task = request.getParameter("task");
//		System.out.println("task="+task);
		context2 = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		TTipsDAO dao = (TTipsDAO) context2.getBean("TTipsDAO");
		// if (task.equals("post")) {
			int postCount = dao.postCount(Integer.valueOf(userid));
//			System.out.println("postCount="+postCount);
			int emailCount = dao.emailCount(username);
//			System.out.println("emailCount="+emailCount);
			out.print(emailCount+" "+postCount);
			
		

		out.flush();
		out.close();
		
		return NONE;
		
		// return ERROR;
	}

}
