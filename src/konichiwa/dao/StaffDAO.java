package konichiwa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import konichiwa.connection.ConnectionManager;
import konichiwa.model.Staff;

public class StaffDAO {

	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static int id,type;
	static String fname,lname,phone,email,password;

	public Staff getStaff(Staff staff) {
		email = staff.getStaffEmail();

        String searchQuery = "select * from staff where staffEmail='" + email + "'";

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean exist = rs.next();
            
            // if subject exists set the isValid variable to true
            if (exist) {
                staff.setValid(true);
           	}
           
            else if (!exist) {            	
            	staff.setValid(false);
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

        return staff;
	}
	
	public void add(Staff staff) {
			
	        fname = staff.getStaffFName();
	        lname = staff.getStaffLName();
	        phone = staff.getStaffPhone();
	        email = staff.getStaffEmail();
	        password = staff.getStaffPassword();
	        //type = staff.getStaffType();
	       
	    	try {
	    		currentCon = ConnectionManager.getConnection();
	    		ps=currentCon.prepareStatement("insert into staff (staffFName, staffLName, staffPhone, staffEmail, staffPassword)values(?,?,?,?,?)");
	    		ps.setString(1,fname);
	    		ps.setString(2,lname);
	    		ps.setString(3,phone);
	    		ps.setString(4,email);
	    		ps.setString(5,password);
	    		//ps.setInt(6, type);
	    		ps.executeUpdate(); 
	    		
	    		System.out.println("Registered email is "+email);
	    	}
	
	    	catch (Exception ex) {
	    		System.out.println("failed: An Exception has occurred! " + ex);
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

	public List<Staff> getAllStaff(){
		List<Staff> staffs = new ArrayList<Staff>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select * from staff";
		ResultSet rs = stmt.executeQuery(q);
		
		while(rs.next()) {
			Staff staff = new Staff();
			
			staff.setStaffId(rs.getInt("staffId"));
			staff.setStaffFName(rs.getString("staffFName"));
			staff.setStaffFName(rs.getString("staffFName"));
			staff.setStaffLName(rs.getString("staffLName"));
			staff.setStaffPhone(rs.getString("staffPhone"));
			staff.setStaffEmail(rs.getString("staffEmail"));
			staff.setStaffPassword(rs.getString("staffPassword"));
			staff.setStaffType(rs.getInt("staffPassword"));
				
				staffs.add(staff);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return staffs;
	}
	
	public List<Staff> getAllCashier(){
		List<Staff> staffs = new ArrayList<Staff>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select * from staff where stafftype=1 or stafftype=0";
			System.out.println(q);
			ResultSet rs = stmt.executeQuery(q);
		
		while(rs.next()) {
			Staff staff = new Staff();
			
			staff.setStaffId(rs.getInt("staffId"));
			staff.setStaffFName(rs.getString("staffFName"));
			staff.setStaffLName(rs.getString("staffLName"));
			staff.setStaffPhone(rs.getString("staffPhone"));
			staff.setStaffEmail(rs.getString("staffEmail"));
			staff.setStaffPassword(rs.getString("staffPassword"));
			staff.setStaffType(rs.getInt("staffType"));
			//staff.setVerifyStatus(rs.getInt("verifyStatus"));
				
				staffs.add(staff);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return staffs;
	}
	
	public void deleteStaff(String id) {
		String searchQuery = "delete from staff where staffid="+"'"+id+"'";
		
		System.out.println("searchQuery");
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeUpdate(searchQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void verifyStaff(String id) {
		String searchQuery = "UPDATE staff SET stafftype=1 WHERE staffId='"+id+"'";
		
		System.out.println("searchQuery");
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeUpdate(searchQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void unVerifyStaff(String id) {
		String searchQuery = "UPDATE staff SET stafftype=0 WHERE staffId='"+id+"'";
		
		System.out.println("searchQuery");
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeUpdate(searchQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Staff getStaffById(int id) {
		Staff staff = new Staff();
		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from staff where staffId=?");
			
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				staff.setStaffId(rs.getInt("staffId"));
				staff.setStaffFName(rs.getString("staffFName"));
				staff.setStaffLName(rs.getString("staffLName"));
				staff.setStaffPhone(rs.getString("staffPhone"));
				staff.setStaffEmail(rs.getString("staffEmail"));
				staff.setStaffPassword(rs.getString("staffPassword"));
				staff.setStaffType(rs.getInt("staffType"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return staff;
	}
	
	public Staff updateStaff(Staff staff) {
		id = staff.getStaffId();
		fname = staff.getStaffFName();
		lname = staff.getStaffLName();
		phone = staff.getStaffPhone();
		email = staff.getStaffEmail();
		password = staff.getStaffPassword();
		type = staff.getStaffType();
		
		String updateQuery = "UPDATE staff SET staffFName='"+fname+
				             "', staffLName='"+lname+
				             "', staffPhone='"+phone+
				             "', staffEmail='"+email+
				             "', staffPassword='"+password+
				              "', staffType='"+type+
				             "' WHERE staffId='"+id+"'";
		
		System.out.print(updateQuery);
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			int check = stmt.executeUpdate(updateQuery);
            
            if(check == 0)//unsuccessful update
            	staff.setValid(false);
            else //successful update
            	staff.setValid(true);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return staff;
	}
	
	public static Staff getStaffByEmail(String email)
	{
		Staff staff = new Staff();

		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from staff where STAFFEMAIL=?");
			
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				staff.setStaffId(rs.getInt("STAFFID"));
				staff.setStaffFName(rs.getString("STAFFFNAME"));
				staff.setStaffLName(rs.getString("STAFFLNAME"));
				staff.setStaffPhone(rs.getString("STAFFPHONE"));
				staff.setStaffEmail(rs.getString("STAFFEMAIL"));
				staff.setStaffPassword(rs.getString("STAFFPASSWORD"));
				staff.setStaffType(rs.getInt("STAFFTYPE"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return staff;
	}
	
	public Staff getStaffByID(int id)
	{
		Staff staff = new Staff();

		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from staff where STAFFID=?");
			
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				staff.setStaffId(rs.getInt("STAFFID"));
				staff.setStaffFName(rs.getString("STAFFFNAME"));
				staff.setStaffLName(rs.getString("STAFFLNAME"));
				staff.setStaffPhone(rs.getString("STAFFPHONE"));
				staff.setStaffEmail(rs.getString("STAFFEMAIL"));
				staff.setStaffPassword(rs.getString("STAFFPASSWORD"));
				staff.setStaffType(rs.getInt("STAFFTYPE"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return staff;
	}

}
