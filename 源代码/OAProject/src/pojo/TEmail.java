package pojo;

import java.sql.Clob;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * TEmail entity. @author MyEclipse Persistence Tools
 */

public class TEmail  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String title;
     private Date senddate;
     private Boolean isfile;
     private String content;
     private Boolean emailmode;
     private Set<TEmailFile> emailFiles = new HashSet<TEmailFile>(0);


    // Constructors

    /** default constructor */
    public TEmail() {
    }

    
    /** full constructor */
   
   
   

    
    
  public TEmail(String title, Date senddate, Boolean isfile, String content,
			Boolean emailmode, Set<TEmailFile> emailFiles) {
		super();
		this.title = title;
		this.senddate = senddate;
		this.isfile = isfile;
		this.content = content;
		this.emailmode = emailmode;
		this.emailFiles = emailFiles;
	}

  // Property accessors
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}





	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public Date getSenddate() {
		return senddate;
	}


	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}


	public Boolean getIsfile() {
		return isfile;
	}


	public void setIsfile(Boolean isfile) {
		this.isfile = isfile;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Boolean getEmailmode() {
		return emailmode;
	}


	public void setEmailmode(Boolean emailmode) {
		this.emailmode = emailmode;
	}


	public Set<TEmailFile> getEmailFiles() {
		return emailFiles;
	}


	public void setEmailFiles(Set<TEmailFile> emailFiles) {
		this.emailFiles = emailFiles;
	}





   


   








}