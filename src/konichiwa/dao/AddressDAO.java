package konichiwa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import konichiwa.connection.ConnectionManager;
import konichiwa.model.Address;

public class AddressDAO {

	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String street, city, postcode,state;
	static int custid,addressid;
	static CustomerDAO daoCustomer;

	public void firstAddress(Address address) {
		street = address.getAddressstreet();
		city= address.getAddresscity();
		postcode = address.getAddresspostcode();
		state = address.getAddressstate();

		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("INSERT INTO ADDRESS(addressstreet,addresscity,addresspostcode,addressstate,custid) VALUES(?,?,?,?,(SELECT MAX(custid) FROM CUSTOMER))");
			ps.setString(1,street);
			ps.setString(2,city);
			ps.setString(3,postcode);
			ps.setString(4,state);
			ps.executeUpdate();

			System.out.println("Street is " + street);
			System.out.println("City is " + city);
			System.out.println("Postcode is " + postcode);
			System.out.println("State is " + state);
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
	
	public void add(Address address) {
		street = address.getAddressstreet();
		city= address.getAddresscity();
		postcode = address.getAddresspostcode();
		state = address.getAddressstate();
		custid = address.getCustid();

		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("INSERT INTO ADDRESS(addressstreet,addresscity,addresspostcode,addressstate,custid) VALUES(?,?,?,?,?)");
			ps.setString(1,street);
			ps.setString(2,city);
			ps.setString(3,postcode);
			ps.setString(4,state);
			ps.setInt(5, custid);
			int x = ps.executeUpdate();
			
			
			
			if(x == 1) {
				System.out.println("Street is " + street);
				System.out.println("City is " + city);
				System.out.println("Postcode is " + postcode);
				System.out.println("State is " + state);
				System.out.println("Cust id is " + custid);
				
				address.setValid(true);
			}
			else
				address.setValid(false);			
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
	
	public Address update(Address address) {
		street = address.getAddressstreet();
		city= address.getAddresscity();
		postcode = address.getAddresspostcode();
		state = address.getAddressstate();
		addressid = address.getAddressid();

		String updateQuery = "UPDATE address SET addressstreet='"+street+"',addresscity='"+city+"',addresspostcode='"+postcode+"',addressstate='"+state+"' WHERE addressid="+addressid;
		System.out.println(updateQuery);
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			stmt.executeUpdate(updateQuery);	
			
			
			if(stmt !=null) {
				System.out.println("Street is " + street);
				System.out.println("City is " + city);
				System.out.println("Postcode is " + postcode);
				System.out.println("State is " + state);
				System.out.println("Address id is " + addressid);
				
				address.setValid(true);
				address.setAddressid(addressid);
				address.setAddressstreet(street);
				address.setAddresscity(city);
				address.setAddresspostcode(postcode);
				address.setAddressstate(state);
			}
			else
				address.setValid(false);			
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
		return address;
	}
	
	public void deleteAddressById(int aid) {
		String deleteQuery = "delete from address where addressid="+aid;
		
		System.out.println(deleteQuery);
		
		try {
	        currentCon = ConnectionManager.getConnection();
	        stmt = currentCon.createStatement();
	        stmt.executeUpdate(deleteQuery);
	        
	        if(stmt !=null)
				System.out.println("Address id deleted: "+aid);
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public Address getAddressById(int aid, int id) {
		Address address = new Address();		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			String q = "select * from address where custid="+id+" and addressid="+aid;

			System.out.println(q);
			
			ResultSet rs = stmt.executeQuery(q);
			
			if(rs.next()) {
				address.setAddressid(rs.getInt("addressid"));
				address.setAddressstreet(rs.getString("addressstreet"));
				address.setAddresscity(rs.getString("addresscity"));
				address.setAddresspostcode(rs.getString("addresspostcode"));
				address.setAddressstate(rs.getString("addressstate"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return address;
	}

	public List<Address> getAllAddress(int id){
		List<Address> addresses = new ArrayList<Address>();	
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
						
			String q = "select * from address where custid="+id;
			System.out.println(q);
			ResultSet rs = stmt.executeQuery(q);		
			
			while(rs.next()) {
				Address address = new Address();		
				
				address.setAddressstreet(rs.getString("addressstreet"));
				address.setAddresscity(rs.getString("addresscity"));
				address.setAddresspostcode(rs.getString("addresspostcode"));
				address.setAddressstate(rs.getString("addressstate"));
				address.setAddressid(rs.getInt("addressid"));
			
				addresses.add(address);
			}
			
		}

		catch(SQLException e) {
			e.printStackTrace();
		}
		return addresses;
	}
}
