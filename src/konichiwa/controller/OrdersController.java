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
import javax.servlet.http.HttpSession;

import konichiwa.dao.AddressDAO;
import konichiwa.dao.CustomerDAO;
import konichiwa.dao.ItemDAO;
import konichiwa.dao.Order_DetailsDAO;
import konichiwa.dao.OrdersDAO;
import konichiwa.dao.PaymentDAO;
import konichiwa.dao.RiderDAO;
import konichiwa.model.Address;
import konichiwa.model.Customer;
import konichiwa.model.Item;
import konichiwa.model.OrderList;
import konichiwa.model.Order_Details;
import konichiwa.model.Orders;
import konichiwa.model.Payment;
import konichiwa.model.Rider;
/**
 * Servlet implementation class OrdersController
 */
@WebServlet("/OrdersController")
public class OrdersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ArrayList<Integer> cartlist = new ArrayList<>();
	static ArrayList<Integer> itemQty = new ArrayList<>();
	static List<OrderList> orderlist;
    
	private CustomerDAO daoCustomer;
	private AddressDAO daoAddress;
	private OrdersDAO daoOrders;
	private OrdersDAO daoOrder;
	private PaymentDAO daoPayment;
	private ItemDAO daoItem;
	private Order_DetailsDAO daoOrder_Details;
	private RiderDAO daoRider;
	String forward="";  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersController() {
        super();
        daoOrders = new OrdersDAO();
        daoOrder = new OrdersDAO();
        daoRider = new RiderDAO();
        daoAddress = new AddressDAO();
        daoPayment = new PaymentDAO();
        daoItem = new ItemDAO();
        daoOrder_Details = new Order_DetailsDAO();
        daoCustomer = new CustomerDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession cartsession = request.getSession();
		//aiman
		if (action.equalsIgnoreCase("viewRiderOrders")) {
			
			List<Orders> listOrders = new ArrayList<Orders>();
			List<Orders> ordersReady = new ArrayList<Orders>();
			List<Orders> ordersPickedUp = new ArrayList<Orders>();
			
			String email = request.getParameter("email");
			
			System.out.println("dapatkan email");
			listOrders = daoOrder.getAllRiderOrder(email);
			System.out.println("List out orders status for this rider");
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
			forward = "riderHome.jsp";	
			if(!ordersReady.isEmpty()) {
		        request.setAttribute("ordersReady", ordersReady);
			}
			if(!ordersPickedUp.isEmpty()) {
		        request.setAttribute("ordersPickedUp", ordersPickedUp);
			}
		} else if(action.equalsIgnoreCase("pickupOrder")) {
			System.out.print("pickuping");
			
			int orderid = Integer.parseInt(request.getParameter("orderid"));
			
			daoOrder.updateStat(4,orderid);
			List<Orders> listOrders = new ArrayList<Orders>();
			List<Orders> ordersReady = new ArrayList<Orders>();
			List<Orders> ordersPickedUp = new ArrayList<Orders>();
			
			String email = daoRider.getRiderEmailById(orderid);
			System.out.println(email);
			System.out.println("pickuping");
			listOrders = daoOrder.getAllRiderOrder(email);
			if(listOrders != null) {
				listOrders.forEach((order) -> {
					if(order.getOrderStatus().equals("3")) {
						ordersReady.add(order);
					} else if(order.getOrderStatus().equals("4")) {
						ordersPickedUp.add(order);
					}
				});
			}
			forward = "riderHome.jsp";	
			if(!ordersReady.isEmpty()) {
		        request.setAttribute("ordersReady", ordersReady);
			}
			if(!ordersPickedUp.isEmpty()) {
		        request.setAttribute("ordersPickedUp", ordersPickedUp);
			}
		} else if(action.equalsIgnoreCase("deliverOrder")) {

			int orderid = Integer.parseInt(request.getParameter("orderid"));
			
			daoOrder.updateStat(5,orderid);
			List<Orders> listOrders = new ArrayList<Orders>();
			List<Orders> ordersReady = new ArrayList<Orders>();
			List<Orders> ordersPickedUp = new ArrayList<Orders>();
			
			String email = daoRider.getRiderEmailById(orderid);
			listOrders = daoOrder.getAllRiderOrder(email);
			if(listOrders != null) {
				listOrders.forEach((order) -> {
					if(order.getOrderStatus().equals("3")) {
						ordersReady.add(order);
					} else if(order.getOrderStatus().equals("4")) {
						ordersPickedUp.add(order);
					}
				});
			}
			forward = "riderHome.jsp";	
			if(!ordersReady.isEmpty()) {
		        request.setAttribute("ordersReady", ordersReady);
			}
			if(!ordersPickedUp.isEmpty()) {
		        request.setAttribute("ordersPickedUp", ordersPickedUp);
			}
		}//aiman habis
		
		//staff
		else if(action.equalsIgnoreCase("cashierOrderPrepare")) {

			int orderid = Integer.parseInt(request.getParameter("orderid"));
			
			daoOrder.updateStat(3,orderid);
			List<Orders> listPrepare = new ArrayList<Orders>();
			listPrepare = daoOrder.getAllPrepareOrder();
			if(!listPrepare.isEmpty()) {
		        request.setAttribute("listPrepare", listPrepare);
			}
			
			int RiderId = Integer.parseInt(request.getParameter("RiderId"));
			
			Rider rider = new Rider();
        	rider = daoRider.getRiderById(RiderId);      

            request.setAttribute("rider", rider); 
			
			forward ="cashierPrepareOrder.jsp";
		}
		
		else if(action.equalsIgnoreCase("adminOrderPrepare")) {

			int orderid = Integer.parseInt(request.getParameter("orderid"));
			
			daoOrder.updateStat(3,orderid);
			List<Orders> listPrepare = new ArrayList<Orders>();
			listPrepare = daoOrder.getAllPrepareOrder();
			if(!listPrepare.isEmpty()) {
		        request.setAttribute("listPrepare", listPrepare);
			}
			
			forward ="adminPrepareOrder.jsp";
		}
		
		else if(action.equalsIgnoreCase("cashierUpdateOrderRider")) {

			int orderid = Integer.parseInt(request.getParameter("orderid"));
			int riderid = Integer.parseInt(request.getParameter("riderid"));
			int staffid = Integer.parseInt(request.getParameter("staffid"));
						
			daoOrder.updateAssign(riderid,orderid,staffid);
			List<Orders> listNew = new ArrayList<Orders>();
			listNew = daoOrder.getAllNewOrder();
			if(!listNew.isEmpty()) {
		        request.setAttribute("listNew", listNew);
			}
			
			request.setAttribute("success", "You successfuly assign a rider.");
			
			forward ="cashierNewOrder.jsp";
		}
		
		else if(action.equalsIgnoreCase("adminUpdateOrderRider")) {

			int orderid = Integer.parseInt(request.getParameter("orderid"));
			int riderid = Integer.parseInt(request.getParameter("riderid"));
			int staffid = Integer.parseInt(request.getParameter("staffid"));
					 
			
			daoOrder.updateAssign(riderid,orderid,staffid);
			List<Orders> listNew = new ArrayList<Orders>();
			listNew = daoOrder.getAllNewOrder();
			if(!listNew.isEmpty()) {
		        request.setAttribute("listNew", listNew);
			}
			
			request.setAttribute("success", "You successfuly assign a rider.");
			
			forward ="adminNewOrder.jsp";
		}
		
		else if(action.equalsIgnoreCase("cashierViewNewOrder")) {
			
			List<Orders> listNew = new ArrayList<Orders>();
			listNew = daoOrder.getAllNewOrder();
			if(!listNew.isEmpty()) {
		        request.setAttribute("listNew", listNew);
			}
			
			forward ="cashierNewOrder.jsp";
		}
		
		else if(action.equalsIgnoreCase("cashierViewPrepareOrder")) {
			
			List<Orders> listPrepare = new ArrayList<Orders>();
			listPrepare = daoOrder.getAllPrepareOrder();
			if(!listPrepare.isEmpty()) {
		        request.setAttribute("listPrepare", listPrepare);
			}
			
			forward ="cashierPrepareOrder.jsp";
		}
		

		
		else if(action.equalsIgnoreCase("cashierViewTrackOrder")) {
			
			List<Orders> listTrack = new ArrayList<Orders>();
			listTrack = daoOrder.getAllTrackOrder();
			if(!listTrack.isEmpty()) {
		        request.setAttribute("listTrack", listTrack);
			}
			
			forward ="cashierTrackOrder.jsp";
		}
		
		else if(action.equalsIgnoreCase("adminViewNewOrder")) {
			
			List<Orders> listNew = new ArrayList<Orders>();
			listNew = daoOrder.getAllNewOrder();
			if(!listNew.isEmpty()) {
		        request.setAttribute("listNew", listNew);
			}
			
			forward ="adminNewOrder.jsp";
		}
		
		else if(action.equalsIgnoreCase("adminViewPrepareOrder")) {
			
			List<Orders> listPrepare = new ArrayList<Orders>();
			listPrepare = daoOrder.getAllPrepareOrder();
			if(!listPrepare.isEmpty()) {
		        request.setAttribute("listPrepare", listPrepare);
			}
			
			forward ="adminPrepareOrder.jsp";
		}
		

		
		else if(action.equalsIgnoreCase("adminViewTrackOrder")) {
			
			List<Orders> listTrack = new ArrayList<Orders>();
			listTrack = daoOrder.getAllTrackOrder();
			if(!listTrack.isEmpty()) {
		        request.setAttribute("listTrack", listTrack);
			}
			
			forward ="adminTrackOrder.jsp";
		}
		
		//rider
		else if(action.equalsIgnoreCase("riderorderdetails")) {
			int id = Integer.parseInt(request.getParameter("i"));
			
			Order_Details orderDetails = new Order_Details();
			
			List<Order_Details> ordered = new ArrayList<Order_Details>();
			ordered = daoOrder_Details.getOrderDetails(id);
			orderDetails.setItemOrdered(ordered);
			
			int custid= Integer.parseInt(request.getParameter("custId"));
	    	
	    	Customer customer = new Customer();
	    	customer = daoCustomer.getCustomerById(custid); 
			request.setAttribute("customer", customer);
			
			forward ="riderOrderDetails.jsp";
			request.setAttribute("orderdetails", orderDetails.getItemOrdered());
			
		}
		
		//aiman habis
		
		//sarah	
		else if(action.equalsIgnoreCase("createOrder")) {
			
			cartlist=(ArrayList<Integer>)cartsession.getAttribute("cartlist");
			itemQty = (ArrayList<Integer>)cartsession.getAttribute("itemQty");
			String errQtyMsg ="To ensure we fulfil your order, real-time stock is being checked. We regret to inform you that some of the items in your cart have insufficient stock. Please remove the following item:\n";
			
			for(int i = 0; i < cartlist.size(); i++) {
				System.out.println(cartlist.get(i));
				System.out.println(itemQty.get(i));
				System.out.println("calculating..");
				
				Item item = new Item();
				item = daoItem.getItemById(cartlist.get(i), itemQty.get(i));
				
				if(item.getStock() < item.getQuantity()) {
					errQtyMsg = errQtyMsg + "- " + item.getName() + "\n";
				}
			}
			
			
			if(errQtyMsg.equals("To ensure we fulfil your order, real-time stock is being checked. We regret to inform you that some of the items in your cart have insufficient stock. Please remove the following item:\n")) {
				Customer customer = new Customer();
				int custID = Integer.parseInt(request.getParameter("custID"));
				double totalPrice = Double.parseDouble(request.getParameter("total"));
				
				List<Address> addresses = new ArrayList<Address>();
	        	addresses = daoAddress.getAllAddress(custID);
	        	customer.setCustomerAddress(addresses);        	
	        	
	        	System.out.println("Total Price: ");
	    		request.setAttribute("cust",customer.getCustomerAddresses());
	    		request.setAttribute("totalPrice",totalPrice);
	    		forward = "createOrder.jsp";
			} else {
				//call DAO
				ArrayList<Item> listitemtwo= new ArrayList<Item>();
				
				double totalPriceItems = 0.0;
				int CartQty = 0;
				
				if(cartlist!= null) {
					for(int i=0; i<cartlist.size(); i++) {
						Item tempItem = new Item();
						tempItem = daoItem.getItemById(cartlist.get(i),itemQty.get(i));
						listitemtwo.add(tempItem);
						totalPriceItems = totalPriceItems +  ( tempItem.getPrice() * tempItem.getQuantity() );
						CartQty = CartQty + tempItem.getQuantity();
					}
				
				request.setAttribute("items", listitemtwo);
				}
				request.setAttribute("totalPriceItems", totalPriceItems);
				request.setAttribute("CartQty", CartQty);
				request.setAttribute("errQtyMsg", errQtyMsg);
				forward="cart.jsp";
			}
		}
		else if(action.equalsIgnoreCase("trackOrder")) {
			Customer customer = new Customer();
			int id= Integer.parseInt(request.getParameter("i"));
			customer = daoCustomer.getCustomerById(id);
			List<Orders> orderz = new ArrayList<Orders>();
			orderz = daoOrders.getAllOrderz(id);
			customer.setCustomerOrderz(orderz);
			
			forward = "trackOrder.jsp";
			request.setAttribute("order", customer.getCustomerOrderz());
		}
		
		//sarah habis
		
		else if(action.equalsIgnoreCase("orderdetails")) {
			int id = Integer.parseInt(request.getParameter("i"));
			Order_Details orderDetails = new Order_Details();
			Payment payment = new Payment();
			
			List<Order_Details> ordered = new ArrayList<Order_Details>();
			ordered = daoOrder_Details.getOrderDetails(id);
			orderDetails.setItemOrdered(ordered);
			
			payment = daoPayment.getPaymentByOrderID(id);
			
			forward ="orderDetails.jsp";
			request.setAttribute("orderdetails", orderDetails.getItemOrdered());
			request.setAttribute("paymentdetails", payment);
			
			int RiderId = Integer.parseInt(request.getParameter("RiderId"));
			
			Rider rider = new Rider();
        	rider = daoRider.getRiderById(RiderId);      

            request.setAttribute("rider", rider); 
		}
		
		else if(action.equalsIgnoreCase("adminNewOrderdetails")) {
			int id = Integer.parseInt(request.getParameter("i"));
			Order_Details orderDetails = new Order_Details();
			Payment payment = new Payment();
			
			List<Order_Details> ordered = new ArrayList<Order_Details>();
			ordered = daoOrder_Details.getOrderDetails(id);
			orderDetails.setItemOrdered(ordered);
			
			payment = daoPayment.getPaymentByOrderID(id);
			
			forward ="adminNewOrderDetails.jsp";
			request.setAttribute("orderdetails", orderDetails.getItemOrdered());
			request.setAttribute("paymentdetails", payment);
			
			int custid= Integer.parseInt(request.getParameter("custId"));
	    	
	    	Customer customer = new Customer();
	    	customer = daoCustomer.getCustomerById(custid); 
			request.setAttribute("customer", customer);
			
			int RiderId = Integer.parseInt(request.getParameter("RiderId"));
			
			Rider rider = new Rider();
        	rider = daoRider.getRiderById(RiderId);      

            request.setAttribute("rider", rider); 
		}
		else if(action.equalsIgnoreCase("adminPrepareOrderdetails")) {
			int id = Integer.parseInt(request.getParameter("i"));
			Order_Details orderDetails = new Order_Details();
			Payment payment = new Payment();
			
			List<Order_Details> ordered = new ArrayList<Order_Details>();
			ordered = daoOrder_Details.getOrderDetails(id);
			orderDetails.setItemOrdered(ordered);
			
			payment = daoPayment.getPaymentByOrderID(id);
			
			forward ="adminPrepareOrderDetails.jsp";
			request.setAttribute("orderdetails", orderDetails.getItemOrdered());
			request.setAttribute("paymentdetails", payment);
			
			int custid= Integer.parseInt(request.getParameter("custId"));
	    	
	    	Customer customer = new Customer();
	    	customer = daoCustomer.getCustomerById(custid); 
			request.setAttribute("customer", customer);
			
			int RiderId = Integer.parseInt(request.getParameter("RiderId"));
			
			Rider rider = new Rider();
        	rider = daoRider.getRiderById(RiderId);      

            request.setAttribute("rider", rider); 
		}
		else if(action.equalsIgnoreCase("adminTrackOrderdetails")) {
			int id = Integer.parseInt(request.getParameter("i"));
			Order_Details orderDetails = new Order_Details();
			Payment payment = new Payment();
			
			List<Order_Details> ordered = new ArrayList<Order_Details>();
			ordered = daoOrder_Details.getOrderDetails(id);
			orderDetails.setItemOrdered(ordered);
			
			payment = daoPayment.getPaymentByOrderID(id);
			
			forward ="adminTrackOrderDetails.jsp";
			request.setAttribute("orderdetails", orderDetails.getItemOrdered());
			request.setAttribute("paymentdetails", payment);
			
			int custid= Integer.parseInt(request.getParameter("custId"));
	    	
	    	Customer customer = new Customer();
	    	customer = daoCustomer.getCustomerById(custid); 
			request.setAttribute("customer", customer);
			
			int RiderId = Integer.parseInt(request.getParameter("RiderId"));
			
			Rider rider = new Rider();
        	rider = daoRider.getRiderById(RiderId);      

            request.setAttribute("rider", rider); 
		}
		
		else if(action.equalsIgnoreCase("adminViewOrderdetails")) { //report
			int id = Integer.parseInt(request.getParameter("i"));
			Order_Details orderDetails = new Order_Details();
			Payment payment = new Payment();
			
			List<Order_Details> ordered = new ArrayList<Order_Details>();
			ordered = daoOrder_Details.getOrderDetails(id);
			orderDetails.setItemOrdered(ordered);
			
			payment = daoPayment.getPaymentByOrderID(id);
			
			forward ="adminViewReportOrderDetails.jsp";
			request.setAttribute("orderdetails", orderDetails.getItemOrdered());
			request.setAttribute("paymentdetails", payment);
			
			int custid= Integer.parseInt(request.getParameter("custId"));
	    	
	    	Customer customer = new Customer();
	    	customer = daoCustomer.getCustomerById(custid); 
			request.setAttribute("customer", customer);
			
			int RiderId = Integer.parseInt(request.getParameter("RiderId"));
			
			Rider rider = new Rider();
        	rider = daoRider.getRiderById(RiderId);      

            request.setAttribute("rider", rider); 
		}
		
		
		else if(action.equalsIgnoreCase("cashierNewOrderdetails")) {
			int id = Integer.parseInt(request.getParameter("i"));
			Order_Details orderDetails = new Order_Details();
			Payment payment = new Payment();
			
			List<Order_Details> ordered = new ArrayList<Order_Details>();
			ordered = daoOrder_Details.getOrderDetails(id);
			orderDetails.setItemOrdered(ordered);
			
			payment = daoPayment.getPaymentByOrderID(id);
			
			forward ="cashierNewOrderDetails.jsp";
			request.setAttribute("orderdetails", orderDetails.getItemOrdered());
			request.setAttribute("paymentdetails", payment);
			
			int custid= Integer.parseInt(request.getParameter("custId"));
	    	
	    	Customer customer = new Customer();
	    	customer = daoCustomer.getCustomerById(custid); 
			request.setAttribute("customer", customer);
			
			int RiderId = Integer.parseInt(request.getParameter("RiderId"));
			
			Rider rider = new Rider();
        	rider = daoRider.getRiderById(RiderId);      

            request.setAttribute("rider", rider); 
		}
		else if(action.equalsIgnoreCase("cashierPrepareOrderdetails")) {
			int id = Integer.parseInt(request.getParameter("i"));
			Order_Details orderDetails = new Order_Details();
			Payment payment = new Payment();
			
			List<Order_Details> ordered = new ArrayList<Order_Details>();
			ordered = daoOrder_Details.getOrderDetails(id);
			orderDetails.setItemOrdered(ordered);
			
			payment = daoPayment.getPaymentByOrderID(id);
			
			forward ="cashierPrepareOrderDetails.jsp";
			request.setAttribute("orderdetails", orderDetails.getItemOrdered());
			request.setAttribute("paymentdetails", payment);
			
			int custid= Integer.parseInt(request.getParameter("custId"));
	    	
	    	Customer customer = new Customer();
	    	customer = daoCustomer.getCustomerById(custid); 
			request.setAttribute("customer", customer);
		}
		else if(action.equalsIgnoreCase("cashierTrackOrderdetails")) {
			int id = Integer.parseInt(request.getParameter("i"));
			Order_Details orderDetails = new Order_Details();
			Payment payment = new Payment();
			
			List<Order_Details> ordered = new ArrayList<Order_Details>();
			ordered = daoOrder_Details.getOrderDetails(id);
			orderDetails.setItemOrdered(ordered);
			
			payment = daoPayment.getPaymentByOrderID(id);
			
			forward ="cashierTrackOrderDetails.jsp";
			request.setAttribute("orderdetails", orderDetails.getItemOrdered());
			request.setAttribute("paymentdetails", payment);
			
			int custid= Integer.parseInt(request.getParameter("custId"));
	    	
	    	Customer customer = new Customer();
	    	customer = daoCustomer.getCustomerById(custid); 
			request.setAttribute("customer", customer);
			
			int RiderId = Integer.parseInt(request.getParameter("RiderId"));
			
			Rider rider = new Rider();
        	rider = daoRider.getRiderById(RiderId);      

            request.setAttribute("rider", rider); 
		}
		
		//Aiman sampai sini
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession cartsession = request.getSession();
		String action = request.getParameter("action");
		
		//sarah
		if(action.equalsIgnoreCase("checkout")) {
			Payment payment = new Payment();
			Orders orders = new Orders();
			
			int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
			String DeliveryAddress = request.getParameter("DeliveryAddress");
			double total = 0.0;
			
			cartlist=(ArrayList<Integer>)cartsession.getAttribute("cartlist");
			itemQty = (ArrayList<Integer>)cartsession.getAttribute("itemQty");
			
			for(int i = 0; i < cartlist.size(); i++) {
				System.out.println(cartlist.get(i));
				System.out.println(itemQty.get(i));
				System.out.println("calculating..");
				
				Item item = new Item();
				item = daoItem.getItemById(cartlist.get(i), itemQty.get(i));
				total = total + (item.getPrice() * itemQty.get(i));
			}
			
			payment = new Payment(paymentMethod, total);
			daoPayment.add(payment);
			
			int custID = (int) cartsession.getAttribute("custid");
			int paymentID = daoPayment.getLatestID();
			
			System.out.println("Payment ID: " + paymentID);
			System.out.println("Cust ID: " + custID);
			System.out.println("DeliveryAddress: " + DeliveryAddress);
			
			orders = new Orders(DeliveryAddress, custID, paymentID);
			
			daoOrders.add(orders);
			int orderID = daoOrders.getLatestOrderID();
			
			Order_Details order_details = new Order_Details();
			
			for(int i = 0; i < cartlist.size(); i++) {
				order_details = new Order_Details(itemQty.get(i), cartlist.get(i), orderID);
				daoOrder_Details.add(order_details);
				daoItem.deductStock(cartlist.get(i),itemQty.get(i));
			}
			     	
			orders = daoOrders.getOrderById(orderID);
	    	System.out.println("Total Price: RM " + total);
	    	System.out.println("Order ID: " + orders.getOrderID());
	    	
	    	double grandTotal = Double.parseDouble(request.getParameter("grandTotal"));
	    	double total2 = Double.parseDouble(request.getParameter("total"));
	    	request.setAttribute("totalPrice", total2);
			request.setAttribute("orders", orders);
			request.setAttribute("grandTotal", grandTotal);
			request.setAttribute("newOrderMsg", "Order is successfuly made!");
			
			//call DAO
			ArrayList<Item> listitemtwo= new ArrayList<Item>();
			if(cartlist!= null) {
				for(int i=0; i<cartlist.size(); i++) {
					listitemtwo.add(daoItem.getItemById(cartlist.get(i),itemQty.get(i)));
				}
			request.setAttribute("items", listitemtwo);
			 
            cartsession.removeAttribute("cartlist");
            cartsession.removeAttribute("itemQty");
			System.out.println("Cart is now empty");
			
			}
			
			forward = "orderList.jsp";
			//if not successful > back to createOrder.jsp
		}//sarah habis
		
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	
	}

}
