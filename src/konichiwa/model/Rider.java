package konichiwa.model;

public class Rider {
	
	private String riderFName;
	private String RIDERLNAME;
	private String RIDERPHONE;
	private String RIDEREMAIL;
	private String RIDERPASS;
	private int RIDERSTAT;
	private int RIDERAVAILABLE;
	private int riderId;
	public boolean valid;	
	
	public Rider() {
		super();
	}
	
	public String getStatString() {
        String statusRider = "";
        if(RIDERSTAT == 1) {
            statusRider = "Not Verified";
        } else if(RIDERSTAT == 2) {
            statusRider = "Verified";
        }
        return statusRider;
    }
	public String getAvailableString() {
        String avail = "";
        if(RIDERAVAILABLE == 1) {
            avail = "Not Available";
        } else if(RIDERAVAILABLE == 2) {
            avail = "Available";
        }
        return avail;
    }
	
	public Rider(
			String riderFName, 
			String RIDERLNAME, 
			String RIDERPHONE, 
			String RIDEREMAIL, 
			String RIDERPASS, 
			int RIDERSTAT,
			int RIDERAVAILABLE, 
			int riderId
//			int STAFFID
			) {
		super();
		this.riderFName = riderFName;
		this.RIDERLNAME = RIDERLNAME;
		this.RIDERPHONE = RIDERPHONE;
		this.RIDEREMAIL = RIDEREMAIL;
		this.RIDERPASS = RIDERPASS;
		this.RIDERSTAT = RIDERSTAT;
		this.RIDERAVAILABLE = RIDERAVAILABLE;
		this.riderId = riderId;
//		this.STAFFID = STAFFID;
	}

	public String getFName() {return riderFName;}
	public String getLName() {return RIDERLNAME;}
	public String getPhone() {return RIDERPHONE;}
	public String getEmail() {return RIDEREMAIL;}
	public String getPass() {return RIDERPASS;}
	public int getStat() {return RIDERSTAT;}
	public int getAvailable() {return RIDERAVAILABLE;}
	public int getRiderId() {return riderId;}
//	public int getStaffId() {return STAFFID;}
	public boolean isValid() {return valid;}

	public void setFName(String riderFName) {this.riderFName = riderFName;}
	public void setLName(String RIDERLNAME) {this.RIDERLNAME = RIDERLNAME;}
	public void setPhone(String RIDERPHONE) {this.RIDERPHONE = RIDERPHONE;}
	public void setEmail(String RIDEREMAIL) {this.RIDEREMAIL = RIDEREMAIL;}
	public void setPass(String RIDERPASS) {this.RIDERPASS = RIDERPASS;}
	public void setStat(int RIDERSTAT) {this.RIDERSTAT = RIDERSTAT;}
	public void setAvailable(int RIDERAVAILABLE) {this.RIDERAVAILABLE = RIDERAVAILABLE;}
	public void setRiderId(int riderId) {this.riderId = riderId;}
//	public void setStaffId(int STAFFID) {this.STAFFID = STAFFID;}
	public void setValid(boolean valid) {this.valid = valid;}
}
