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

import konichiwa.dao.ItemDAO;
import konichiwa.model.Item;

/**
 * Servlet implementation class ItemController
 */
@WebServlet("/ItemController")
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	
	String forward="";
	private ItemDAO daoItem;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemController() {
        super();
        daoItem = new ItemDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		Item item = new Item();
		
		if(action.equalsIgnoreCase("viewItem")) {
			List<Item> items = new ArrayList<Item>();
			items = daoItem.getAllItem();
			item.setItems(items);
			
			forward = "viewItem.jsp";
			request.setAttribute("item", item.getItems());
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
