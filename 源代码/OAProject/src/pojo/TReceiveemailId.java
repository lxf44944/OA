package pojo;



/**
 * TReceiveemailId entity. @author MyEclipse Persistence Tools
 */

public class TReceiveemailId  implements java.io.Serializable {


    // Fields    

     private String username;
     private TEmail email;


    // Constructors

    /** default constructor */
    public TReceiveemailId() {
    }

    
    /** full constructor */
    public TReceiveemailId(TEmail email, String username) {
        this.email = email;
        this.username = username;
    }

   
    // Property accessors

 





	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


    public TEmail getEmail() {
		return email;
	}

	public void setEmail(TEmail email) {
		this.email = email;
	}
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TReceiveemailId) ) return false;
		 TReceiveemailId castOther = ( TReceiveemailId ) other; 
         
		 return ( (this.getEmail()==castOther.getEmail()) || ( this.getEmail()!=null && castOther.getEmail()!=null && this.getEmail().equals(castOther.getEmail()) ) )
 && ( (this.getUsername()==castOther.getUsername()) || ( this.getUsername()!=null && castOther.getUsername()!=null && this.getUsername().equals(castOther.getUsername()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getEmail() == null ? 0 : this.getEmail().hashCode() );
         result = 37 * result + ( getUsername() == null ? 0 : this.getUsername().hashCode() );
         return result;
   }   





}