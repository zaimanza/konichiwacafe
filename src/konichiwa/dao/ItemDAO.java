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
import konichiwa.model.Item_Category;

public class ItemDAO {

	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String name, desc,itemcategoryid;
	static double price;
	static String image;
	static int itemid,stock,staffid;
	
	public List<Item_Category> getAllItemCategory() throws IOException {
		List<Item_Category> itemcategorylist = new ArrayList<Item_Category>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select * from item_category";
			//System.out.println(q);
			ResultSet rs = stmt.executeQuery(q);
			
			while(rs.next()) {
				Item_Category itemcategory = new Item_Category();
								
				itemcategory.setItemcategoryid(rs.getInt("itemcategoryid"));
				itemcategory.setCategoryname(rs.getString("categoryname"));				
                
				itemcategorylist.add(itemcategory);			
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return itemcategorylist;
	}
	
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
	
	public List<Item> getAllItemByCategory(String itemcategoryid) throws IOException {
		List<Item> items = new ArrayList<Item>();
		int id = Integer.parseInt(itemcategoryid);
		System.out.println("masuk kee :"+id);
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select item.*,item_category.categoryname from item inner join item_category ON item.itemcategoryid = item_category.itemcategoryid where item.itemcategoryid="+id+"";
			
			System.out.println(q);
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
	
	//mimi
	public static Item getItem(Item item) {
		itemid = item.getItemid();
		
		String searchQuery = "select * from ITEM where ITEMID="+itemid+"";
		
		try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
                       
            System.out.println(searchQuery);

        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }
                currentCon = null;
            }
        }
        return item;
	}
	
	public Item getItemOlehId(int id) {
		Item item = new Item();
		
		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from item where itemid=?");
			
			ps.setInt(1,  id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				item.setItemid(rs.getInt("ITEMID"));
				item.setName(rs.getString("ITEMNAME"));
				item.setPrice(rs.getDouble("ITEMPRICE"));
				item.setStock(rs.getInt("ITEMSTOCK"));
				item.setDescription(rs.getString("ITEMDESC"));
				//item.setImage(rs.getString("ITEMIMAGE"));
				item.setItemcategoryid(rs.getString("ITEMCATEGORYID"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return item;
	}
	
	public Item updateStock(Item item) {
		int id = item.getItemid();
		int stock = item.getStock();
			
		String updateQuery = "UPDATE ITEM SET ITEMSTOCK=" + stock + " WHERE ITEMID=" + id +"";
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeQuery(updateQuery);
			int check = stmt.executeUpdate(updateQuery);
            
            if(check == 0)//unsuccessful update
            	item.setValid(false);
            else //successful update
            	item.setValid(true);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return item;
	}
	//mimi habis
	
	//image test
	public int uploadImage(InputStream file) {
		int row=0;
		try {
			currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("INSERT INTO TESTIMG (img) values (?)");
    		ps.setBlob(1, file);
    		
    		// sends the statement to the database server
            row = ps.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return row;
	}
	
	//azfar sarah
	public Item getItemValid(Item item) { //check item tu dah ada ke belum
		name = item.getName();
		
				
		String searchQuery = "select * from item where upper(itemname) like upper('"+name+"')";
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();
			
			if(more) {
				item.setValid(true);
			}
			
			else if(!more) {
				item.setValid(false);
			}
		}
		
		catch (Exception e) {
			System.out.println("Adding item failed: An Exception has occured!"+e);
		}
		
		finally {
			if (rs != null) {
	            try {
	                rs.close();
	            } catch (Exception e) {
	            }
	            rs = null;
	        }
	
	        if (stmt != null) {
	            try {
	                stmt.close();
	            } catch (Exception e) {
	            }
	            stmt = null;
	        }
	
	        if (currentCon != null) {
	            try {
	                currentCon.close();
	            } catch (Exception e) {
	            }
	
	            currentCon = null;
	        }
		}
		
		return item;
	}

	public void add(Item item, InputStream img) {
		name = item.getName();
		price = item.getPrice();
		stock = item.getStock();
		desc = item.getDescription();
		staffid = item.getStaffid();
		itemcategoryid = item.getItemcategoryid();
		
		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("insert into item (itemname, itemprice, itemstock, itemdesc, itemimage, staffid, itemcategoryid) values(?,?,?,?,?,?,?)");
			ps.setString(1, name);
			ps.setDouble(2, price);
			ps.setInt(3, stock);
			ps.setString(4, desc);
			ps.setBlob(5, img);
			ps.setInt(6, staffid);
			ps.setString(7, itemcategoryid);
			ps.executeUpdate();
			
		}
		
		catch(Exception e){
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
	
	public Item updateItem(Item item) { //admin 
		itemid = item.getItemid();
        name = item.getName();
        price = item.getPrice();
        stock = item.getStock();
        desc = item.getDescription();
//        image = item.getImage();
        staffid = item.getStaffid();
        itemcategoryid = item.getItemcategoryid();

        String updateQuery = "UPDATE item SET itemname='"+name+"',itemprice='"+price+"',itemstock ='"+stock+"', itemdesc='"+desc+"', itemcategoryid='"+itemcategoryid+"' WHERE itemid='"+itemid+"'";
        System.out.println(updateQuery);
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            int check = stmt.executeUpdate(updateQuery);
            
            if(check == 0)//unsuccessful update
            	item.setValid(true);
            else //successful update
            	item.setValid(false);
        }
        catch(SQLException e){
            e.printStackTrace();
        }

        return item;
    }
	
	public void deleteItemById(int id) {
        String deleteQuery = "delete from item where itemid="+id;

        System.out.println(deleteQuery);

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(deleteQuery);

            if(stmt !=null)
                System.out.println("Item id deleted: "+id);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	

	public Item getItemForUpdate(int id) {
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
//				item.setBlob(rs.getBlob("itemimage"));
				item.setPrice(rs.getDouble("itemprice"));
				item.setStock(rs.getInt("itemstock"));
				item.setItemcategoryid(rs.getString("categoryname"));
				item.setStaffid(rs.getInt("staffid"));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }

        return item;
    }
}
