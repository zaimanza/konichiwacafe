package konichiwa.model;

public class Orders {
	private int orderID;
	private String DeliveryAddress;
	private String orderStatus;
	private String orderDate;
	private int paymentID;
	private int custID;
	private int staffID;
	private int riderID;
	private boolean valid;
	
	public Orders() {
		super();
	}
	
	public Orders(String DeliveryAddress, String orderStatus, String orderDate, int paymentID, int custID, int staffID,int orderID, int riderID) {
		this.DeliveryAddress = DeliveryAddress;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		this.paymentID = paymentID;
		this.custID = custID;
		this.staffID = staffID;
		this.riderID = riderID;
		this.orderID = orderID;
	}
	
	public Orders(String DeliveryAddress, String orderStatus, String orderDate, int paymentID, int custID, int staffID) {
		this.DeliveryAddress = DeliveryAddress;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		this.paymentID = paymentID;
		this.custID = custID;
		this.staffID = staffID;
	}
	
	public Orders(String DeliveryAddress, int custID, int paymentID) {
		this.DeliveryAddress = DeliveryAddress;
		this.custID = custID;
		this.paymentID = paymentID;
		this.orderStatus = "1";
		this.staffID = 0;
		this.riderID = 0;
	}
	
	public int getOrderID() {return orderID;}
	public String getDeliveryAddress() {return DeliveryAddress;}
	public String getOrderStatus() {return orderStatus;}
	public String getOrderDate() {return orderDate;}
	public int getPaymentID() {return paymentID;}
	public int getCustID() {return custID;}
	public int getStaffID() {return staffID;}
	public int getRiderID() {return riderID;}
	public boolean isValid() {return valid;}
	
	public void setOrderID(int id) {this.orderID = id;}
	public void setDeliveryAddress(String add) {this.DeliveryAddress = add;}
	public void setOrderStatus(String status) {this.orderStatus = status;}
	public void setOrderDate(String orDate) {this.orderDate = orDate;}
	public void setPaymentID(int pid) {this.paymentID = pid;}
	public void setCustID(int cid) {this.custID = cid;}
	public void setStaffID(int sid) {this.staffID = sid;}
	public void setRiderID(int rid) {riderID = rid;}
	public void setValid(boolean valid) {this.valid = valid;}
	
	public String toString() {
		return (
				"Order ID: " + orderID +
				"Delivery Address: " + DeliveryAddress +
				"Order Status: " + orderStatus +
				"Order Date: " + orderDate +
				"Payment ID: " + paymentID +
				"Customer ID: " + custID +
				"Staff ID: " + staffID +
				"Rider ID: " + riderID);
	}
}
