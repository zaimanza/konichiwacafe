package konichiwa.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import konichiwa.dao.AddressDAO;
import konichiwa.dao.CustomerDAO;
import konichiwa.model.Address;
import konichiwa.model.Customer;

/**
 * Servlet implementation class AddressController
 */
@WebServlet("/AddressController")
public class AddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String forward="";
	private CustomerDAO daoCustomer;
	private AddressDAO daoAddress;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressController() {
        super();
        daoCustomer = new CustomerDAO();
        daoAddress = new AddressDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		int id= Integer.parseInt(request.getParameter("i"));
		
		Customer customer = new Customer();
    	customer = daoCustomer.getCustomerById(id);
    	
    	if(action.equalsIgnoreCase("addAddress")) {	
    		forward = "newAddress.jsp";
		}
    	
    	if(action.equalsIgnoreCase("viewAddress")) {
        	List<Address> addresses = new ArrayList<Address>();
        	addresses = daoAddress.getAllAddress(id);
        	customer.setCustomerAddress(addresses);        	
    		
    		forward = "customerAddress.jsp";
    		request.setAttribute("cust",customer.getCustomerAddresses());    		
		}	
		
		if(action.equalsIgnoreCase("edit")) {
			int aid= Integer.parseInt(request.getParameter("a"));
			Address address = new Address();
			address = daoAddress.getAddressById(aid,id);

			request.setAttribute("address", address);   		
    		forward = "updateAddress.jsp";		    		    		
		}
		
		if(action.equalsIgnoreCase("delete")) {
			int aid= Integer.parseInt(request.getParameter("a"));
			daoAddress.deleteAddressById(aid);
			    		
    		List<Address> addresses = new ArrayList<Address>();
        	addresses = daoAddress.getAllAddress(customer.getCustid());
        	customer.setCustomerAddress(addresses);	        	
    		
    		forward = "customerAddress.jsp";
    		request.setAttribute("cust",customer.getCustomerAddresses());		    		    		
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String street = request.getParameter("addr1");
		String city = request.getParameter("addr2");
		String postcode = request.getParameter("addr3");
		String state = request.getParameter("addr4");
		int custid = Integer.parseInt(request.getParameter("custid"));
		
		Customer customer = new Customer();
		
		if(action.equalsIgnoreCase("new")) {
			
			Address address = new Address(street,city,postcode,state,custid);
			
			daoAddress.add(address);   		
			
			if(address.isValid()) {
				List<Address> addresses = new ArrayList<Address>();
	        	addresses = daoAddress.getAllAddress(custid);
	        	customer.setCustomerAddress(addresses);	        	
	    		
	    		forward = "customerAddress.jsp";
	    		request.setAttribute("cust",customer.getCustomerAddresses());
		
			}
			else {
	    		forward = "profile.jsp";
			}
				
		}
		
		if(action.equalsIgnoreCase("updateAddress")) {
			int aid = Integer.parseInt(request.getParameter("addressid"));		
			Address address = new Address(aid,street,city,postcode,state);
			
			address.setAddressid(aid);
			address.setAddressstreet(street);
			address.setAddresscity(city);
			address.setAddresspostcode(postcode);
			address.setAddressstate(state);
			
			address = daoAddress.update(address);
			
			if(address.isValid()) {
				List<Address> addresses = new ArrayList<Address>();
	        	addresses = daoAddress.getAllAddress(custid);
	        	customer.setCustomerAddress(addresses);	        	
	    		
	    		forward = "customerAddress.jsp";
	    		request.setAttribute("cust",customer.getCustomerAddresses());
		
			}
			else {
	    		forward = "updateAddress.jsp";
			}
				
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

}
