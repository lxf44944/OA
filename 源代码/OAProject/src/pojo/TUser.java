package pojo;

import java.util.Date;
import java.util.List;


/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class TUser  implements java.io.Serializable {


    // Fields    

     private Integer userid;
     private String username;
     private String password;
     private String realname;
     private Integer deptno;
     private Integer jobno;
     private Date regdate;
     private String sex;
     private String city;
     private String idcard;
     private String telephone;
     private String email;
     private String mobilephone;
     private String address;
     private Integer married;
     private Integer freeze;

    private List rid;
    private String oldpassword;
    // Constructors

    /** default constructor */
    public TUser() {
    }

    
    /** full constructor */
    public TUser(String username, String password, String realname, Integer deptno, Integer jobno, Date regdate, String sex, String city, String idcard, String telephone, String email, String mobilephone, String address, Integer married, Integer freeze) {
        this.username = username;
        this.password = password;
        this.realname = realname;
        this.deptno = deptno;
        this.jobno = jobno;
        this.regdate = regdate;
        this.sex = sex;
        this.city = city;
        this.idcard = idcard;
        this.telephone = telephone;
        this.email = email;
        this.mobilephone = mobilephone;
        this.address = address;
        this.married = married;
        this.freeze = freeze;
    }

   
    // Property accessors

    public Integer getUserid() {
        return this.userid;
    }
    
    public List getRid() {
		return rid;
	}


	public void setRid(List rid) {
		this.rid = rid;
	}


	public String getOldpassword() {
		return oldpassword;
	}


	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}


	public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealname() {
        return this.realname;
    }
    
    public void setRealname(String realname) {
        this.realname = realname;
    }

    public Integer getDeptno() {
        return this.deptno;
    }
    
    public void setDeptno(Integer deptno) {
        this.deptno = deptno;
    }

    public Integer getJobno() {
        return this.jobno;
    }
    
    public void setJobno(Integer jobno) {
        this.jobno = jobno;
    }

    public Date getRegdate() {
        return this.regdate;
    }
    
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public String getSex() {
        return this.sex;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }

    public String getIdcard() {
        return this.idcard;
    }
    
    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getTelephone() {
        return this.telephone;
    }
    
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobilephone() {
        return this.mobilephone;
    }
    
    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getMarried() {
        return this.married;
    }
    
    public void setMarried(Integer married) {
        this.married = married;
    }

    public Integer getFreeze() {
        return this.freeze;
    }
    
    public void setFreeze(Integer freeze) {
        this.freeze = freeze;
    }


	








}