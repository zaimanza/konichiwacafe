package konichiwa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import konichiwa.connection.ConnectionManager;
import konichiwa.model.Payment;
import konichiwa.model.Orders;

public class PaymentDAO {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	
	static int paymentID, paymentMethodID;
	static double totalPrice, deliveryFee, transactionFee;
	static Orders orders;
	
	public static Payment getPayment(Payment payment) {
		paymentID = payment.getPaymentID();
		totalPrice = payment.getTotalPrice();
		deliveryFee = payment.getDeliveryFee();
		transactionFee = payment.getTransactionFee();
		paymentMethodID = payment.getPaymentMethodID();
		
		String query = "SELECT * PAYMENT WHERE paymentID = '" + paymentID + "'";
		
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

        return payment;
	}
	
	public void add(Payment payment) {
		totalPrice = payment.getTotalPrice();
		paymentMethodID = payment.getPaymentMethodID();
		
		try {
			currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("INSERT INTO PAYMENT (totalPrice, paymentMethodID, deliveryFee, transactionFee) values (?,?,5.00,1.20)");
    		ps.setDouble(1, totalPrice);
    		ps.setInt(2, paymentMethodID);
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
	
	public int getLatestID() {
		int id = 0;
		
		try {
			currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
    		rs = stmt.executeQuery("SELECT MAX(PAYMENTID) as PAYMENTID FROM PAYMENT");
    	
    		System.out.println("Your paymentID is " + paymentID);
    		
    		while(rs.next()) {
				id = rs.getInt("PAYMENTID");
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
	
	public Payment getPaymentByOrderID(int orderid) {
		Payment payment = new Payment();
		try {
			currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
    		rs = stmt.executeQuery("SELECT PAYMENT.*, PAYMENT_METHOD.PAYMENTMETHOD " + 
    				"FROM PAYMENT " + 
    				"INNER JOIN PAYMENT_METHOD ON PAYMENT.PAYMENTMETHODID = PAYMENT_METHOD.PAYMENTMETHODID " + 
    				"INNER JOIN ORDERS ON PAYMENT.PAYMENTID = ORDERS.PAYMENTID " + 
    				"WHERE ORDERID ="+orderid);
    
    		
    		while(rs.next()) {
    			payment.setPaymentID(rs.getInt("paymentid"));
    			payment.setDeliveryFee(rs.getDouble("deliveryfee"));
    			payment.setTransactionFee(rs.getDouble("transactionfee"));
    			payment.setPaymentMethodName(rs.getString("paymentmethod"));
    			payment.setTotalPrice(rs.getDouble("totalprice"));
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
		return payment;
	}
}
