package pojo;



/**
 * TRoleMenuId entity. @author MyEclipse Persistence Tools
 */

public class TRoleMenuId  implements java.io.Serializable {


    // Fields    

     private Integer roleid;
     private Integer menuid;


    // Constructors

    /** default constructor */
    public TRoleMenuId() {
    }

    
    /** full constructor */
    public TRoleMenuId(Integer roleid, Integer menuid) {
        this.roleid = roleid;
        this.menuid = menuid;
    }

   
    // Property accessors

    public Integer getRoleid() {
        return this.roleid;
    }
    
    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Integer getMenuid() {
        return this.menuid;
    }
    
    public void setMenuid(Integer menuid) {
        this.menuid = menuid;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TRoleMenuId) ) return false;
		 TRoleMenuId castOther = ( TRoleMenuId ) other; 
         
		 return ( (this.getRoleid()==castOther.getRoleid()) || ( this.getRoleid()!=null && castOther.getRoleid()!=null && this.getRoleid().equals(castOther.getRoleid()) ) )
 && ( (this.getMenuid()==castOther.getMenuid()) || ( this.getMenuid()!=null && castOther.getMenuid()!=null && this.getMenuid().equals(castOther.getMenuid()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getRoleid() == null ? 0 : this.getRoleid().hashCode() );
         result = 37 * result + ( getMenuid() == null ? 0 : this.getMenuid().hashCode() );
         return result;
   }   





}