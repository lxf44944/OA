package email.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import pojo.TEmailFile;

/**
 	* A data access object (DAO) providing persistence and search support for TEmailFile entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see pojo.TEmailFile
  * @author MyEclipse Persistence Tools 
 */

public class TEmailFileDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(TEmailFileDAO.class);



	protected void initDao() {
		//do nothing
	}
    //添加附件
    public void save(TEmailFile emailFile) {
        log.debug("saving TEmailFile instance");
        try {
            getHibernateTemplate().save(emailFile);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
  //修改附件
    public void update(TEmailFile emailFile) {
        log.debug("update TEmailFile instance");
        try {
            getHibernateTemplate().update(emailFile);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }
    //删除附件
	public void delete(TEmailFile emailFile) {
        log.debug("deleting TEmailFile instance");
        try {
            getHibernateTemplate().delete(emailFile);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    //根据id查找附件
    public TEmailFile findById(int id) {
        log.debug("getting TEmailFile instance with id: " + id);
        try {
            TEmailFile instance = (TEmailFile) getHibernateTemplate()
                    .get("pojo.TEmailFile", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
  //根据emailid查找附件列表
    public List<TEmailFile> findByEmailId(int emailId) {
        log.debug("getting List<TEmailFile>  with emailId: " + emailId);
        try {
        	String hql = "from TEmailFile where email.id=" + emailId;
        	List<TEmailFile> emailFiles = getHibernateTemplate().find(hql);
                   // .get("pojo.TEmailFile", id);
            return emailFiles;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    /*public List findByExample(TEmailFile instance) {
        log.debug("finding TEmailFile instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding TEmailFile instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from TEmailFile as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findBySoldname(Object soldname
	) {
		return findByProperty(SOLDNAME, soldname
		);
	}
	
	public List findBySnewname(Object snewname
	) {
		return findByProperty(SNEWNAME, snewname
		);
	}
	

	public List findAll() {
		log.debug("finding all TEmailFile instances");
		try {
			String queryString = "from TEmailFile";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public TEmailFile merge(TEmailFile detachedInstance) {
        log.debug("merging TEmailFile instance");
        try {
            TEmailFile result = (TEmailFile) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(TEmailFile instance) {
        log.debug("attaching dirty TEmailFile instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(TEmailFile instance) {
        log.debug("attaching clean TEmailFile instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static TEmailFileDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (TEmailFileDAO) ctx.getBean("TEmailFileDAO");
	}*/
}