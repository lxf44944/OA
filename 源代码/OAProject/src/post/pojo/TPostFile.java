package post.pojo;

/**
 * TPostFile entity. @author MyEclipse Persistence Tools
 */

public class TPostFile implements java.io.Serializable {

	// Fields

	private Integer nid;
	private Integer postid;
	private String soldname;
	private String snewname;

	// Constructors

	/** default constructor */
	public TPostFile() {
	}

	/** full constructor */
	public TPostFile( String soldname, String snewname) {
		
		this.soldname = soldname;
		this.snewname = snewname;
	}

	// Property accessors

	public Integer getNid() {
		return this.nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}

	

	

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public String getSoldname() {
		return this.soldname;
	}

	public void setSoldname(String soldname) {
		this.soldname = soldname;
	}

	public String getSnewname() {
		return this.snewname;
	}

	public void setSnewname(String snewname) {
		this.snewname = snewname;
	}

}