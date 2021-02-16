package konichiwa.dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;


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
	
	public List<Item> getAllItem() throws IOException {
		List<Item> items = new ArrayList<Item>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select item.*,item_category.categoryname from item inner join item_category ON item.itemcategoryid = item_category.itemcategoryid";
			//System.out.println(q);
			ResultSet rs = stmt.executeQuery(q);
			
			while(rs.next()) {
				Item item = new Item();
								
				item.setItemid(rs.getInt("itemid"));
				item.setName(rs.getString("itemname"));
				item.setDescription(rs.getString("itemdesc"));
				item.setPrice(rs.getDouble("itemprice"));
				item.setItemcategoryid(rs.getString("categoryname"));
				item.setStock(rs.getInt("itemstock"));
								
				//image
				Blob blob = rs.getBlob("itemimage");
				
				InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                try {
					while ((bytesRead = inputStream.read(buffer)) != -1) {
					    outputStream.write(buffer, 0, bytesRead);                  
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                 
                inputStream.close();
                outputStream.close();
                
                item.setImage(base64Image);
                
				items.add(item);
			
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return items;
	}
	
	/*adib*/
	public Item getItemById(int id, int qty) {
        Item item = new Item();

        try {
            currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("select item.*,item_category.categoryname from item inner join item_category ON item.itemcategoryid = item_category.itemcategoryid where itemid=?");

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
            	item.setItemid(rs.getInt("itemid"));
				item.setName(rs.getString("itemname"));
				item.setDescription(rs.getString("itemdesc"));
				item.setPrice(rs.getDouble("itemprice"));
				item.setStock(rs.getInt("itemstock"));
				item.setItemcategoryid(rs.getString("categoryname"));
				item.setQuantity(qty);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }

        return item;
    }
	
	/*adib habis*/
	
	public void deductStock(int itemid, int qty) {
		String deductQuery = "UPDATE item SET itemStock=itemStock-"+qty+" where itemid="+itemid;
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeUpdate(deductQuery);
			
			if(stmt !=null)
				System.out.println("Quantity Item ID "+itemid+" is updated");
			else
				System.out.println("Quantity Item ID "+itemid+" is not updated");	
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

}
