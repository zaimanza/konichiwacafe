package konichiwa.model;

import java.util.List;

public class Order_Details {
	private int Order_DetailsID;
	private int item_OrderQty;
	private int itemID;
	private int orderID;
	private String itemName;
	private double itempr;
	private List<Order_Details> ordered;
	
	public Order_Details() {
		super();
	}
	
	public Order_Details(int Order_DetailsID, int item_OrderQty, int itemID, int orderID) {
		this.Order_DetailsID = Order_DetailsID;
		this.item_OrderQty = item_OrderQty;
		this.itemID = itemID;
		this.orderID = orderID;
	}
	
	public Order_Details(int item_OrderQty, int itemID, int orderID) {
		this.item_OrderQty = item_OrderQty;
		this.itemID = itemID;
		this.orderID = orderID;
	}
	
	public int getOrder_DetailsID() {return Order_DetailsID;}
	public int getItem_OrderQty() {return item_OrderQty;}
	public int getItemID() {return itemID;}
	public int getOrderID() {return orderID;}
	
	
	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public double getItempr() {
		return itempr;
	}

	public void setItempr(double itempr) {
		this.itempr = itempr;
	}

	public void setOrder_DetailsID(int id) {this.Order_DetailsID = id;}
	public void setItem_OrderQty(int qty) {this.item_OrderQty = qty;}
	public void setItemID(int item) {this.itemID = item;}
	public void setOrderID(int order) {this.orderID = order;}
	
	public List<Order_Details> getItemOrdered() {
		return ordered;
	}

	public void setItemOrdered(List<Order_Details> ordered) {
		this.ordered = ordered;
	}

	public String toString() {
		return (
				"Order Details ID: " + Order_DetailsID +
				"Item Order Quantity: " + item_OrderQty +
				"Item ID: " + itemID +
				"Order ID: " + orderID
				);
	}
}
