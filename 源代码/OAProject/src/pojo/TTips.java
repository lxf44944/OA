package pojo;



/**
 * TTips entity. @author MyEclipse Persistence Tools
 */

public class TTips  implements java.io.Serializable {


    // Fields    

     private Integer tuserid;
     private Integer tshowpost;
     private Integer tshowemail;
     private Integer tisshow;
     private Integer showtime;


    // Constructors

    /** default constructor */
    public TTips() {
    }

    
    /** full constructor */
    public TTips(Integer tshowpost, Integer tshowemail, Integer tisshow, Integer showtime) {
        this.tshowpost = tshowpost;
        this.tshowemail = tshowemail;
        this.tisshow = tisshow;
        this.showtime = showtime;
    }

   
    // Property accessors

    public Integer getTuserid() {
        return this.tuserid;
    }
    
    public void setTuserid(Integer tuserid) {
        this.tuserid = tuserid;
    }

    public Integer getTshowpost() {
        return this.tshowpost;
    }
    
    public void setTshowpost(Integer tshowpost) {
        this.tshowpost = tshowpost;
    }

    public Integer getTshowemail() {
        return this.tshowemail;
    }
    
    public void setTshowemail(Integer tshowemail) {
        this.tshowemail = tshowemail;
    }

    public Integer getTisshow() {
        return this.tisshow;
    }
    
    public void setTisshow(Integer tisshow) {
        this.tisshow = tisshow;
    }

    public Integer getShowtime() {
        return this.showtime;
    }
    
    public void setShowtime(Integer showtime) {
        this.showtime = showtime;
    }
   








}