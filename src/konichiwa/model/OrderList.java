package konichiwa.model;

import java.util.*;

public class OrderList {
	private Orders orders = new Orders();
	private Payment payment = new Payment();
	private List<Order_Details> order_details;
	private List<Item> item;
	
	public OrderList() {
		super();
	}
	
	public OrderList(Orders orders, Payment payment, ArrayList<Order_Details> order_details, ArrayList<Item> item) {
		this.orders = orders;
		this.payment = payment;
		this.order_details = order_details;
		this.item = item;
	}
	
	public OrderList(Orders orders, Payment payment) {
		this.orders = orders;
		this.payment = payment;
	}
	
	public Orders getOrders() {return orders;}
	public Payment getPayment() {return payment;}
	public List<Order_Details> getOrder_DetailsList() {return order_details;}
	public List<Item> getItemList() {return item;}
	
	public void setOrders(Orders o) {orders = o;}
	public void setPayment(Payment p) {payment = p;}
	public void setOrder_DetailsList( List<Order_Details> order_list) {order_details = order_list;}
	public void setItemList(List<Item> item_list) {item = item_list;}
}
