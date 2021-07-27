package konichiwa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import konichiwa.connection.ConnectionManager;
import konichiwa.model.OrderList;
import konichiwa.model.Orders;
import konichiwa.model.Payment;

public class OrdersDAO {

	static Connection currentCon = null;
	static ResultSet rs = null;
	static PreparedStatement ps=null;
	static Statement stmt=null;
	
	static int orderID, paymentID, custID;
    static String DeliveryAddress, orderStatus;
	
    //aiman
	public List<Orders> getAllRiderOrder(String email) {
		List<Orders> listOrders = new ArrayList<Orders>();
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			 
			String q = "select orders.* from orders where riderid =( select riderid from rider where rider.rideremail = '" + email + "' )";
			System.out.println(q);
			ResultSet rs = stmt.executeQuery(q);
	      
			while (rs.next()) {
				Orders order = new Orders();
				
				order.setCustID(rs.getInt("riderID"));
				
				Date date = rs.getDate("orderDate");
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm aa"); 
				String orderdate = dateFormat.format(date);
				order.setOrderDate(orderdate);
								
				order.setOrderStatus(rs.getString("orderStatus"));
				order.setPaymentID(rs.getInt("paymentID"));
				order.setCustID(rs.getInt("custID"));
				order.setStaffID(rs.getInt("staffID"));
				order.setOrderID(rs.getInt("orderID"));
				order.setDeliveryAddress(rs.getString("DeliveryAddress"));
				
				listOrders.add(order);
			}
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
		if(listOrders.isEmpty()) {
			listOrders = null;
		}
		return listOrders;
	}
	
	public void updateStat(int statParam, int orderid) {
		 String searchQuery = "UPDATE orders SET orderstatus=" + statParam + " WHERE orderid=" + orderid + "";
		 System.out.println(searchQuery);
			try {
		
		        currentCon = ConnectionManager.getConnection();
		        stmt = currentCon.createStatement();
		        stmt.executeUpdate(searchQuery);
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
	}//aiman habis
	
	//sarah
	public static Orders getOrders(Orders orders) {
		orderID = orders.getOrderID();
		paymentID = orders.getPaymentID();
		custID = orders.getCustID();
		
		String query = "SELECT * FROM ORDERS WHERE orderID = '" + orderID + "'";
		
		 try {
	            currentCon = ConnectionManager.getConnection();
	            stmt = currentCon.createStatement();
	            rs = stmt.executeQuery(query);
	            boolean more = rs.next();
	            
	            System.out.println(query);

	            // if order exists set the isValid variable to true
	            if (more) {
	                orders.setValid(true);
	           	}
	           
	            else if (!more) {            	
	            	orders.setValid(false);
	            }
	           
	        }
		 
		 catch (Exception ex) {
	            System.out.println("Retrieving data from table ORDERS failed!" + ex);
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

	        return orders;
	}
	
	public void add(Orders orders) {
		DeliveryAddress = orders.getDeliveryAddress();
		custID = orders.getCustID();
		paymentID = orders.getPaymentID();
		
		System.out.println("adding orders");
		
		try {
			currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("INSERT INTO ORDERS (DeliveryAddress, custID, paymentID, orderStatus) values (?, ? ,?, ?)");
    		ps.setString(1, DeliveryAddress);
    		ps.setInt(2, custID);
    		ps.setInt(3, paymentID);
    		ps.setString(4, "1");
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
	
	public List<Orders> getAllOrders() {
		List<Orders> orders = new ArrayList<Orders>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select * from orders";
			ResultSet rs = stmt.executeQuery(q);
			
			while(rs.next()) {
				Orders order = new Orders();
				
				order.setOrderID(rs.getInt("orderID"));
				order.setDeliveryAddress(rs.getString("DeliveryAddress"));
				order.setOrderStatus(rs.getString("orderStatus"));
				Date date = rs.getDate("orderDate");
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm aa"); 
				String orderdate = dateFormat.format(date);
				order.setOrderDate(orderdate);
				orders.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return orders;
	}
	
	public Orders getOrderById(int orderID) {
		Orders orders = new Orders();
	    try {
	    	currentCon = ConnectionManager.getConnection();
	        ps=currentCon.prepareStatement("select * from orders where orderID=?");
	        
	        ps.setInt(1, orderID);
	        ResultSet rs = ps.executeQuery();
	        System.out.println("SUCCESSFUL");

	        if (rs.next()) {
	        	orders.setOrderID(rs.getInt("orderID"));
	        	orders.setDeliveryAddress(rs.getString("DeliveryAddress"));
	        	Date date = rs.getDate("orderDate");
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm aa"); 
				String orderdate = dateFormat.format(date);
				orders.setOrderDate(orderdate);
	        	orders.setOrderStatus(rs.getString("orderStatus"));
	        	
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return orders;
	}
	
	public void updateOrders(Orders orders) {
		
		orderID = orders.getOrderID();
		DeliveryAddress = orders.getDeliveryAddress();
		orderStatus = orders.getOrderStatus();

	    String searchQuery = "UPDATE orders SET DeliveryAddress ='" + DeliveryAddress  + "' WHERE orderID= '" + orderID + "'";
		
		try {
	
	        currentCon = ConnectionManager.getConnection();
	        stmt = currentCon.createStatement();
	        stmt.executeUpdate(searchQuery);
	        
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
	}
	
	public int getLatestOrderID() {
		int id = 0;
		
		try {
			currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
    		rs = stmt.executeQuery("SELECT MAX(ORDERID) as ORDERID FROM ORDERS");
    	
    		System.out.println("Your orderID is " + orderID);
    		
    		while(rs.next()) {
				id = rs.getInt("ORDERID");
				return id;
			}
		}
		catch(Exception e) {
			System.out.println("failed: An Exception has occurred! " + e);
		}
		finally {
			if (rs != null) {
    			try {
    				ps.close();
    			} catch (Exception e) {
    			}
    			rs = null;
    		}
    		
    		if (currentCon != null) {
    			try {
    				currentCon.close();
    			} catch (Exception e) {
    			}
    			currentCon = null;
    		}
    		
		}		
		return id;
	}
	
	public List<OrderList> getOrderByCustId(int custID) {
		Orders orders = new Orders();
		Payment payment = new Payment();
		List<OrderList> orderlist = new ArrayList<>();

		
		System.out.println("Passed getOrderByCustId");
	    try {
	    	currentCon = ConnectionManager.getConnection();
	        ps=currentCon.prepareStatement("SELECT PAYMENT.*, ORDERS.* FROM PAYMENT JOIN ORDERS ON PAYMENT.PAYMENTID = ORDERS.PAYMENTID WHERE ORDERS.CUSTID = ?");
	        
	        ps.setInt(1, custID);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	        	orders.setOrderID(rs.getInt("orderID"));
	        	orders.setDeliveryAddress(rs.getString("DeliveryAddress"));
	        	orders.setOrderStatus(rs.getString("orderStatus"));
	        	orders.setOrderDate(rs.getString("orderDate"));
	        	orders.setPaymentID(rs.getInt("paymentID"));
	        	orders.setStaffID(rs.getInt("staffID"));
	        	orders.setRiderID(rs.getInt("riderID"));
	        	
	        	payment.setPaymentID(rs.getInt("paymentID"));
	        	payment.setTotalPrice(rs.getDouble("totalPrice"));
	        	payment.setDeliveryFee(rs.getDouble("deliveryFee"));
	        	payment.setTransactionFee(rs.getDouble("transactionFee"));
	        	payment.setPaymentMethodID(rs.getInt("paymentMethodID"));
	        	
	        	System.out.println(rs.getInt("orderID"));
	        
	        	orderlist.add(new OrderList(orders, payment));
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return orderlist;
	}
	
	public List<Orders> getAllOrderz(int custid) {
		List<Orders> orderz = new ArrayList<Orders>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String query = "SELECT * FROM ORDERS WHERE CUSTID =" + custid;
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				Orders orders = new Orders();
				
				orders.setOrderID(rs.getInt("orderID"));
				Date date = rs.getDate("orderDate");
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm aa"); 
				String orderdate = dateFormat.format(date);
				orders.setOrderDate(orderdate);
				orders.setOrderStatus(rs.getString("orderStatus"));
				
				orderz.add(orders);
			}
		}
		
		catch(SQLException e) {
			e.printStackTrace();
		}
		return orderz;
	}
	
	//sarah habis

	public List<Orders> getAllNewOrder() {
		List<Orders> orders = new ArrayList<Orders>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select * from orders where orderstatus=1";
			ResultSet rs = stmt.executeQuery(q);
			
			while(rs.next()) {
				Orders order = new Orders();
				order.setCustID(rs.getInt("custid"));
				order.setOrderID(rs.getInt("orderID"));
				order.setDeliveryAddress(rs.getString("DeliveryAddress"));
				order.setOrderStatus(rs.getString("orderStatus"));
				Date date = rs.getDate("orderDate");
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm aa"); 
				String orderdate = dateFormat.format(date);
				order.setOrderDate(orderdate);
				orders.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return orders;
	}
	
	public List<Orders> getAllPrepareOrder() {
		List<Orders> orders = new ArrayList<Orders>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select * from orders where orderstatus=2";
			ResultSet rs = stmt.executeQuery(q);
			
			while(rs.next()) {
				Orders order = new Orders();
				
				order.setCustID(rs.getInt("custid"));
				order.setStaffID(rs.getInt("staffId"));
				order.setOrderID(rs.getInt("orderID"));
				order.setDeliveryAddress(rs.getString("DeliveryAddress"));
				order.setOrderStatus(rs.getString("orderStatus"));
				Date date = rs.getDate("orderDate");
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm aa"); 
				String orderdate = dateFormat.format(date);
				order.setOrderDate(orderdate);

				orders.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return orders;
	}
	
	public List<Orders> getAllTrackOrder() {
		List<Orders> orders = new ArrayList<Orders>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select * from orders where orderstatus=4 OR orderstatus=3"; //ready and delivering
			ResultSet rs = stmt.executeQuery(q);
			
			while(rs.next()) {
				Orders order = new Orders();
				
				order.setCustID(rs.getInt("custid"));
				order.setStaffID(rs.getInt("staffId"));
				order.setOrderID(rs.getInt("orderID"));
				order.setDeliveryAddress(rs.getString("DeliveryAddress"));
				order.setOrderStatus(rs.getString("orderStatus"));
				Date date = rs.getDate("orderDate");
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm aa"); 
				String orderdate = dateFormat.format(date);
				order.setOrderDate(orderdate);
				orders.add(order);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return orders;
	}
	
	public void updateAssign(int riderid, int orderid, int staffid) {
		 String searchQuery = "UPDATE orders SET orderstatus=2, riderID=" + riderid + ",staffid="+staffid+" WHERE orderid=" + orderid + "";
		 System.out.print(searchQuery);
			try {
		
		        currentCon = ConnectionManager.getConnection();
		        stmt = currentCon.createStatement();
		        stmt.executeUpdate(searchQuery);
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
	}
	
	//aiman habis
	
	public List<Orders> getAllOrderHistory() {
		List<Orders> orders = new ArrayList<Orders>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select * from orders where orderstatus=5";
			ResultSet rs = stmt.executeQuery(q);
			
			while(rs.next()) {
				Orders order = new Orders();
				order.setCustID(rs.getInt("custid"));
				order.setOrderID(rs.getInt("orderID"));
				order.setDeliveryAddress(rs.getString("DeliveryAddress"));
				order.setOrderStatus(rs.getString("orderStatus"));
				order.setRiderID(rs.getInt("riderID"));
				order.setStaffID(rs.getInt("staffID"));
				Date date = rs.getDate("orderDate");
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm aa"); 
				String orderdate = dateFormat.format(date);
				order.setOrderDate(orderdate);
				orders.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return orders;
	}
	
	//Aiman habis
}
