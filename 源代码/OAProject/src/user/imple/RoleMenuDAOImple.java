package user.imple;
// default package

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import pojo.TRole;
import pojo.TRoleMenu;
import pojo.TRoleMenuId;
import user.dao.RoleMenuDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * TRoleMenu entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see .TRoleMenu
 * @author MyEclipse Persistence Tools
 */
public class RoleMenuDAOImple extends HibernateDaoSupport implements RoleMenuDAO{
	private static final Logger log = LoggerFactory
			.getLogger(RoleMenuDAOImple.class);
	
	
	
	public boolean isUse(int mid) {
		String hql=" from TRoleMenu where menuid=?";
		log.debug("getting TRoleMenu instance with id: " + mid);
		try {
			List list =  getHibernateTemplate().find(hql,mid);
			if(list!= null && list.size() > 0){
				return true;
			}
			return false;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public boolean isUser(int rid){
		String hql="from TRoleMenu where roleid=?";
		log.debug("getting TRoleMenu instance with id: " + rid);
		try {
			List list =  getHibernateTemplate().find(hql,rid);
			if(list!= null && list.size() > 0){
				return true;
			}
			return false;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findMidByRid(int rid) {
		String hql="from TRoleMenu where id.roleid=?";
		log.debug("getting TRoleMenu instance with id: " + rid);
		try {
			return	getHibernateTemplate().find(hql, rid);
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public void delete( int roleid) {
		log.debug("deleting TRoleMenu instance");
		try {
			this.getHibernateTemplate().delete(findRoleMenu(roleid));
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	public void deleteAll( int roleid) {
		log.debug("deleting TRoleMenu instance");
		try {
			this.getHibernateTemplate().deleteAll(findMidByRid(roleid));
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public void save(TRoleMenu transientInstance) {
		log.debug("saving TRoleMenu instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	
	public TRoleMenu findRoleMenu(int rid) {
		String hql="from TRoleMenu where id.roleid=?";
		log.debug("getting TRoleMenu instance with id: " + rid);
		try {
			List list = getHibernateTemplate().find(hql, rid);
			if(list!= null && list.size()>0){
				return (TRoleMenu)list.get(0);
			}
			return null;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	
	
	
	
	
	
	
	
	// property constants

	protected void initDao() {
		// do nothing
	}

	

	public void delete(TRoleMenu persistentInstance) {
		log.debug("deleting TRoleMenu instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TRoleMenu findById(TRoleMenuId id) {
		log.debug("getting TRoleMenu instance with id: " + id);
		try {
			TRoleMenu instance = (TRoleMenu) getHibernateTemplate().get(
					"TRoleMenu", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TRoleMenu instance) {
		log.debug("finding TRoleMenu instance by example");
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
		log.debug("finding TRoleMenu instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TRoleMenu as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all TRoleMenu instances");
		try {
			String queryString = "from TRoleMenu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TRoleMenu merge(TRoleMenu detachedInstance) {
		log.debug("merging TRoleMenu instance");
		try {
			TRoleMenu result = (TRoleMenu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TRoleMenu instance) {
		log.debug("attaching dirty TRoleMenu instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TRoleMenu instance) {
		log.debug("attaching clean TRoleMenu instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RoleMenuDAOImple getFromApplicationContext(ApplicationContext ctx) {
		return (RoleMenuDAOImple) ctx.getBean("TRoleMenuDAO");
	}
}