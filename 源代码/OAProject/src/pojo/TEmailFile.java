package pojo;



/**
 * TEmailFile entity. @author MyEclipse Persistence Tools
 */

public class TEmailFile  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private TEmail email;
     private String oldname;
     private String newname;


    // Constructors

    /** default constructor */
    public TEmailFile() {
    }

    
    /** full constructor */
    public TEmailFile(TEmail email, String oldname, String newname) {
        this.email = email;
        this.oldname = oldname;
        this.newname = newname;
    }

 // Property accessors
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public TEmail getEmail() {
		return email;
	}


	public void setEmail(TEmail email) {
		this.email = email;
	}


	public String getOldname() {
		return oldname;
	}


	public void setOldname(String oldname) {
		this.oldname = oldname;
	}


	public String getNewname() {
		return newname;
	}


	public void setNewname(String newname) {
		this.newname = newname;
	}

   
    

   








}