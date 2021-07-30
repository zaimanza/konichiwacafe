package konichiwa.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import konichiwa.connection.ConnectionManager;
import konichiwa.model.Rider;

public class RiderDAO {
	
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String fName, lName, phone, email, pass;
	static int id, availability, rid;

	public static Rider getRider(Rider rider) {
		email = rider.getEmail();
        id = rider.getRiderId();

        String searchQuery = "select * from RIDER where rideremail='" + email + "' OR riderid='"+id+"'";

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();
            
            System.out.println(searchQuery);

            // if rider exists set the isValid variable to true
            if (more) {
            	rider.setValid(true);
           	} else if (!more) {            	
           		rider.setValid(false);
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
        return rider;
	}
	
	public String getRiderEmailById(int orderID) {
		String riderEmail = null;
		
		String searchQuery = "select rideremail from rider where riderid = (select riderid from orders where orders.orderid ="+orderID+")";
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            
            System.out.println(searchQuery);
            while (rs.next()) {
                riderEmail = rs.getString("rideremail");
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
		return riderEmail;
	}
	
	public void add(Rider subject) {
		fName = subject.getFName();
		lName = subject.getLName();
        phone = subject.getPhone();
        email = subject.getEmail();
        pass = subject.getPass();
       
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into RIDER (RIDEREMAIL, RIDERFNAME, RIDERLNAME, RIDERPHONE, RIDERPASS)values(?,?,?,?,?)");
    		ps.setString(1,email);
    		ps.setString(2,fName);
    		ps.setString(3,lName);
    		ps.setString(4,phone);
    		ps.setString(5,pass);
    		ps.executeUpdate();
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
	
	public List<Rider> getAllRider() {
		List<Rider> riders = new ArrayList<Rider>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select * from rider";
			ResultSet rs = stmt.executeQuery(q);
			
			while(rs.next()) {
				Rider rider = new Rider();
				
				rider.setRiderId(rs.getInt("RIDERID"));
				rider.setFName(rs.getString("RIDERFNAME"));
				rider.setLName(rs.getString("RIDERLNAME"));
				rider.setPhone(rs.getString("RIDERPHONE"));
				rider.setEmail(rs.getString("RIDEREMAIL"));
				rider.setPass(rs.getString("RIDERPASS"));
				rider.setStat(rs.getInt("RIDERVERSTAT"));
				rider.setAvailable(rs.getInt("RIDERAVAILABLE"));
//				rider.setStaffId(rs.getInt("staffId"));
				riders.add(rider);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return riders;
	}
	
	//staff
	public List<Rider> getAvailableRider() {
		List<Rider> riders = new ArrayList<Rider>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			String q = "select * from rider";
			ResultSet rs = stmt.executeQuery(q);
			
			while(rs.next()) {
				Rider rider = new Rider();
				
				rider.setRiderId(rs.getInt("RIDERID"));
				rider.setFName(rs.getString("RIDERFNAME"));
				rider.setLName(rs.getString("RIDERLNAME"));
				rider.setPhone(rs.getString("RIDERPHONE"));
				rider.setEmail(rs.getString("RIDEREMAIL"));
				rider.setPass(rs.getString("RIDERPASS"));
				rider.setStat(rs.getInt("RIDERVERSTAT"));
				rider.setAvailable(rs.getInt("RIDERAVAILABLE"));
//				rider.setStaffId(rs.getInt("staffId"));
				if(rider.getAvailable()== 2 && rider.getStat()==2) { //mungkin kena tukar
					riders.add(rider);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return riders;
	}
	
	public void deleteRider(String id) {
		String searchQuery = "delete from rider where riderId="+"'"+id+"'";
		
		System.out.println(searchQuery);
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeUpdate(searchQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Rider getRiderById(int id) {
		Rider rider = new Rider();
		
		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from rider where riderId=?");
			
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				rider.setRiderId(rs.getInt("RIDERID"));
				rider.setFName(rs.getString("RIDERFNAME"));
				rider.setLName(rs.getString("RIDERLNAME"));
				rider.setPhone(rs.getString("RIDERPHONE"));
				rider.setEmail(rs.getString("RIDEREMAIL"));
				rider.setPass(rs.getString("RIDERPASS"));
				rider.setStat(rs.getInt("RIDERVERSTAT"));
				rider.setAvailable(rs.getInt("RIDERAVAILABLE"));
//				rider.setStaffId(rs.getInt("staffId"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return rider;
	}
	
	public Rider getRiderByEmail(String email) {
		Rider rider = new Rider();

		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from rider where RIDEREMAIL=?");
			
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				rider.setRiderId(rs.getInt("RIDERID"));
				rider.setFName(rs.getString("RIDERFNAME"));
				rider.setLName(rs.getString("RIDERLNAME"));
				rider.setPhone(rs.getString("RIDERPHONE"));
				rider.setEmail(rs.getString("RIDEREMAIL"));
				rider.setPass(rs.getString("RIDERPASS"));
				rider.setStat(rs.getInt("RIDERVERSTAT"));
				rider.setAvailable(rs.getInt("RIDERAVAILABLE"));
//				rider.setStaffId(rs.getInt("staffId"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return rider;
	}
	
	public Rider updateRider(Rider rider) {
		rid = rider.getRiderId();
		fName = rider.getFName();
		lName = rider.getLName();
		phone = rider.getPhone();
		email = rider.getEmail();
		pass = rider.getPass();
		
		String updateQuery = "UPDATE rider SET RIDERFNAME='" + fName +
							 "', RIDERLNAME='" + lName +
							 "', RIDERPHONE='" + phone +
							 "', RIDEREMAIL='" + email +
							 "', RIDERPASS='" + pass +
							 "' WHERE RIDERID='" + rid + "'";
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeQuery(updateQuery);
			int check = stmt.executeUpdate(updateQuery);
            
            if(check == 0)//unsuccessful update
            	rider.setValid(false);
            else //successful update
            	rider.setValid(true);
			
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rider;
	}
	
	public Rider updateAvailability(Rider rider) {
		rid = rider.getRiderId();
		availability = rider.getAvailable();
		
		System.out.println("update availability");
		System.out.println(rider.getAvailable());
		
		String searchQuery = "UPDATE rider SET RIDERAVAILABLE=" + availability + " WHERE riderId=" + rid + "";
			
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeQuery(searchQuery);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rider;
	}
	
	public void verifyRider(int id) {
		String searchQuery = "UPDATE rider SET RIDERVERSTAT=2 WHERE RIDERID='"+id+"'";

		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeQuery(searchQuery);
			System.out.println(searchQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void unVerifyRider(int id) {
		String searchQuery = "UPDATE rider SET RIDERVERSTAT=1 WHERE RIDERID='"+id+"'";

		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			stmt.executeQuery(searchQuery);
			System.out.println(searchQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
