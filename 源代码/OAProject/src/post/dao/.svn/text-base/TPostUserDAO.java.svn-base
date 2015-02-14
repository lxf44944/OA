package post.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import post.inf.PostUserInf;
import post.pojo.TPostUser;
import post.pojo.TPostUserId;

/**
 * A data access object (DAO) providing persistence and search support for
 * TPostUser entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see post.pojo.TPostUser
 * @author MyEclipse Persistence Tools
 */

public class TPostUserDAO extends HibernateDaoSupport implements PostUserInf {
	private static final Logger log = LoggerFactory
			.getLogger(TPostUserDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public List findBypostuserid(int userid, int postid) {

		try {
			String queryString = "from TPostUser where suserid=" + userid
					+ "and postid=" + postid;

			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	public List findByusernisread(int userid, int nisread) {

		try {
			String queryString = "from TPostUser where suserid=" + userid
					+ "and nisread=" + nisread;

			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBypostid(int postid) {

		try {
			String queryString = "from TPostUser where  postid=" + postid;

			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public void save(TPostUser transientInstance) {
		log.debug("saving TPostUser instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void saveorupdate(TPostUser transientInstance) {
		log.debug("saveorupdate TPostUser instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TPostUser persistentInstance) {
		log.debug("deleting TPostUser instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TPostUser findById(post.pojo.TPostUserId id) {
		log.debug("getting TPostUser instance with id: " + id);
		try {
			TPostUser instance = (TPostUser) getHibernateTemplate().get(
					"post.pojo.TPostUser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TPostUser instance) {
		log.debug("finding TPostUser instance by example");
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
		log.debug("finding TPostUser instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TPostUser as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all TPostUser instances");
		try {
			String queryString = "from TPostUser";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TPostUser merge(TPostUser detachedInstance) {
		log.debug("merging TPostUser instance");
		try {
			TPostUser result = (TPostUser) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TPostUser instance) {
		log.debug("attaching dirty TPostUser instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TPostUser instance) {
		log.debug("attaching clean TPostUser instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TPostUserDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TPostUserDAO) ctx.getBean("TPostUserDAO");
	}
}