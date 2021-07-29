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

	    	System.out.println("to update Rider ID :"+id);
        	forward = "../ActorRider/riderUpdateProfile.jsp";
            request.setAttribute("rider", rider); 
		}
		
		else if (action.equalsIgnoreCase("updateAvailable")) {
			int id = Integer.parseInt(request.getParameter("id"));
        	
        	Rider rider = new Rider();
        	rider = daoRider.getRiderById(id);
        	        	
        	forward = "../ActorRider/riderUpdateAvailable.jsp";
            request.setAttribute("rider", rider); 
		}
		
		else if (action.equalsIgnoreCase("viewRider")) {
			String email = request.getParameter("email");

        	Rider rider = new Rider();
        	rider = daoRider.getRiderByEmail(email);     
        	forward = "../ActorRider/riderProfile.jsp";     

            request.setAttribute("rider", rider); 
		}
		
		//staff
		else if (action.equalsIgnoreCase("cashierViewAvailableRiders")) {
			forward = "../ActorCashier/cashierAvailableRider.jsp";
			request.setAttribute("riders", daoRider.getAvailableRider());
			request.setAttribute("orderid", request.getParameter("orderid"));
		}
		
		else if (action.equalsIgnoreCase("adminViewAvailableRiders")) {
			forward = "../ActorAdmin/adminAvailableRider.jsp";
			request.setAttribute("riders", daoRider.getAvailableRider());
			request.setAttribute("orderid", request.getParameter("orderid"));
		}
		
		else if(action.equalsIgnoreCase("adminViewAllRider")) {
			request.setAttribute("riderlist", daoRider.getAllRider());
            forward = "../ActorAdmin/adminViewRider.jsp";
		}
		
		else if (action.equalsIgnoreCase("adminDeleteRider")) {			
			String id = request.getParameter("id");		 
			daoRider.deleteRider(id);
		
			request.setAttribute("deleted", "Successfully deleted!");
			request.setAttribute("riderlist", daoRider.getAllRider());
            forward = "../ActorAdmin/adminViewRider.jsp";
		}
		
		else if (action.equalsIgnoreCase("adminVerifyRider")) {			
			int id = Integer.parseInt(request.getParameter("id"));		 
			daoRider.verifyRider(id);
		
			request.setAttribute("riderlist", daoRider.getAllRider());
            forward = "../ActorAdmin/adminViewRider.jsp";
		}
		
		else if (action.equalsIgnoreCase("adminUnVerifyRider")) {			
			int id = Integer.parseInt(request.getParameter("id"));		 
			daoRider.unVerifyRider(id);
		
			request.setAttribute("riderlist", daoRider.getAllRider());
            forward = "../ActorAdmin/adminViewRider.jsp";
		}
		
		else if (action.equalsIgnoreCase("adminUpdateRider")) {
			int id = Integer.parseInt(request.getParameter("id"));
        	
        	Rider rider = new Rider();
        	rider = daoRider.getRiderById(id);
        	
        	forward = "../ActorAdmin/adminUpdateRider.jsp";
            request.setAttribute("rider", rider); 
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = null, lName = null, phone = null, email = null, pass = null;
		int stat = 0, available = 0, riderId = 0;
		if(request.getParameter("fName") != null && request.getParameter("fName").replaceAll("\\s+","").length() != 0) {fName = request.getParameter("fName");}
		if(request.getParameter("lName") != null && request.getParameter("lName").replaceAll("\\s+","").length() != 0) {lName = request.getParameter("lName");}
		if(request.getParameter("phone") != null && request.getParameter("phone").replaceAll("\\s+","").length() != 0) {phone = request.getParameter("phone");}
		if(request.getParameter("email") != null && request.getParameter("email").replaceAll("\\s+","").length() != 0) {email = request.getParameter("email");}
		System.out.println("doPost hantar email : " +email);
		if(request.getParameter("pass") != null && request.getParameter("pass").replaceAll("\\s+","").length() != 0) {pass = request.getParameter("pass");}
		if(request.getParameter("stat") != null && request.getParameter("stat").replaceAll("\\s+","").length() != 0) {stat = Integer.parseInt(request.getParameter("stat"));}
		if(request.getParameter("available") != null && request.getParameter("available").replaceAll("\\s+","").length() != 0) {available = Integer.parseInt(request.getParameter("available"));}
		if(request.getParameter("riderId") != null && request.getParameter("riderId").replaceAll("\\s+","").length() != 0) {riderId = Integer.parseInt(request.getParameter("riderId"));}

		Rider rider = new Rider(fName, lName, phone, email, pass, stat, available, riderId);				
		
		rider = RiderDAO.getRider(rider);
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("adminUpdatingRider")) {
			rider = daoRider.updateRider(rider);
			
			if(rider.isValid())            	
            	request.setAttribute("updated", "Rider successfully updated!");
     
			if(!rider.isValid())
				request.setAttribute("outdated", "Rider failed to update!");
			
           	request.setAttribute("riderlist", daoRider.getAllRider());
        	forward = "../ActorAdmin/adminViewRider.jsp";
		}
		
		else if(action.equalsIgnoreCase("addORupdate")) {
			if(!rider.isValid()) {
				System.out.println("adding");
				daoRider.add(rider);
	        	
	        	forward ="../ActorRider/loginRider.jsp";
	        } else {
	        	System.out.println("rider already exist");
	        	
                if(riderId==0) {
					request.setAttribute("wrongPass", "This email has been registered");														
                	forward ="../ActorRider/registerRider.jsp";
                	
                }
                
                else {
                	System.out.println("tengah update");
                	System.out.println("Rider availability: "+rider.getAvailable());//kat sini kenapa selalu 0
                	daoRider.updateRider(rider);
                	rider = daoRider.getRiderById(rider.getRiderId());

                	request.setAttribute("rider", rider);
                	forward = "../ActorRider/riderProfile.jsp";
                }
	        }
		} 
		
		else if(action.equalsIgnoreCase("login")) {
			if(!rider.isValid()) {
				System.out.println("Rider does not exist");
				request.setAttribute("wrongPass", "Unregistered Rider");
				forward = "../ActorRider/loginRider.jsp";
	        } else {
	        	System.out.println("Rider able to login");
	        	rider = daoRider.getRiderByEmail(rider.getEmail());
	        	System.out.println("Rider status: "+rider.getStat());
	        	if( rider.getStat() == 1 || rider.getStat() == 0 ) {
	        		request.setAttribute("wrongPass", "Rider is not verified");
		        	forward = "../ActorRider/loginRider.jsp";
	        	} else {
	        		if(rider.getPass().equals(pass)) {
		        		System.out.println("Rider successfully logged in");
			        	request.setAttribute("email", rider.getEmail());
			        	
			        	List<Orders> listOrders = new ArrayList<Orders>();
						List<Orders> ordersReady = new ArrayList<Orders>();
						List<Orders> ordersPickedUp = new ArrayList<Orders>();
						
						listOrders = daoOrders.getAllRiderOrder(rider.getEmail());
						
						if(listOrders != null) {
							listOrders.forEach((order) -> {
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
			        	
			        	forward = "../ActorRider/riderHome.jsp";
		        	} else {
		        		System.out.println("Wrong password");
		        		request.setAttribute("wrongPass", "Incorrect Email or Password");
			        	forward = "../ActorRider/loginRider.jsp";
		        	}
	        	}
	        }
		} 
		
		else if(action.equalsIgnoreCase("updateAvailable")) {
        	
        	System.out.println("update availability");
        	if(rider.isValid()) {
                System.out.println("updating");
                rider = daoRider.updateAvailability(rider);
                
            	rider = daoRider.getRiderByEmail(rider.getEmail());     
            	forward = "../ActorRider/riderProfile.jsp";     

                request.setAttribute("rider", rider); 
            }
        }
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
    	view.forward(request, response);		
	}
}
