package post.action;

import java.io.File;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import post.inf.PostFileInf;
import post.inf.PostInf;
import post.inf.PostUserInf;
import post.inf.StatusTimeInf;
import post.pojo.TPost;
import post.pojo.TPostFile;
import post.pojo.TPostUser;
import post.pojo.TStatusTime;

import com.opensymphony.xwork2.ActionSupport;

public class AutoShenheAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostInf dao = (PostInf) applicationContext.getBean("postDAO");
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		StatusTimeInf statusTimedao = (StatusTimeInf) applicationContext
				.getBean("statustimeDAO");

		// 提供了丰富的常量类型获得日期中的属性
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;// 1月份0 月份+1
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

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
		TStatusTime statusTime = statusTimedao.findById(1);
		int statusdate = statusTime.getNtime();
		List<TPost> posts = dao.findByPropertyDESC("nstatus", 0);

		for (TPost tPost : posts) {
			Date newtime;
			Date addtime1;

			try {
				String addtime = sdf.format(tPost.getAddtime());
				newtime = sdf.parse(nowdate);
				addtime1 = sdf.parse(addtime);
				int addyear = addtime1.getYear();
				addyear = addyear - 100 + 2000;
				int addmonth = addtime1.getMonth() + 1;
				int addday = addtime1.getDate();
				addday = addday + statusdate;

				if (addday > 30) {
					addday = addday % 30;
					addmonth = addmonth + 1;
					if (addmonth > 12) {
						addmonth = addmonth % 12;
						addyear = addyear + 1;
					}
				}

				String addtimestr = addyear + "-" + addmonth + "-" + addday;

				addtime1 = sdf.parse(addtimestr);

				if (addtime1.before(newtime)) {

					System.out.println(addtime1);
					System.out.println(newtime);
					System.out.println("晚于当前时间");
					tPost.setNstatus(1);
					dao.saveOrUpdate(tPost);

				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.print("yes");

		out.flush();
		out.close();
		delete();
		return NONE;
	}

	public void delete() {

		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		PostInf dao = (PostInf) applicationContext.getBean("postDAO");
		List<TPost> posts = dao.findAll();
		for (TPost tPost : posts) {
			if (tPost.getEnddate().before(new Date())) {
				dao.delete(tPost);// 删除公告

				PostUserInf postuserdao = (PostUserInf) applicationContext
						.getBean("postuserDAO");
				List<TPostUser> postUsers = postuserdao.findBypostid(tPost
						.getPostid());
				for (TPostUser tPostUser : postUsers) {
					postuserdao.delete(tPostUser);
				}

				PostFileInf postfiledao = (PostFileInf) applicationContext
						.getBean("postfileDAO");

				List<TPostFile> files = postfiledao.findByProperty("postid",
						tPost.getPostid());

				for (int i = 0; i < files.size(); i++) {
					// 删除附件文件
					String realPath = ServletActionContext.getServletContext()
							.getRealPath("/postFile");
					postfiledao.delete(files.get(i));
					String realFilePath = realPath + "/"
							+ files.get(i).getSnewname();
					;
					File file = new File(realFilePath);
					if (file.exists()) {
						file.delete();
					}
				}
			}

		}

	}

}
