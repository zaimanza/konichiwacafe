package konichiwa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import konichiwa.connection.ConnectionManager;
import konichiwa.model.Item;

public class ItemDAO {

	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String name, desc;
	static double price;
	static String image;
	static int itemid;
	
	public List<Item> getAllItem() {
		List<Item> items = new ArrayList<Item>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select item.*,item_category.categoryname from item inner join item_category ON item.itemcategoryid = item_category.itemcategoryid";
			System.out.println(q);
			ResultSet rs = stmt.executeQuery(q);
			
			while(rs.next()) {
				Item item = new Item();
								
				System.out.println("Item ID: "+rs.getInt("itemid"));
				System.out.println("Name: "+rs.getString("itemname"));
				//System.out.println("Image: "+rs.getString("itemimage"));
				System.out.println("Stock: "+rs.getInt("itemstock"));
				System.out.println("Price: "+rs.getDouble("itemprice"));
				System.out.println("Description: "+rs.getString("itemdesc"));
				System.out.println("Item Category: "+rs.getString("categoryname"));
				
				item.setItemid(rs.getInt("itemid"));
				item.setName(rs.getString("itemname"));
				item.setDescription(rs.getString("itemdesc"));
				item.setPrice(rs.getDouble("itemprice"));
				item.setStock(rs.getInt("itemstock"));
				//item.setImage(rs.getString("itemimage"));
				item.setItemcategoryid(rs.getString("categoryname"));
				
				items.add(item);
			
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return items;
	}

}
