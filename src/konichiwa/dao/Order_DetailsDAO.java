package konichiwa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import konichiwa.connection.ConnectionManager;
import konichiwa.model.Order_Details;

public class Order_DetailsDAO {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	
	static int Order_DetailsID, item_OrderQty, itemID, orderID;
	
	
	public void add(Order_Details order_details) {
		item_OrderQty = order_details.getItem_OrderQty();
		itemID = order_details.getItemID();
		orderID = order_details.getOrderID();
		
		try {
			currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("INSERT INTO ORDER_DETAILS (ITEM_ORDERQTY, ITEMID, ORDERID) values (?, ? , ?)");
    		ps.setInt(1, item_OrderQty);
    		ps.setInt(2, itemID);
    		ps.setInt(3, orderID);
    		ps.executeUpdate();

		}
		catch(Exception e) {
			System.out.println("failed: An Exception has occurred! " + e);
		}
		finally {
			if (ps != null) {
    			try {
    				ps.close();
    			} catch (Exception e) {
    			}
    			ps = null;
    		}
    		
    		if (currentCon != null) {
    			try {
    				currentCon.close();
    			} catch (Exception e) {
    			}
    			currentCon = null;
    		}
		}
	}
	
	public List<Order_Details> getOrderDetails(int orderid) {
		List<Order_Details> ordered = new ArrayList<Order_Details>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String query = "SELECT ORDER_DETAILS.*, ITEM.ITEMNAME, ITEM.ITEMPRICE FROM ORDER_DETAILS INNER JOIN ITEM ON ORDER_DETAILS.ITEMID = ITEM.ITEMID WHERE ORDERID =" + orderid;
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				Order_Details od = new Order_Details();
				
				od.setOrderID(rs.getInt("orderID"));
				od.setItemID(rs.getInt("itemID"));
				od.setItem_OrderQty(rs.getInt("item_OrderQty"));
				od.setItemName(rs.getString("itemname"));
				od.setItempr(rs.getDouble("itemprice"));
				
				ordered.add(od);
			}
		}
		
		catch(SQLException e) {
			e.printStackTrace();
		}
		return ordered;
	}
}
