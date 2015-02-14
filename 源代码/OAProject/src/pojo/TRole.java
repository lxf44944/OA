package pojo;

import java.util.Date;
import java.util.List;


/**
 * TRole entity. @author MyEclipse Persistence Tools
 */

public class TRole  implements java.io.Serializable {


    // Fields    

     private Integer roleid;
     private String rolename;
     private String roleinfo;
     private Date addtime;
     private String updateuser;
     private Date updatetime;
     private Integer isdel;
     private List mid;

    // Constructors

    /** default constructor */
    public TRole() {
    }

    
    /** full constructor */
    public TRole(String rolename, String roleinfo, Date addtime, String updateuser, Date updatetime, Integer isdel) {
        this.rolename = rolename;
        this.roleinfo = roleinfo;
        this.addtime = addtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdel = isdel;
    }

   
    // Property accessors

    public Integer getRoleid() {
        return this.roleid;
    }
    
    public List getMid() {
		return mid;
	}


	public void setMid(List mid) {
		this.mid = mid;
	}


	public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return this.rolename;
    }
    
    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getRoleinfo() {
        return this.roleinfo;
    }
    
    public void setRoleinfo(String roleinfo) {
        this.roleinfo = roleinfo;
    }

    public Date getAddtime() {
        return this.addtime;
    }
    
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public String getUpdateuser() {
        return this.updateuser;
    }
    
    public void setUpdateuser(String updateuser) {
        this.updateuser = updateuser;
    }

    public Date getUpdatetime() {
        return this.updatetime;
    }
    
    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getIsdel() {
        return this.isdel;
    }
    
    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }


	@Override
	public String toString() {
		return "TRole [addtime=" + addtime + ", isdel=" + isdel + ", mid="
				+ mid + ", roleid=" + roleid + ", roleinfo=" + roleinfo
				+ ", rolename=" + rolename + ", updatetime=" + updatetime
				+ ", updateuser=" + updateuser + "]" +mid;
	}
   








}