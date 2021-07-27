package konichiwa.model;

public class Staff {
	private int staffId;
	private String staffFName;
	private String staffLName;
	private String staffPhone;
	private String staffEmail;
	private String staffPassword;
	private int staffType;
	public boolean valid;
	int verifyStatus;
	
	public Staff() {
		super();
	}
	
	public Staff(int staffId, String staffFName, String staffLName, String staffPhone, String staffEmail, String staffPassword, int staffType) {
		super();
		this.staffId = staffId;
		this.staffFName = staffFName;
		this.staffLName = staffLName;
		this.staffPhone = staffPhone;
		this.staffEmail = staffEmail;
		this.staffPassword = staffPassword;
		this.staffType = staffType;
	}
	
	public Staff(String staffFName, String staffLName, String staffPhone, String staffEmail, String staffPassword, int staffType) {
		super();
		this.staffFName = staffFName;
		this.staffLName = staffLName;
		this.staffPhone = staffPhone;
		this.staffEmail = staffEmail;
		this.staffPassword = staffPassword;
		this.staffType = staffType;
	}
	
	public int getStaffId() {
		return staffId;
	}
	
	public String getStaffFName() {
		return staffFName;
	}
	
	public String getStaffLName() {
		return staffLName;
	}
	
	public String getStaffPhone() {
		return staffPhone;
	}
	
	public String getStaffEmail() {
		return staffEmail;
	}
	
	public String getStaffPassword() {
		return staffPassword;
	}
	
	public int getStaffType() {
		return staffType;
	}
	
	public int getVerifyStatus(){return verifyStatus;}
	
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	
	public void setStaffFName(String staffFName) {
		this.staffFName = staffFName;
	}
	
	public void setStaffLName(String staffLName) {
		this.staffLName = staffLName;
	}
	
	public void setStaffPhone(String staffPhone) {
		this.staffPhone = staffPhone;
	}
	
	public void setStaffEmail(String staffEmail) {
		this.staffEmail = staffEmail;
	}
	
	public void setStaffPassword(String staffPassword) {
		this.staffPassword = staffPassword;
	}
	
	public void setStaffType(int staffType) {
		this.staffType = staffType;
	}
	public boolean isValid() {
		return valid;
	}
	
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
	public void setVerifyStatus(int verifyStatus)
	{
		this.verifyStatus=verifyStatus;
	}
}
