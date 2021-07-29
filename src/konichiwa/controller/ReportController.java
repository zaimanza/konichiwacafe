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
import konichiwa.dao.PaymentDAO;
import konichiwa.model.Orders;


/**
 * Servlet implementation class ReportController
 */
@WebServlet("/ReportController")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	private OrdersDAO daoOrders;

	private PaymentDAO daoPayment;


	String forward=""; 
    public ReportController() {
        super();
        daoOrders = new OrdersDAO();
        daoPayment = new PaymentDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("adminViewReport")) {
			List<Orders> listOrders = new ArrayList<Orders>();
			listOrders = daoOrders.getAllOrderHistory();			
			if(listOrders != null) {
				request.setAttribute("ordersHistory", listOrders);					
			}
			
			Double total = daoPayment.getAllTotalPrice();
			request.setAttribute("allTotalPrice", total);
			forward="../ActorAdmin/adminViewReport.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
