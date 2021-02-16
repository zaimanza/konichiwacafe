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

import konichiwa.dao.OrdersDAO;
import konichiwa.dao.RiderDAO;
import konichiwa.model.Orders;
import konichiwa.model.Rider;

/**
 * Servlet implementation class RiderController
 */
@WebServlet("/RiderController")
public class RiderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RiderDAO daoRider;
	private OrdersDAO daoOrders;
	private static String LIST_RIDER = "viewRiderList.jsp";
	private static String UPDATE_RIDER = "updateRider.jsp";
	private static String VIEW_RIDER = "viewRider.jsp";
	private static String UPDATE_AVAILABILITY = "updateAvailable.jsp";
	String forward="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RiderController() {
        super();
        daoRider = new RiderDAO();
        daoOrders = new OrdersDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("listRider")) {
			
			forward = LIST_RIDER;
			request.setAttribute("riders", daoRider.getAllRider());
		}
		
		else if (action.equalsIgnoreCase("deleteRider")) {
			String id = request.getParameter("id");
			
			daoRider.deleteRider(id);
			
			forward = LIST_RIDER;
			request.setAttribute("riders", daoRider.getAllRider());
		}
		
		else if (action.equalsIgnoreCase("updateRider")) {
			int id = Integer.parseInt(request.getParameter("id"));
        	
        	Rider rider = new Rider();
        	rider = daoRider.getRiderById(id);

	    	System.out.println("riderFname:");
	    	System.out.println(id);
        	forward = UPDATE_RIDER;
            request.setAttribute("rider", rider); 
		}
		
		else if (action.equalsIgnoreCase("updateAvailable")) {
			int id = Integer.parseInt(request.getParameter("id"));
        	
        	Rider rider = new Rider();
        	rider = daoRider.getRiderById(id);
        	        	
        	forward = UPDATE_AVAILABILITY;
            request.setAttribute("rider", rider); 
		}
		
		else if (action.equalsIgnoreCase("viewRider")) {
			String email = request.getParameter("email");

        	Rider rider = new Rider();
        	rider = daoRider.getRiderByEmail(email);     
        	forward = VIEW_RIDER;     

            request.setAttribute("rider", rider); 
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = null, lName = null, phone = null, email = null, pass = null, action = null;
		int stat = 0, available = 0, riderId = 0, staffId = 0;
		if(request.getParameter("fName") != null && request.getParameter("fName").replaceAll("\\s+","").length() != 0) {fName = request.getParameter("fName");}
		if(request.getParameter("lName") != null && request.getParameter("lName").replaceAll("\\s+","").length() != 0) {lName = request.getParameter("lName");}
		if(request.getParameter("phone") != null && request.getParameter("phone").replaceAll("\\s+","").length() != 0) {phone = request.getParameter("phone");}
		if(request.getParameter("email") != null && request.getParameter("email").replaceAll("\\s+","").length() != 0) {email = request.getParameter("email");}
		if(request.getParameter("pass") != null && request.getParameter("pass").replaceAll("\\s+","").length() != 0) {pass = request.getParameter("pass");}
		if(request.getParameter("stat") != null && request.getParameter("stat").replaceAll("\\s+","").length() != 0) {stat = Integer.parseInt(request.getParameter("stat"));}
		if(request.getParameter("available") != null && request.getParameter("available").replaceAll("\\s+","").length() != 0) {available = Integer.parseInt(request.getParameter("available"));}
		if(request.getParameter("riderId") != null && request.getParameter("riderId").replaceAll("\\s+","").length() != 0) {riderId = Integer.parseInt(request.getParameter("riderId"));}
//		if(request.getParameter("staffId") != null && request.getParameter("staffId").replaceAll("\\s+","").length() != 0) {staffId = Integer.parseInt(request.getParameter("staffId"));}
		
		if(stat != 0) {
			action = "verify";
		} else if(available != 0) {
			action = "updateAvailable";
		} else if(staffId != 0) {
			action = "assignRider";
		} else if(fName==null && lName==null && phone==null && email!=null && pass!=null) {
			action = "login";
		} else {
			action = "addORupdate";
		}
		System.out.println(action);
		Rider rider = new Rider(fName, lName, phone, email, pass, stat, available, riderId);				
		
		rider = RiderDAO.getRider(rider);
	
		if(action.equalsIgnoreCase("addORupdate")) {
			if(!rider.isValid()) {
				System.out.println("adding");
				daoRider.add(rider);
	        	
	        	response.sendRedirect("loginRider.jsp");
	        } else {
	        	System.out.println("rider already exist");
                
                if(riderId==0) {
                	response.sendRedirect("registerRider.jsp");
                }
                
                else {
                	System.out.println("tengah update");
                	System.out.println(rider.getAvailable());
                	daoRider.updateRider(rider);
                	rider = daoRider.getRiderById(rider.getRiderId());

                	request.setAttribute("rider", rider);
                	RequestDispatcher view = request.getRequestDispatcher("viewRider.jsp");
                	view.forward(request, response);
                }
	        }
		} else if(action.equalsIgnoreCase("login")) {
			if(!rider.isValid()) {
				System.out.println("Rider does not exist");
				request.setAttribute("wrongPass", "Incorrect Email or Password");
	        	
	        	RequestDispatcher view = request.getRequestDispatcher("loginRider.jsp");
	            view.forward(request, response);
	        } else {
	        	System.out.println("able to login");
	        	rider = daoRider.getRiderByEmail(rider.getEmail());
	        	System.out.println(rider.getStat());
	        	if( rider.getStat() == 1 || rider.getStat() == 0 ) {
	        		request.setAttribute("wrongPass", "Rider is not verified");
		        	
		        	RequestDispatcher poe = request.getRequestDispatcher("loginRider.jsp");
		        	poe.forward(request, response);
	        	} else {
	        		if(rider.getPass().equals(pass)) {
		        		System.out.println("You are logged in");
			        	request.setAttribute("email", rider.getEmail());
			        	
			        	List<Orders> listOrders = new ArrayList<Orders>();
						List<Orders> ordersReady = new ArrayList<Orders>();
						List<Orders> ordersPickedUp = new ArrayList<Orders>();
						
						
						System.out.println("dapatkan email");
						listOrders = daoOrders.getAllRiderOrder(rider.getEmail());
						System.out.println("try print");
						if(listOrders != null) {
							listOrders.forEach((order) -> {
								System.out.println(order.getOrderStatus());
								if(order.getOrderStatus().equals("3")) {
									ordersReady.add(order);
								} else if(order.getOrderStatus().equals("4")) {
									ordersPickedUp.add(order);
								}
							});
						}
						request.setAttribute("email",email);
						
						if(!ordersReady.isEmpty()) {
					        request.setAttribute("ordersReady", ordersReady);
						}
						if(!ordersPickedUp.isEmpty()) {
					        request.setAttribute("ordersPickedUp", ordersPickedUp);
						}
			        	
			        	
			        	RequestDispatcher view = request.getRequestDispatcher("homeRider.jsp");
			            view.forward(request, response);
		        	} else {
		        		System.out.println("Wrong password");
		        		request.setAttribute("wrongPass", "Incorrect Email or Password");
			        	
			        	RequestDispatcher poe = request.getRequestDispatcher("loginRider.jsp");
			        	poe.forward(request, response);
		        	}
	        	}
	        }
		} else if(action.equalsIgnoreCase("updateAvailable")) {
        	
        	System.out.println("update availability");
        	//System.out.println(rider.getRiderAvailability());
        	if(rider.isValid()) {
                System.out.println("updating");
                rider = daoRider.updateAvailability(rider);

                response.sendRedirect("RiderController?action=viewRider&email="+ rider.getEmail() + "");
            }
        }
	}
}
