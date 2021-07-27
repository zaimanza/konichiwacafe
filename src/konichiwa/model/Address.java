package konichiwa.model;

public class Address {
	private int addressid;
	private String addressstreet;
	private String addresscity;
	private String addresspostcode;
	private String addressstate;
	private Address address;
	private int custid;
	public boolean valid;
	
	public Address() {
		super();
	}
	
	public Address(String addressstreet, String addresscity, String addresspostcode, String addressstate) {
		this.addressstreet = addressstreet;
		this.addresscity = addresscity;
		this.addresspostcode = addresspostcode;
		this.addressstate = addressstate;
	}
	
	public Address(int addressid,String addressstreet, String addresscity, String addresspostcode, String addressstate, int custid) {
		this.addressid = addressid;
		this.addressstreet = addressstreet;
		this.addresscity = addresscity;
		this.addresspostcode = addresspostcode;
		this.addressstate = addressstate;
		this.custid = custid;
	}
	
	public Address(String addressstreet, String addresscity, String addresspostcode, String addressstate, int custid) {
		this.addressstreet = addressstreet;
		this.addresscity = addresscity;
		this.addresspostcode = addresspostcode;
		this.addressstate = addressstate;
		this.custid = custid;
	}
	
	public Address(int addressid, String addressstreet, String addresscity, String addresspostcode, String addressstate) {
		this.addressid = addressid;
		this.addressstreet = addressstreet;
		this.addresscity = addresscity;
		this.addresspostcode = addresspostcode;
		this.addressstate = addressstate;
	}
	
	public int getAddressid() {
		return addressid;
	}
	
	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}

	public int getCustid() {
		return custid;
	}
	
	public void setCustid(int custid) {
		this.custid = custid;
	}
	
	public String getAddressstreet() {
		return addressstreet;
	}
	public void setAddressstreet(String addressstreet) {
		this.addressstreet = addressstreet;
	}
	public String getAddresscity() {
		return addresscity;
	}
	public void setAddresscity(String addresscity) {
		this.addresscity = addresscity;
	}
	public String getAddresspostcode() {
		return addresspostcode;
	}
	public void setAddresspostcode(String addresspostcode) {
		this.addresspostcode = addresspostcode;
	}
	public String getAddressstate() {
		return addressstate;
	}
	public void setAddressstate(String addressstate) {
		this.addressstate = addressstate;
	}	
	
	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
	@Override
	public String toString() {
		return "Address [street=" + addressstreet + ", city=" + addresscity + ", addresspostcode=" + addresspostcode + ", addressstate=" + addressstate + "]";
	}
	
}
