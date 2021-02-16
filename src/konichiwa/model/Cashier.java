package konichiwa.model;

public class Cashier {
	Boolean verify;
	
	public Cashier() {}

	public Cashier(Boolean verify) {
		this.verify = verify;
	}

	public Boolean getVerify() {
		return verify;
	}

	public void setVerify(Boolean verify) {
		this.verify = verify;
	}

	@Override
	public String toString() {
		return "Cashier [verify=" + verify + "]";
	}
	
}
