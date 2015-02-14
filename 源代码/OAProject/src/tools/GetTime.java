package tools;
import java.util.*;
import java.text.*;

public class GetTime {
	   public static Date time() {
	     
	      Calendar ca = Calendar.getInstance();
	      int year = ca.get(Calendar.YEAR);
	      int month=ca.get(Calendar.MONTH)+1;
	      int day=ca.get(Calendar.DATE);
	      int minute=ca.get(Calendar.MINUTE);
	      int hour=ca.get(Calendar.HOUR_OF_DAY);
	      int second=ca.get(Calendar.SECOND);
	      int WeekOfYear = ca.get(Calendar.DAY_OF_WEEK);
	      
	      
	      String str=year+"/"+month+"/"+day+" "+hour+":"+minute+":"+second;
	      
	      SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	      Date date = null;
	      try {
	       date = format.parse(str);
	      } catch (ParseException e) {
	       e.printStackTrace();
	      }
	      return date;
	   }

	
}
