package user.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

public class EncodingFilter implements Filter {
	private String encode="UTF-8";
	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		// 处理字符集编码
		req.setCharacterEncoding(encode);
		res.setCharacterEncoding(encode);
		res.setContentType("text/html;charset="+encode);
		chain.doFilter(req, res);
	}

	public void init(FilterConfig config) throws ServletException {
		String codevalue=config.getInitParameter("ecode");
		if(codevalue!=null){
			encode=codevalue;
		}
		
		//定义字符串转成时间允许的格式。只适用于BeanUtils
		DateConverter converter = new DateConverter(null);
		converter.setPatterns(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss.0","yyyy-MM-dd HH:mm:ss","yyyy-MM-dd"});
		//注册转化器
		ConvertUtils.register(converter, java.util.Date.class);
		ConvertUtils.register(converter, java.sql.Date.class);
	}


}
