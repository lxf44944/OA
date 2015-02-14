package pojo;



/**
 * TRoleMenu entity. @author MyEclipse Persistence Tools
 */

public class TRoleMenu  implements java.io.Serializable {


    // Fields    

     private TRoleMenuId id;


    // Constructors

    /** default constructor */
    public TRoleMenu() {
    }

    
    /** full constructor */
    public TRoleMenu(TRoleMenuId id) {
        this.id = id;
    }

   
    // Property accessors

    public TRoleMenuId getId() {
        return this.id;
    }
    
    public void setId(TRoleMenuId id) {
        this.id = id;
    }
   








}