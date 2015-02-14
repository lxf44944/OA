package user.imple;
// default package

import java.sql.SQLException;
import java.util.Date;
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

import pojo.TMenu;
import user.dao.MenuDAO;

/**
 * A data access object (DAO) providing persistence and search support for TMenu
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see .TMenu
 * @author MyEclipse Persistence Tools
 */
@SuppressWarnings("unchecked")
public class MenuDAOImple extends HibernateDaoSupport implements MenuDAO{
	private static final Logger log = LoggerFactory.getLogger(MenuDAOImple.class);
	// property constants
	public static final String MENUNAME = "menuname";
	public static final String LINK = "link";
	public static final String PID = "pid";
	public static final String UPDATEUSER = "updateuser";
	public static final String ISDEL = "isdel";
	public static final String ORDERID = "orderid";
	@Override
	public List<TMenu> seach() {
		log.debug("getting TMenu instance: ");
		try {
			String hql = "from TMenu t where isdel = 0 order by orderid";
			List<TMenu> instance = getHibernateTemplate().find(hql);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	public List<Integer> queryByOrderid(final int pid) {
		log.debug("update TMenu instance");
		List<Integer> list = null;
		try {
			list = getHibernateTemplate().execute(new HibernateCallback<List>() {

				@Override
				public List doInHibernate(Session session) throws HibernateException,
						SQLException {
					String hql = "select orderid from TMenu where pid=:tpid order by orderid desc";
					Query queryupdate=session.createQuery(hql);
					queryupdate.setInteger("tpid", pid);
					return queryupdate.list();
				}
			});
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
		return list;
	}
	
	

	@Override
	public void updateOrderid(final int changeOrderid,final int orderid) {
		log.debug("update TMenu instance");
		try {
			
			getHibernateTemplate().execute(new HibernateCallback<TMenu>() {

				@Override
				public TMenu doInHibernate(Session session) throws HibernateException,
						SQLException {
					String hql="update TMenu set orderid = :tcorderid where orderid = :torderid";
					Query queryupdate=session.createQuery(hql);
					queryupdate.setInteger("tcorderid", changeOrderid);
					queryupdate.setInteger("torderid", orderid);
					queryupdate.executeUpdate();
					return null;
				}
			});
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}

	@Override
	public void updateOrderid(final int changeOrderid, final int orderid, final int mid) {
		
		log.debug("update TMenu instance");
		try {
			
			getHibernateTemplate().execute(new HibernateCallback<TMenu>() {

				@Override
				public TMenu doInHibernate(Session session) throws HibernateException,
						SQLException {
					String hql="update TMenu set orderid = :torderid where orderid = :tcorderid and menuid<>:tmenuid";
					Query queryupdate=session.createQuery(hql);
					queryupdate.setInteger("tcorderid", changeOrderid);
					queryupdate.setInteger("torderid", orderid);
					queryupdate.setInteger("tmenuid", mid);
					queryupdate.executeUpdate();
					return null;
				}
			});
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}

	@Override
	public List<Integer> queryByOrderidAsc(final int pid) {
		log.debug("update TMenu instance");
		List<Integer> list = null;
		try {
			list = getHibernateTemplate().execute(new HibernateCallback<List>() {

				@Override
				public List doInHibernate(Session session) throws HibernateException,
						SQLException {
					String hql =  "select orderid from TMenu where pid=:tpid order by orderid";
					Query queryupdate=session.createQuery(hql);
					queryupdate.setInteger("tpid", pid);
					queryupdate.executeUpdate();
					return queryupdate.list();
				}
			});
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
		return list;
	}
	@Override
	public void up(final TMenu menu) {
		log.debug("update TMenu instance");
		try {
			this.up1(menu);
			this.up2(menu);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
		
	}
	public void up1(final TMenu menu) {
		log.debug("update TMenu instance");
		try {
			
			getHibernateTemplate().execute(new HibernateCallback<TMenu>() {

				@Override
				public TMenu doInHibernate(Session session) throws HibernateException,
						SQLException {
					String hql="update TMenu set orderid=(select max(orderid) from TMenu where pid=:tpid and orderid<:torderid) where menuid=:tmenuid";	
					Query queryupdate=session.createQuery(hql);
					queryupdate.setInteger("tpid", menu.getPid());
					queryupdate.setInteger("torderid", menu.getOrderid());
					queryupdate.setInteger("tmenuid", menu.getMenuid());
					queryupdate.executeUpdate();
					return null;
				}
			});
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
		
	}
	public void up2(final TMenu menu) {
		log.debug("update TMenu instance");
		try {
			getHibernateTemplate().execute(new HibernateCallback<TMenu>() {
				@Override
				public TMenu doInHibernate(Session session) throws HibernateException,
						SQLException {
					String hql1 ="update TMenu set orderid=:torderid where menuid!=:tmenuid and orderid=(select max(orderid) from TMenu where pid=:tpid and orderid<:torderid) ";
					Query queryupdate1=session.createQuery(hql1);
					queryupdate1.setInteger("tpid", menu.getPid());
					queryupdate1.setInteger("torderid", menu.getOrderid());
					queryupdate1.setInteger("tmenuid", menu.getMenuid());
					queryupdate1.executeUpdate();
					return null;
				}
			});
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
		
	}
	@Override
	public void down(final TMenu menu) {
		log.debug("update TMenu instance");
		try {
			this.down1(menu);
			this.down2(menu);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
		
	}
	public void down1(final TMenu menu) {
		log.debug("update TMenu instance");
		try {
			getHibernateTemplate().execute(new HibernateCallback<TMenu>() {

				@Override
				public TMenu doInHibernate(Session session) throws HibernateException,
						SQLException {
					String hql="update TMenu set orderid=(select min(orderid) from TMenu where pid=:tpid and orderid>:torderid) where menuid=:tmenuid";	
					Query queryupdate=session.createQuery(hql);
					queryupdate.setInteger("tpid", menu.getPid());
					queryupdate.setInteger("torderid", menu.getOrderid());
					queryupdate.setInteger("tmenuid", menu.getMenuid());
					queryupdate.executeUpdate();
					return null;
				}
			});
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
		
	
	}
	public void down2(final TMenu menu) {
		log.debug("update TMenu instance");
		try {
			getHibernateTemplate().execute(new HibernateCallback<TMenu>() {

				@Override
				public TMenu doInHibernate(Session session) throws HibernateException,
						SQLException {
					String hql1="update TMenu set orderid=:torderid where menuid!=:tmenuid and orderid=(select min(orderid) from TMenu where pid=:tpid and orderid>:torderid)";
					Query queryupdate1=session.createQuery(hql1);
					queryupdate1.setInteger("tpid", menu.getPid());
					queryupdate1.setInteger("torderid", menu.getOrderid());
					queryupdate1.setInteger("tmenuid", menu.getMenuid());
					queryupdate1.executeUpdate();
					return null;
				}
			});
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
		
	}
	@Override
	public void save(TMenu menu) {
		log.debug("saving TMenu instance");
		try {
			int orderid =getHibernateTemplate().execute(new HibernateCallback<Integer>() {

				@Override
				public Integer doInHibernate(Session session)
						throws HibernateException, SQLException {
					String orderid_sql="select max(orderid) from TMenu";
					Query query = session.createQuery(orderid_sql);
					int m=(Integer) query.iterate().next();
					int n=m+1;
					return n;
				}
			});
			menu.setOrderid(orderid);
			getHibernateTemplate().save(menu);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		
	}
	@Override
	public void update(TMenu menu) {
		log.debug("saving TMenu instance");
		try {
			getHibernateTemplate().update(menu);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		
	}
	@Override
	public TMenu findByMid(int menuid) {
		log.debug("getting TMenu instance with id: " + menuid);
		try {
			TMenu instance = (TMenu) getHibernateTemplate().get("pojo.TMenu", menuid);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	@Override
	public void delete(final int mid, final int pid) {
		log.debug("deleting TMenu instance");
		try {
			
			getHibernateTemplate().execute(new HibernateCallback<TMenu>() {

				@Override
				public TMenu doInHibernate(Session session) throws HibernateException,
						SQLException {
					String hql = "update TMenu set isdel=1 where menuid = ? and pid = ?";
					 Query query = session.createQuery(hql);
					 query.setInteger(0, mid);
					 query.setInteger(1, pid);
					 query.executeUpdate();
					 return null;
				}
			});
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
		
	}
	@Override
	public boolean checkMenuname(String menuname, int mid, int pid) {
		String hql="from TMenu where menuname=? and menuid!=? and pid=?";
		log.debug("select TMenu for menuname");
		try {
			List list = getHibernateTemplate().find(hql,menuname,mid,pid);
			log.debug("select successful");
			System.out.println(list);
			if(list.size() > 0){
				return true;
			}else{
				return false;
			}
		} catch (RuntimeException re) {
			log.error("select failed", re);
			throw re;
		}
	}
	@Override
	public boolean isUse(int mid) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	protected void initDao() {
		// do nothing
	}

//	public void save(TMenu transientInstance) {
//		log.debug("saving TMenu instance");
//		try {
//			getHibernateTemplate().save(transientInstance);
//			log.debug("save successful");
//		} catch (RuntimeException re) {
//			log.error("save failed", re);
//			throw re;
//		}
//	}

	public void delete(TMenu persistentInstance) {
		log.debug("deleting TMenu instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TMenu findById(java.lang.Integer id) {
		log.debug("getting TMenu instance with id: " + id);
		try {
			TMenu instance = (TMenu) getHibernateTemplate().get("TMenu", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TMenu instance) {
		log.debug("finding TMenu instance by example");
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
		log.debug("finding TMenu instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TMenu as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMenuname(Object menuname) {
		return findByProperty(MENUNAME, menuname);
	}

	public List findByLink(Object link) {
		return findByProperty(LINK, link);
	}

	public List findByPid(Object pid) {
		return findByProperty(PID, pid);
	}

	public List findByUpdateuser(Object updateuser) {
		return findByProperty(UPDATEUSER, updateuser);
	}

	public List findByIsdel(Object isdel) {
		return findByProperty(ISDEL, isdel);
	}

	public List findByOrderid(Object orderid) {
		return findByProperty(ORDERID, orderid);
	}

	public List findAll() {
		log.debug("finding all TMenu instances");
		try {
			String queryString = "from TMenu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TMenu merge(TMenu detachedInstance) {
		log.debug("merging TMenu instance");
		try {
			TMenu result = (TMenu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TMenu instance) {
		log.debug("attaching dirty TMenu instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TMenu instance) {
		log.debug("attaching clean TMenu instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MenuDAOImple getFromApplicationContext(ApplicationContext ctx) {
		return (MenuDAOImple) ctx.getBean("TMenuDAO");
	}
}