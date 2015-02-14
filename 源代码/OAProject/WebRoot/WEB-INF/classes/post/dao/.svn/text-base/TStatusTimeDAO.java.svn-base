package post.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import post.inf.StatusTimeInf;
import post.pojo.TStatusTime;

/**
 	* A data access object (DAO) providing persistence and search support for TStatusTime entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see post.pojo.TStatusTime
  * @author MyEclipse Persistence Tools 
 */

public class TStatusTimeDAO extends HibernateDaoSupport  implements StatusTimeInf{
	     private static final Logger log = LoggerFactory.getLogger(TStatusTimeDAO.class);
		//property constants
	public static final String NTIME = "ntime";



	protected void initDao() {
		//do nothing
	}
    
    public void save(TStatusTime transientInstance) {
        log.debug("saving TStatusTime instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    public void saveorupdate(TStatusTime transientInstance) {
        log.debug("saveorupdate TStatusTime instance");
        try {
            getHibernateTemplate().saveOrUpdate(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
	public void delete(TStatusTime persistentInstance) {
        log.debug("deleting TStatusTime instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public TStatusTime findById( java.lang.Integer id) {
        log.debug("getting TStatusTime instance with id: " + id);
        try {
            TStatusTime instance = (TStatusTime) getHibernateTemplate()
                    .get("post.pojo.TStatusTime", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(TStatusTime instance) {
        log.debug("finding TStatusTime instance by example");
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
      log.debug("finding TStatusTime instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from TStatusTime as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByNtime(Object ntime
	) {
		return findByProperty(NTIME, ntime
		);
	}
	

	public List findAll() {
		log.debug("finding all TStatusTime instances");
		try {
			String queryString = "from TStatusTime";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public TStatusTime merge(TStatusTime detachedInstance) {
        log.debug("merging TStatusTime instance");
        try {
            TStatusTime result = (TStatusTime) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(TStatusTime instance) {
        log.debug("attaching dirty TStatusTime instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(TStatusTime instance) {
        log.debug("attaching clean TStatusTime instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static TStatusTimeDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (TStatusTimeDAO) ctx.getBean("TStatusTimeDAO");
	}
}