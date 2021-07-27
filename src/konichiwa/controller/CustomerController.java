package konichiwa.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import konichiwa.dao.AddressDAO;
import konichiwa.dao.CustomerDAO;
//import konichiwa.model.Address;
import konichiwa.model.Customer;


@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String forward="";
	private CustomerDAO daoCustomer;
	
	//private AddressDAO daoAddress;
   
    public CustomerController() {
        super();
       daoCustomer = new CustomerDAO();
      
       //daoAddress = new AddressDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
						
		if(request.getParameter("i").equalsIgnoreCase("active")) {
			request.setAttribute("checked", "active");
			request.setAttribute("customerlist", daoCustomer.getAllCustomer(1));
            forward = "adminViewCustomer.jsp";
		}else if(request.getParameter("i").equalsIgnoreCase("inactive")) {
			request.setAttribute("checked", "inactive");
			request.setAttribute("customerlist", daoCustomer.getAllCustomer(2));
			forward = "adminViewCustomer.jsp";
		}else if(request.getParameter("i").equalsIgnoreCase("all")) {
			request.setAttribute("checked", "all");
			request.setAttribute("customerlist", daoCustomer.getAllCustomer(0));
			forward = "adminViewCustomer.jsp";
		}
		
		else {
			String action = request.getParameter("action");			
			int custid= Integer.parseInt(request.getParameter("i"));
	    	
	    	Customer customer = new Customer();
	    	customer = daoCustomer.getCustomerById(custid); 
			request.setAttribute("customer", customer);
			
			if(action.equalsIgnoreCase("viewCustomer")) {			
	    		forward = "profile.jsp"; 
			}
			else if(action.equalsIgnoreCase("home")) {
	    		forward = "home.jsp"; 
	        }
			else if(action.equalsIgnoreCase("updateProfile")) {
				forward = "updateProfile.jsp";
			}
			else if(action.equalsIgnoreCase("psw")) {
				forward = "changePassword.jsp";
			}
			else if (action.equalsIgnoreCase("logout")) {
				HttpSession session = request.getSession();  
	            session.invalidate(); 
	        	
				System.out.println("Successfully logout");
				forward = "index.jsp";
	        }
			//staff view customer's profile
			else if(action.equalsIgnoreCase("customerDetails")) {
				forward = "adminUpdateCustomer.jsp";
			}
		}	
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");		
		
		if(action.equalsIgnoreCase("addCustomer")) {
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			//String street = request.getParameter("addr1");
			//String city = request.getParameter("addr2");
			//String postcode = request.getParameter("addr3");
			//String state = request.getParameter("addr4");
			String psw = request.getParameter("psw");
	
			
			Customer customer = new Customer(fname,lname,email,phone,psw);
			//Address address = new Address(street,city,postcode,state);
			
			customer = daoCustomer.getCustomer(customer);
			
			if(!customer.isValid()) {
				daoCustomer.add(customer);
				//daoAddress.firstAddress(address);
				request.setAttribute("success", "Successfully signed up !! You may login now");
				forward = "login.jsp";
			}
			else
			{
				request.setAttribute("signuperror", "This email has been registered");
				forward = "signupcust.jsp";
			}
						
		}
		
		else if(action.equalsIgnoreCase("login")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			Customer customer = new Customer();
			customer.setEmail(email);
			customer.setPassword(password);
			
			customer= daoCustomer.validate(customer);
			
			if(customer.isValid()) {
				if(customer.getAvailability().equals("1")) {
					HttpSession session = request.getSession();
					session.setAttribute("custid",customer.getCustid());
							
					request.setAttribute("customer", customer);
					forward = "home.jsp";				
				}
				
				if(customer.getAvailability().equals("2")) {
					request.setAttribute("loginerror", "Your account has been deleted. Please contact our staff for recovery");
					forward = "login.jsp";
				}	
			}
			
			else {
				request.setAttribute("loginerror", "Invalid email / password");
				forward = "login.jsp";				
			}			
		}
		
		else if(action.equalsIgnoreCase("updateProfile")) {
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String phone = request.getParameter("phone");
			int custid = Integer.parseInt(request.getParameter("custid"));
			
			Customer customer = new Customer(custid,fname,lname,phone);
			
			customer.setFname(fname);
			customer.setLname(lname);
			customer.setPhone(phone);
			customer.setCustid(custid);
			
			customer = daoCustomer.updateProfile(customer);
			customer = daoCustomer.getCustomerById(custid);
			request.setAttribute("customer", customer);
			
			if(!customer.isValid()) {
				request.setAttribute("updated", "Successfully updated!");
				forward = "profile.jsp";	
			}
			else {
				request.setAttribute("outdated", "Failed to update!");
				forward = "updateProfile.jsp";
			}
		}
		
		else if(action.equalsIgnoreCase("changePassword")) {
			String newpass= request.getParameter("npsw");
			int custid = Integer.parseInt(request.getParameter("custid"));
			
			Customer customer = new Customer(custid,newpass);

			customer.setPassword(newpass);
			customer.setCustid(custid);
			
			customer = daoCustomer.updatePassword(customer);
			customer = daoCustomer.getCustomerById(custid);
			request.setAttribute("customer", customer);
			
			if(!customer.isValid()) {
				request.setAttribute("updated", "Successfully updated!");
				forward = "profile.jsp";	
			}
			else {
				request.setAttribute("outdated", "Failed to update!");
				forward = "changePassword.jsp";
			}
		}
		
		else if(action.equalsIgnoreCase("deleteProfile")) {
			int custid = Integer.parseInt(request.getParameter("custid"));
			daoCustomer.delete(custid);
			
			HttpSession session = request.getSession();  
            session.invalidate(); 
        	
			System.out.println("Successfully logout and delete account");
			forward = "index.jsp";			
		}
		
		//Staff update Customer's availability 
		else if(action.equalsIgnoreCase("updateAvailability")) {
			int custid = Integer.parseInt(request.getParameter("custid"));
			String avail = request.getParameter("avail");
			
			Customer cust = new Customer();
			cust = daoCustomer.getCustomerById(custid);
						
			if(avail.equalsIgnoreCase("1")) {
				cust = daoCustomer.toDeactivate(cust);
			}
			else if(avail.equalsIgnoreCase("2")) {
				cust = daoCustomer.toActivate(cust);
			}
			
			if(cust.isValid())
				request.setAttribute("updated", "Successfully updated!");
			if(!cust.isValid())
				request.setAttribute("outdated", "Failed to update!");
			
			request.setAttribute("customerlist", daoCustomer.getAllCustomer(0));
			forward = "adminViewCustomer.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
}


