package post.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class DownLoadAction extends ActionSupport {
	private String fileName;
	private String realFileName;

	// <param
	// name="contentDisposition">attachment;filename="${fileName}"</param>
	public String getFileName() {
		// 中文编码
		try {
			fileName = new String(fileName.getBytes(), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("getFileName......");

		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRealFileName() {
		return realFileName;
	}

	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("DownLoadAction execute......");
		// <result type="stream" name="success"></result>
		return super.execute();
	}

	// 默认提供getInputStream() 返回值类型InputStream
	public InputStream getInputStream() throws FileNotFoundException {

		System.out.println("getInputStream......");
		String filePath = ServletActionContext.getServletContext().getRealPath(
				"/postFile/" + realFileName);
		System.out.println(filePath);
		return new FileInputStream(filePath);
	}

	
	//<param name="inputName">myInputStream</param>	
//	public InputStream getMyInputStreamm() throws FileNotFoundException {
//
//		System.out.println("getMyInputStream......");
//		String filePath = ServletActionContext.getServletContext().getRealPath(
//				"/postFile/" + realFileName);
//		return new FileInputStream(filePath);
//	}

}
