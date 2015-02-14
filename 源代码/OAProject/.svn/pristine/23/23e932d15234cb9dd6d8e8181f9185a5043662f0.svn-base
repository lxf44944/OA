package user.dao;

import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import pojo.TDatadic;

/**
 * A data access object (DAO) providing persistence and search support for
 * TDatadic entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see pojo.TDatadic
 * @author MyEclipse Persistence Tools
 */
public class TDatadicDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TDatadicDAO.class);
	// property constants
	public static final String DNAME = "dname";
	public static final String DPID = "dpid";
	public static final String DUPDATEUSER = "dupdateuser";
	public static final String DISDEL = "disdel";

	protected void initDao() {
		// do nothing
	}

	public void save(TDatadic transientInstance) {
		log.debug("saving TDatadic instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TDatadic persistentInstance) {
		log.debug("deleting TDatadic instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TDatadic findById(java.lang.Integer id) {
		log.debug("getting TDatadic instance with id: " + id);
		try {
			TDatadic instance = (TDatadic) getHibernateTemplate().get(
					"pojo.TDatadic", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TDatadic instance) {
		log.debug("finding TDatadic instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TDatadic instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TDatadic as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByDname(Object dname) {
		return findByProperty(DNAME, dname);
	}

	public List findByDpid(Object dpid) {
		return findByProperty(DPID, dpid);
	}

	public List findByDupdateuser(Object dupdateuser) {
		return findByProperty(DUPDATEUSER, dupdateuser);
	}

	public List findByDisdel(Object disdel) {
		return findByProperty(DISDEL, disdel);
	}

	public List findAll() {
		log.debug("finding all TDatadic instances");
		try {
			String queryString = "from pojo.TDatadic";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TDatadic merge(TDatadic detachedInstance) {
		log.debug("merging TDatadic instance");
		try {
			TDatadic result = (TDatadic) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TDatadic instance) {
		log.debug("attaching dirty TDatadic instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TDatadic instance) {
		log.debug("attaching clean TDatadic instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TDatadicDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TDatadicDAO) ctx.getBean("TDatadicDAO");
	}
	
	public static void main(String[] args) {
		ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
		
	}
}