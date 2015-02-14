package post.action;

import java.io.File;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ResolverUtil.IsA;

import pojo.TUser;
import post.inf.PostFileInf;
import post.inf.PostInf;
import post.inf.PostUserInf;
import post.inf.Userinf;
import post.pojo.TPost;
import post.pojo.TPostFile;
import post.pojo.TPostUser;
import post.pojo.TPostUserId;
import post.util.Tools;

public class PostAction extends ActionSupport {

	private TPost postbean;

	private String content;
	private String begindate;
	private String enddate;
	private String stitle;
	private String nostlycontent;
	private List<File> upload;
	private List<String> uploadFileName;
	private List<String> uploadContentType;

	public TPost getPostbean() {
		return postbean;
	}

	public void setPostbean(TPost postbean) {
		this.postbean = postbean;
	}

	public String getNostlycontent() {
		return nostlycontent;
	}

	public void setNostlycontent(String nostlycontent) {
		this.nostlycontent = nostlycontent;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBegindate() {
		return begindate;
	}

	public void setBegindate(String begindate) {
		this.begindate = begindate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public List<File> getUpload() {
		return upload;
	}

	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<String> getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	
	
	public  void test(String s){
		int i=s.indexOf("<");
		int j=s.indexOf(">");
	
		
		
		if(i==-1){
			nostlycontent=s;
		
			return;
			
		}else{
			String a =s.substring(i,j+1);
			
			s=s.replaceAll(a, " ");
			
			
			test(s);
		}
		
		
	}
	public String login() {

		HttpServletRequest request = ServletActionContext.getRequest();
		TUser user = new TUser();
		user.setUserid(2);
		user.setUsername("admin");
		request.getSession().setAttribute("user", user);

		return "login";

	}

	public void addpostuser(int postid) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		Userinf userdao = (Userinf) applicationContext.getBean("userDAO1");
		PostUserInf postuserdao = (PostUserInf) applicationContext
				.getBean("postuserDAO");
		List<TUser> users = userdao.findAll();

		for (TUser tUser : users) {
			tUser.getUserid();

			TPostUserId postUserid = new TPostUserId();

			postUserid.setPostid(postid);
			postUserid.setSuserid(tUser.getUserid());

			TPostUser postUser = new TPostUser();
			postUser.setNisread(0);
			postUser.setId(postUserid);
			postuserdao.save(postUser);

		}

	}

	public String addpost() {

		HttpServletRequest request = ServletActionContext.getRequest();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		TUser user = (TUser) request.getSession().getAttribute("user");
		postbean.setSuser(user.getUsername());
		postbean.setNstatus(0);
		postbean.setUpdateuser("无");
		if (upload != null) {
			postbean.setNisfile(1);

		} else {
			postbean.setNisfile(0);
		}

		try {
			Date begin = sdf.parse(begindate);

			postbean.setBegindate(begin);
			Date end = sdf.parse(enddate);
			postbean.setEnddate(end);
			String nowdate = sdf.format(new Date());
			Date now = sdf.parse(nowdate);
			postbean.setAddtime(now);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		postbean.setScontent(Hibernate.createClob(" "));
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostInf dao = (PostInf) applicationContext.getBean("postDAO");

		int postid = dao.save(postbean, content);
		addpostuser(postid);
		// 拷贝文件
		if (upload != null) {

			for (int i = 0; i < upload.size(); i++) {
				// 获得新文件名称
				String newFileName = Tools.makeNewFileName(uploadFileName
						.get(i));
				String realpath = ServletActionContext.getServletContext()
						.getRealPath("/postFile");

				String realFilepath = realpath + "/" + newFileName;
				System.out.println(realFilepath);
				File newfile = new File(realFilepath);
				// 插入公告附件表
				TPostFile postFileBean = new TPostFile();
				
				System.out.println(uploadFileName.get(i)+"-"+newFileName+"-"+postid);
				
				postFileBean.setSoldname(uploadFileName.get(i));
				postFileBean.setSnewname(newFileName);
				postFileBean.setPostid(postid);
				
				PostFileInf postfiledao = (PostFileInf) applicationContext
						.getBean("postfileDAO");
				postfiledao.save(postFileBean);
				Tools.copyFile(upload.get(i), newfile);
			}
		}

		return "postmanagelist";

	}

	public String lookpost() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostFileInf postfiledao = (PostFileInf) applicationContext
				.getBean("postfileDAO");
		String postid = ServletActionContext.getRequest()
				.getParameter("postid");
		List<TPostFile> files = postfiledao.findByProperty("postid", Integer
				.parseInt(postid));

		for (TPostFile tPostFile : files) {
			System.out.println(tPostFile.getSoldname());
		}
		System.out.println(postid);

		PostInf dao = (PostInf) applicationContext.getBean("postDAO");
		TPost postBean1 = dao.findById(Integer.parseInt(postid));
		Clob clob = postBean1.getScontent();
		try {
			String content = clob.getSubString((long) 1, (int) clob.length());
			ServletActionContext.getRequest().setAttribute("content", content);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		TUser user = (TUser) request.getSession().getAttribute("user");
		PostUserInf postuserdao = (PostUserInf) applicationContext
				.getBean("postuserDAO");
		TPostUserId postUserId = new TPostUserId();

		postUserId.setSuserid(user.getUserid());

		postUserId.setPostid(Integer.parseInt(postid));

		TPostUser postUser2 = postuserdao.findById(postUserId);

		if (postUser2.getNisread() == 0) {
			postUser2.setNisread(1);
			postuserdao.saveorupdate(postUser2);

		}

		ServletActionContext.getRequest().setAttribute("postBean1", postBean1);
		ServletActionContext.getRequest().setAttribute("postFileBeans", files);

		return "lookpost";
	}

	public String updatebefore() {

		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostFileInf postfiledao = (PostFileInf) applicationContext
				.getBean("postfileDAO");
		String postid = ServletActionContext.getRequest()
				.getParameter("postid");
		List<TPostFile> files = postfiledao.findByProperty("postid", Integer
				.parseInt(postid));

		for (TPostFile tPostFile : files) {
			System.out.println(tPostFile.getSoldname());
		}
		System.out.println(postid);

		PostInf dao = (PostInf) applicationContext.getBean("postDAO");
		TPost postBean1 = dao.findById(Integer.parseInt(postid));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		begindate = sdf.format(postBean1.getBegindate());
		enddate = sdf.format(postBean1.getEnddate());
		Clob clob = postBean1.getScontent();
		try {
			String content = clob.getSubString((long) 1, (int) clob.length());
			ServletActionContext.getRequest().setAttribute("content", content);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ServletActionContext.getRequest().setAttribute("postBean1", postBean1);
		ServletActionContext.getRequest().setAttribute("postFileBeans", files);

		return "updatebefore";

	}

	public String shenghe() {
		String postid = ServletActionContext.getRequest()
				.getParameter("postid");
		String shenghe = ServletActionContext.getRequest().getParameter(
				"shenghe");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostInf postdao = (PostInf) applicationContext.getBean("postDAO");
		TPost post = postdao.findById(Integer.parseInt(postid));
		post.setNstatus(Integer.parseInt(shenghe));
		postdao.saveOrUpdate(post);
		return "shenghepostlist";

	}

	public String update() {

		System.out.println(postbean.getStitle() + "         sasasas");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostFileInf postfiledao = (PostFileInf) applicationContext
				.getBean("postfileDAO");
		PostInf dao = (PostInf) applicationContext.getBean("postDAO");
		TPost post = dao.findById(postbean.getPostid());

		HttpServletRequest request = ServletActionContext.getRequest();

		TUser user = (TUser) request.getSession().getAttribute("user");
		post.setStitle(stitle);
		post.setUpdateuser(user.getUsername());
		post.setScontent(Hibernate.createClob(" "));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		try {
			Date begin = sdf.parse(begindate);
			post.setBegindate(begin);
			Date end = sdf.parse(enddate);
			post.setEnddate(end);
			String updatetime = sdf.format(new Date());
			Date updatedate = sdf.parse(updatetime);
			post.setUpdatetime(updatedate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		if (upload != null) {
			post.setNisfile(1);

		} else {
			post.setNisfile(0);
		}

		System.out.println(post);
		dao.saveOrUpdate(post, content);

		// 拷贝文件
		if (upload != null) {
			for (int i = 0; i < upload.size(); i++) {
				// 获得新文件名称
				String newFileName = Tools.makeNewFileName(uploadFileName
						.get(i));
				String realpath = ServletActionContext.getServletContext()
						.getRealPath("/postFile");

				String realFilepath = realpath + "/" + newFileName;
				System.out.println(realFilepath);
				File newfile = new File(realFilepath);
				// 插入公告附件表
				TPostFile postFileBean = new TPostFile();
				postFileBean.setSoldname(uploadFileName.get(i));
				postFileBean.setSnewname(newFileName);
				postFileBean.setPostid(post.getPostid());
				postfiledao.save(postFileBean);
				Tools.copyFile(upload.get(i), newfile);
			}
		}
		return "postmanagelist";

	}

	public String postlist() {
		System.out.println("title" + stitle + "begin" + begindate + "end"
				+ enddate);
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostInf dao = (PostInf) applicationContext.getBean("postDAO");
		System.out.println(begindate + "     begindate");
	
	
			Calendar calendar = Calendar.getInstance();
			Date date = calendar.getTime();
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH) + 1;// 1月份0 月份+1
			int day = calendar.get(Calendar.DAY_OF_MONTH);

			String monthstr = "";
			String daystr = "";
			if (month < 10) {
				monthstr = "0" + month;
			} else {
				monthstr = "" + month;
			}
			if (day < 10) {
				daystr = "0" + day;
			} else {
				daystr = "" + day;
			}

			String nowdate = year + "-" + monthstr + "-" + daystr;
			
			List<TPost> postlist = dao.findBystitledate(stitle, nowdate,begindate,
					enddate, "1");

		
		for (TPost post : postlist) {
			Clob clob = post.getScontent();
			try {
				String content = clob.getSubString((long) 1, (int) clob
						.length());
				test(content);
				
				post.setScontentstr(nostlycontent);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		ServletActionContext.getRequest().setAttribute("postlist", postlist);
		System.out.println(postlist);
		return "postlist";

	}

	public String postlistread() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostUserInf dao = (PostUserInf) applicationContext
				.getBean("postuserDAO");
		PostInf postdao = (PostInf) applicationContext.getBean("postDAO");

		HttpServletRequest request = ServletActionContext.getRequest();
		TUser user = (TUser) request.getSession().getAttribute("user");
		List<TPostUser> postUsers = dao.findByusernisread(user.getUserid(), 1);
		List<TPost> postlist = new ArrayList<TPost>();
		for (TPostUser tPostUser : postUsers) {
			int postid = tPostUser.getId().getPostid();
			TPost post = postdao.findById(postid);
			
		
			if (post.getNstatus() == 1&& post.getBegindate().before(new Date())) {
				Clob clob = post.getScontent();
				try {
					String content = clob.getSubString((long) 1, (int) clob
							.length());
					test(content);
					post.setScontentstr(nostlycontent);

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				postlist.add(post);
			}
		}
		ServletActionContext.getRequest().setAttribute("postlist", postlist);
		System.out.println(postlist);
		return "postlistread";

	}

	public String postlistnoread() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostUserInf dao = (PostUserInf) applicationContext
				.getBean("postuserDAO");
		PostInf postdao = (PostInf) applicationContext.getBean("postDAO");

		HttpServletRequest request = ServletActionContext.getRequest();
		TUser user = (TUser) request.getSession().getAttribute("user");
		List<TPostUser> postUsers = dao.findByusernisread(user.getUserid(), 0);
		List<TPost> postlist = new ArrayList<TPost>();
		for (TPostUser tPostUser : postUsers) {
			int postid = tPostUser.getId().getPostid();
			TPost post = postdao.findById(postid);
			if (post.getNstatus() == 1 &&post.getBegindate().before(new Date())) {
				Clob clob = post.getScontent();
				try {
					String content = clob.getSubString((long) 1, (int) clob
							.length());
					
					test(content);
					post.setScontentstr(nostlycontent);

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				postlist.add(post);
			}
		}
		ServletActionContext.getRequest().setAttribute("postlist", postlist);
		System.out.println(postlist);
		ServletActionContext.getRequest().setAttribute("postlist", postlist);
		System.out.println(postlist);
		return "postlistnoread";

	}

	public String shenghepost() {

		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostInf dao = (PostInf) applicationContext.getBean("postDAO");
		
		List<TPost> postlist = dao.findBystitledate(stitle,null, begindate, enddate,
				null);

		for (TPost post : postlist) {
			Clob clob = post.getScontent();
			try {
				String content = clob.getSubString((long) 1, (int) clob
						.length());
				test(content);
				post.setScontentstr(nostlycontent);


			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		ServletActionContext.getRequest().setAttribute("postlist", postlist);
		System.out.println(postlist);
		return "shenghepost";

	}

	public String postmanage() {

		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostInf dao = (PostInf) applicationContext.getBean("postDAO");
		List<TPost> postlist = dao.findBystitledate(stitle,null, begindate, enddate,
				null);

		for (TPost post : postlist) {
			Clob clob = post.getScontent();
			try {
				String content = clob.getSubString((long) 1, (int) clob
						.length());
				test(content);
				post.setScontentstr(nostlycontent);


			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		ServletActionContext.getRequest().setAttribute("postlist", postlist);
		System.out.println(postlist);
		return "postmanage";

	}

	public String deletePost() {

		String postid = ServletActionContext.getRequest()
				.getParameter("postid");
		System.out.println(postid + "postid");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostInf dao = (PostInf) applicationContext.getBean("postDAO");
		TPost post = dao.findById(Integer.parseInt(postid));
		dao.delete(post);// 删除公告

		PostUserInf postuserdao = (PostUserInf) applicationContext
				.getBean("postuserDAO");
		List<TPostUser> postUsers = postuserdao.findBypostid(Integer
				.parseInt(postid));
		for (TPostUser tPostUser : postUsers) {
			postuserdao.delete(tPostUser);
		}

		PostFileInf postfiledao = (PostFileInf) applicationContext
				.getBean("postfileDAO");

		List<TPostFile> files = postfiledao.findByProperty("postid", Integer
				.parseInt(postid));

		for (int i = 0; i < files.size(); i++) {
			// 删除附件文件
			String realPath = ServletActionContext.getServletContext()
					.getRealPath("/postFile");
			postfiledao.delete(files.get(i));
			String realFilePath = realPath + "/" + files.get(i).getSnewname();
			;
			File file = new File(realFilePath);
			if (file.exists()) {
				file.delete();
			}
		}

		return "postmanagelist";

	}

	/**
	 * 处理总文件大小超出 提示信息
	 */
	public void addActionError(String anErrorMessage) {

		System.out.println("anErrorMessage=" + anErrorMessage);

		if (anErrorMessage
				.startsWith("the request was rejected because its size")) {
			Matcher matcher = Pattern.compile("\\d+").matcher(anErrorMessage);
			double realNum = 0;
			if (matcher.find()) {
				String s1 = matcher.group();
				realNum = Integer.parseInt(s1) * 1.0 / 1024 / 1024;
			}
			double oldNum = 0;
			if (matcher.find()) {
				String s2 = matcher.group();
				oldNum = Integer.parseInt(s2) * 1.0 / 1024 / 1024;

			}
			NumberFormat numberFormat = new DecimalFormat("###,##0.00");
			// 避免重复添加提示信息
			if (this.getActionErrors().size() <= 0) {
				super.addActionError("系统拒绝了您的上传文件:文件的大小为("
						+ numberFormat.format(realNum) + ")M,超过系统允许的大小("
						+ numberFormat.format(oldNum) + ")M");

			}

		} else {
			super.addActionError(anErrorMessage);
		}
	}

	@Override
	public String execute() throws Exception {

		// TODO Auto-generated method stub

		return super.execute();
	}

}
