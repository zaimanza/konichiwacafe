package konichiwa.model;

public class Payment {
	private int paymentID;
	private double totalPrice;
	private double deliveryFee;
	private double transactionFee;
	private int paymentMethodID;
	private String paymentMethodName;
	
	public Payment() {
		super();
	}
	
	public Payment(int paymentID, double totalPrice, double deliveryFee, double transactionFee, int paymentMethodID) {
		this.paymentID = paymentID;
		this.totalPrice = totalPrice;
		this.deliveryFee = deliveryFee;
		this.transactionFee = transactionFee;
		this.paymentMethodID = paymentMethodID;
	}
	
	public Payment(int paymentMethodID, double totalPrice) {
		this.totalPrice = totalPrice;
		this.paymentMethodID = paymentMethodID;
	}
	
	public int getPaymentID() {return paymentID;}
	public double getTotalPrice() {return totalPrice;}
	public double getDeliveryFee() {return deliveryFee;}
	public double getTransactionFee() {return transactionFee;}
	public int getPaymentMethodID() {return paymentMethodID;}
	public String getPaymentMethodName() {return paymentMethodName;}
	
	public void setPaymentID(int pid) {this.paymentID = pid;}
	public void setTotalPrice(double tp) {this.totalPrice = tp;}
	public void setDeliveryFee(double df) {this.deliveryFee = df;}
	public void setTransactionFee(double tf) {this.transactionFee = tf;}
	public void setPaymentMethodID(int pmid) {this.paymentMethodID = pmid;}
	public void setPaymentMethodName(String paymentMethodName) {this.paymentMethodName = paymentMethodName;}
	
	

	

	public String toString() {
		return (
				"Payment ID: " + paymentID +
				"Total Price: RM" + totalPrice +
				"Delivery Fee: RM" + deliveryFee +
				"Transaction Fee: " + transactionFee +
				"Payment Method ID: " + paymentMethodID
				);
	}
}