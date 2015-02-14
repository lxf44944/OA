package pojo;



/**
 * TUserRole entity. @author MyEclipse Persistence Tools
 */

public class TUserRole  implements java.io.Serializable {


    // Fields    

     private TUserRoleId id;


    // Constructors

    /** default constructor */
    public TUserRole() {
    }

    
    /** full constructor */
    public TUserRole(TUserRoleId id) {
        this.id = id;
    }

   
    // Property accessors

    public TUserRoleId getId() {
        return this.id;
    }
    
    public void setId(TUserRoleId id) {
        this.id = id;
    }


	@Override
	public String toString() {
		return "TUserRole [id=" + id + "]";
	}
   








}