package konichiwa.model;

import java.util.List;

public class Customer {
	private int custid;
	private String fname;
	private String lname;
	private String email;
	private String phone;
	private String password;
	private List<Address> addresses;
	private List<Orders> orderz;
	public boolean valid;
	
	public Customer() {
		super();
	}
	
	public Customer(int custid) {
		super();
		this.custid = custid;
	}
	
	public Customer(int custid, String password) {
		super();
		this.custid = custid;
		this.password = password;
	}
	
	public Customer(int custid, String fname, String lname, String phone) {
		super();
		this.custid = custid;
		this.fname = fname;
		this.lname = lname;
		this.phone = phone;
	}
	
	public Customer(String fname, String lname, String email, String phone, String password) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}

	public int getCustid() {
		return custid;
	}

	public void setCustid(int custid) {
		this.custid = custid;
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
	
	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
	public List<Address> getCustomerAddresses(){
		return addresses;
	}
	
	public void setCustomerAddress(List<Address> addresses) {
		this.addresses = addresses;
	}
	
	public List<Orders> getCustomerOrderz(){
		return orderz;
	}
	
	public void setCustomerOrderz(List<Orders> orderz) {
		this.orderz = orderz;
	}
	
	@Override
	public String toString() {
		return "Customer [fname=" + fname + ", lname=" + lname + ", email=" + email + ", phone=" + phone + ", password="
				+ password + "]";
	}
	
}
