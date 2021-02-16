package konichiwa.model;

public class Staff {
	String fname;
	String lname;
	String email;
	String phone;
	String password;
	String type;
	
	public Staff() {};
	
	public Staff(String fname, String lname, String email, String phone, String password,String type) {
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.type = type;
	}
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Staff [fname=" + fname + ", lname=" + lname + ", email=" + email + ", phone=" + phone + ", password="
				+ password + "type=" + type+"]";
	}
	
}
