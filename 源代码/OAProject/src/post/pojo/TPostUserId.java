package post.pojo;

import oracle.sql.INTERVALYM;

/**
 * TPostUserId entity. @author MyEclipse Persistence Tools
 */

public class TPostUserId implements java.io.Serializable {

	// Fields

	private Integer suserid;
	private Integer postid;

	// Constructors

	/** default constructor */
	public TPostUserId() {
	}

	/** full constructor */
	public TPostUserId(Integer suserid, Integer postid) {
		this.suserid = suserid;
		
		this.postid = postid;
	}

	// Property accessors

	public Integer getSuserid() {
		return this.suserid;
	}

	public void setSuserid(Integer suserid) {
		this.suserid = suserid;
	}

	

	

	public Integer getPostid() {
		return this.postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TPostUserId))
			return false;
		TPostUserId castOther = (TPostUserId) other;

		return ((this.getSuserid() == castOther.getSuserid()) || (this
				.getSuserid() != null
				&& castOther.getSuserid() != null && this.getSuserid().equals(
				castOther.getSuserid())))
				
				&& ((this.getPostid() == castOther.getPostid()) || (this
						.getPostid() != null
						&& castOther.getPostid() != null && this.getPostid()
						.equals(castOther.getPostid())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getSuserid() == null ? 0 : this.getSuserid().hashCode());
		
		result = 37 * result
				+ (getPostid() == null ? 0 : this.getPostid().hashCode());
		return result;
	}

}