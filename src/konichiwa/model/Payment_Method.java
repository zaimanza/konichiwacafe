package konichiwa.model;

public class Payment_Method {
	String method;
	
	public Payment_Method() {}

	public Payment_Method(String method) {
		this.method = method;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	@Override
	public String toString() {
		return "Payment_Method [method=" + method + "]";
	};

}
