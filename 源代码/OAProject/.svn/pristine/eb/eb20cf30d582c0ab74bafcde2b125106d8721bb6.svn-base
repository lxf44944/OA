package email.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import pojo.TEmail;
import pojo.TEmailFile;
import pojo.TReceiveemail;

/**
 	* A data access object (DAO) providing persistence and search support for TEmail entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see pojo.TEmail
  * @author MyEclipse Persistence Tools 
 */

public class TUserDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(TUserDAO.class);



	protected void initDao() {
		//do nothing
	}
    public List<String> getUserNameList(String username,String nameKey){
    	 log.debug("getUserNameList");
         try {
         	String hql = "select username from TUser where username<>?";
         	if(nameKey != null && !"".equals(nameKey)){
         		hql += "and username like '%" + nameKey + "%'";
         	}
         	List<String> list = getHibernateTemplate().find(hql,username);
         	//List<String> instance = getHibernateTemplate().find(hql, username);
         	
             log.debug("getUserNameList successful");
             return list;
         } catch (RuntimeException re) {
             log.error("getUserNameList failed", re);
             throw re;
         }
    	
    	
    }
}