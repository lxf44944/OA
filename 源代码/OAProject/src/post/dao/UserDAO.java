package post.dao;

// default package

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import pojo.TDatadic;
import pojo.TMenu;
import pojo.TUser;
import post.inf.Userinf;
import post.pojo.TPostFile;
import user.dao.PageModel;


/**
 * A data access object (DAO) providing persistence and search support for TUser
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see .TUser
 * @author MyEclipse Persistence Tools
 */
public class UserDAO extends HibernateDaoSupport implements Userinf {
	private static final Logger log = LoggerFactory
			.getLogger(UserDAO.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String PASSWORD = "password";
	public static final String REALNAME = "realname";
	public static final String DEPTNO = "deptno";
	public static final String JOBNO = "jobno";
	public static final String SEX = "sex";
	public static final String CITY = "city";
	public static final String IDCARD = "idcard";
	public static final String TELEPHONE = "telephone";
	public static final String EMAIL = "email";
	public static final String MOBILEPHONE = "mobilephone";
	public static final String ADDRESS = "address";
	public static final String MARRIED = "married";
	public static final String FREEZE = "freeze";

	public void save(TUser transientInstance) {
		log.debug("saving TUser instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	public List<Object> findPageByQuery(final int pageNo, final int pageSize, final String hql,
			final Map map) {
		@SuppressWarnings("unchecked")
		List<Object> result =getHibernateTemplate().executeFind(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				List<Object> result = null;
				try {
					Query query = session.createQuery(hql);
					Iterator it = map.keySet().iterator();
					while (it.hasNext()) {
						Object key = it.next();
						query.setParameter(key.toString(), map.get(key));
					}
					query.setFirstResult((pageNo - 1) * pageSize);
					query.setMaxResults(pageSize);
					result = query.list();
				} catch (RuntimeException re) {
					throw re;
				}
				return result;
			}
		});
		return result;
	}

	public int getTotalCount(final String hql, final Map map) {
		
	 int count =getHibernateTemplate().execute(new HibernateCallback<Integer>() {

		@Override
		public Integer doInHibernate(Session session) throws HibernateException,
				SQLException {
			try {
				Query query = session.createQuery(hql);
				Iterator it = map.keySet().iterator();
				while (it.hasNext()) {
					Object key = it.next();
					query.setParameter(key.toString(), map.get(key));
				}
				System.out.println("查询数据"+query.list().get(0));
				List list = query.list();
				if(list != null){
//					int i = (Integer) list.get(0);
					int i = Integer.valueOf(list.get(0).toString());
					return i;
				}
				return 0;
			} catch (RuntimeException re) {
				throw re;
			}
		}
	});
	 return count;

	}

	

	protected void initDao() {
		// do nothing
	}

	public void delete(TUser persistentInstance) {
		log.debug("deleting TUser instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TUser findById(java.lang.Integer id) {
		log.debug("getting TUser instance with id: " + id);
		try {
			TUser instance = (TUser) getHibernateTemplate().get("TUser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TUser instance) {
		log.debug("finding TUser instance by example");
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
		log.debug("finding TUser instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TUser as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByRealname(Object realname) {
		return findByProperty(REALNAME, realname);
	}

	public List findByDeptno(Object deptno) {
		return findByProperty(DEPTNO, deptno);
	}

	public List findByJobno(Object jobno) {
		return findByProperty(JOBNO, jobno);
	}

	public List findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List findByCity(Object city) {
		return findByProperty(CITY, city);
	}

	public List findByIdcard(Object idcard) {
		return findByProperty(IDCARD, idcard);
	}

	public List findByTelephone(Object telephone) {
		return findByProperty(TELEPHONE, telephone);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByMobilephone(Object mobilephone) {
		return findByProperty(MOBILEPHONE, mobilephone);
	}

	public List findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List findByMarried(Object married) {
		return findByProperty(MARRIED, married);
	}

	public List findByFreeze(Object freeze) {
		return findByProperty(FREEZE, freeze);
	}

	public List findAll() {
		log.debug("finding all TUser instances");
		try {
			String queryString = "from TUser";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TUser merge(TUser detachedInstance) {
		log.debug("merging TUser instance");
		try {
			TUser result = (TUser) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TUser instance) {
		log.debug("attaching dirty TUser instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TUser instance) {
		log.debug("attaching clean TUser instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static UserDAO getFromApplicationContext(ApplicationContext ctx) {
		return (UserDAO) ctx.getBean("TUserDAO");
	}

}