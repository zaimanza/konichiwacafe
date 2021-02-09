package konichiwa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import konichiwa.connection.ConnectionManager;
import konichiwa.model.Customer;

public class CustomerDAO {

	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String fname, lname, email,phone,psw;
	static int custid;
	
	public Customer validate(Customer customer) {
		email = customer.getEmail();
		psw = customer.getPassword();
		
		String loginQuery = "select * from customer where custemail='"+email+"'and custpassword='"+psw+"'";
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(loginQuery);
			boolean more = rs.next();
			
			System.out.println(loginQuery);
			
			if(more) {
				customer.setValid(true);
				customer.setCustid(rs.getInt("custid"));
				customer.setFname(rs.getString("custfname"));
				customer.setLname(rs.getString("custlname"));
				customer.setPhone(rs.getString("custphone"));
			}
			
			else if(!more) {
				customer.setValid(false);
			}
			
		}
		
		catch(Exception e){
			System.out.println("Log in failed: An Exception has occured!"+e);
			
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
		
		return customer;
	}
	
	public Customer updateProfile(Customer customer) {
		fname = customer.getFname();
		lname = customer.getLname();
		phone = customer.getPhone();
		custid = customer.getCustid();
		
		String updateQuery = "UPDATE customer SET custfname='"+fname+"', custlname='"+lname+"',custphone='"+phone+"' WHERE custid='"+custid+"'";
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeUpdate(updateQuery);
			
			if(stmt !=null) {
				System.out.println("First name: " + fname);
				System.out.println("Last name: " + lname);
				System.out.println("Phone No.: " + phone);
				System.out.println("Cust id: " + custid);
				
				customer.setValid(true);
				customer.setFname(fname);
				customer.setLname(lname);
				customer.setPhone(phone);
				customer.setCustid(custid);
			}
			else
				customer.setValid(false);	
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
		return customer;
	}
	
	public Customer updatePassword(Customer customer) {
		psw = customer.getPassword();
		custid = customer.getCustid();
		
		String updateQuery = "UPDATE customer SET custpassword='"+psw+"'WHERE custid='"+custid+"'";
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeUpdate(updateQuery);
			
			if(stmt !=null) {
				System.out.println("New Password: " + psw);
				System.out.println("Cust id: " + custid);
				
				customer.setValid(true);
				customer.setPassword(psw);
				customer.setCustid(custid);
			}
			else
				customer.setValid(false);	
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return customer;
	}
	
	public Customer getCustomerById(int id) {
		Customer customer = new Customer();
		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from customer where custid=?");

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				customer.setCustid(rs.getInt("custid"));
				customer.setFname(rs.getString("custfname"));
				customer.setLname(rs.getString("custlname"));
				customer.setPhone(rs.getString("custphone"));
				customer.setEmail(rs.getString("custemail"));
				customer.setPassword(rs.getString("custpassword"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return customer;
	}
	
	public Customer getCustomer(Customer customer) {
		email = customer.getEmail();
		
		String searchQuery = "select * from customer where custemail='"+email+"'";
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();
			
			System.out.println(searchQuery);
			
			if(more) {
				customer.setValid(true);
			}
			
			else if(!more) {
				customer.setValid(false);
			}
			
		}
		
		catch(Exception e){
			System.out.println("Sign up failed: An Exception has occured!"+e);
			
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
		
		return customer;
	}
	
	public void add(Customer customer) {
		fname = customer.getFname();
		lname = customer.getLname();
		email = customer.getEmail();
		phone = customer.getPhone();
		psw = customer.getPassword();
		
		try {
			currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into customer (custfname, custlname, custemail, custphone, custpassword)values(?,?,?,?,?)");
    		ps.setString(1,fname);
    		ps.setString(2,lname);
    		ps.setString(3,email);
    		ps.setString(4,phone);
    		ps.setString(5,psw);
    		ps.executeUpdate();
    		   	
    		System.out.println("First name is " + fname);
			System.out.println("Last name is " + lname);
    		System.out.println("Email is " + email);
    		System.out.println("Phone is " + phone);
    		System.out.println("Password is " + psw);
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
	
	public void delete(int id) {
		String deleteQuery = "delete from customer where custid="+id;		
		
		System.out.println(deleteQuery);
		
		try {
	        currentCon = ConnectionManager.getConnection();
	        stmt = currentCon.createStatement();
	        stmt.executeUpdate(deleteQuery);
	        
	        if(stmt !=null)
				System.out.println("Customer id deleted: "+id);
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public List<Customer> getAllCustomer(){
		List<Customer> customers = new ArrayList<Customer>();
		
		try {
			currentCon = ConnectionManager.getConnection();
		  	stmt = currentCon.createStatement();
		  
		  	  String q = "select * from customer";
		      ResultSet rs = stmt.executeQuery(q);
		      
		      while(rs.next()) {
		    	  Customer customer = new Customer();
		    	  
		    	  customer.setFname(rs.getString("custfname"));
		    	  customer.setLname(rs.getString("custlname"));
		    	  customer.setEmail(rs.getString("custemail"));
		    	  customer.setPhone(rs.getString("custphone"));
		    	  customer.setPassword(rs.getString("custpassword"));
		      }
		}
		
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return customers;
	}

}
