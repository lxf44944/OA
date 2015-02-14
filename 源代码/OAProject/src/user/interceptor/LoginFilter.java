package user.interceptor;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.TUser;



public class LoginFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		TUser user = (TUser) session.getAttribute("user");
		if(user==null){
			 out.print("<script>alert('您还没有登录，请先登录');top.location.href='" + request.getContextPath() + "/login.jsp'</script>");
		}else{
			chain.doFilter(request, response);
		}
		out.flush();
		out.close();
	}
	public void init(FilterConfig arg0) throws ServletException {
	}

}
