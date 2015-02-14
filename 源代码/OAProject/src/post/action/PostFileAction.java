package post.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import post.inf.PostFileInf;
import post.pojo.TPostFile;

import com.opensymphony.xwork2.ActionSupport;

public class PostFileAction extends ActionSupport {
	private int postFileId;

	public int getPostFileId() {
		return postFileId;
	}

	public void setPostFileId(int postFileId) {
		this.postFileId = postFileId;
	}

	@Override
	public String execute() throws Exception {
		// 删除数据记录，删除文件，响应操作标志
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostFileInf postfiledao = (PostFileInf) applicationContext
				.getBean("postfileDAO");
		TPostFile fileBean = postfiledao.findById(postFileId);
		String realPath = ServletActionContext.getServletContext().getRealPath(
				"/postFile");
		String realFilePath = realPath + "/" + fileBean.getSnewname();
		File file = new File(realFilePath);
		if (file.exists()) {
			file.delete();
		}

		// 删除数据库中的记录
		
		postfiledao.delete(fileBean);
		

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
			out.print("附件删除成功!");
		
		out.flush();
		out.close();

		return NONE;
	}

}
