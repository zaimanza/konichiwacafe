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
 * Servlet implementation class StockController
 */
@WebServlet("/StockController")
public class StockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ItemDAO daoItem;
	String forward = "";
       
    
    public StockController() {
        super();
        daoItem = new ItemDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("cashierViewItemList")) {
			List<Item> items = new ArrayList<Item>();
			items = daoItem.getAllItem();
			Item item = new Item();
			item.setItems(items);
			
			forward = "../ActorCashier/cashierViewItemList.jsp";
			request.setAttribute("item", item.getItems());
		}	
		
		
		else if(action.equalsIgnoreCase("cashierUpdateStock")) {
			int id = Integer.parseInt(request.getParameter("id"));
			
			System.out.println("Item ID to update: "+ id);
			
			Item item = new Item();	
			item = daoItem.getItemOlehId(id);
			forward = "../ActorCashier/cashierUpdateStock.jsp";
			
			request.setAttribute("item", item);
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemid = 0, itemstock = 0;
		double itemprice = 0.0;
		String itemname = null, itemdescription = null, itemimage = null, itemcategoryid = null;
		String action = request.getParameter("action");

		if(request.getParameter("id") != null && request.getParameter("id").replaceAll("\\s+","").length() != 0) {itemid = Integer.parseInt(request.getParameter("id"));}
		if(request.getParameter("name") != null && request.getParameter("name").replaceAll("\\s+","").length() != 0) {itemname = request.getParameter("name");}
		if(request.getParameter("price") != null && request.getParameter("price").replaceAll("\\s+","").length() != 0) {itemprice = Double.parseDouble(request.getParameter("price"));}
		if(request.getParameter("stock") != null && request.getParameter("stock").replaceAll("\\s+","").length() != 0) {itemstock = Integer.parseInt(request.getParameter("stock"));}
		if(request.getParameter("desc") != null && request.getParameter("desc").replaceAll("\\s+","").length() != 0) {itemdescription = request.getParameter("desc");}
		if(request.getParameter("itemcategoryid") != null && request.getParameter("itemcategoryid").replaceAll("\\s+","").length() != 0) {itemcategoryid = request.getParameter("itemcategoryid");}
		if(request.getParameter("image") != null && request.getParameter("image").replaceAll("\\s+","").length() != 0) {itemimage = request.getParameter("image");}
	
				
		Item item = new Item (itemid, itemname, itemprice, itemimage, itemstock, itemdescription, itemcategoryid);
		item = ItemDAO.getItem(item);
						
		
		if(action.equalsIgnoreCase("update")) {
			System.out.println("updating stock . . .");
			
			item = daoItem.updateStock(item);
			if(item.isValid())
				request.setAttribute("updated", "Item stock successfully updated!");
			if(!item.isValid())
				request.setAttribute("outdated", "Item stock failed to update!");
			
			List<Item> items = new ArrayList<Item>();
			items = daoItem.getAllItem();
			Item updatedItemList = new Item();
			updatedItemList.setItems(items);
			
			forward = "../ActorCashier/cashierViewItemList.jsp";
			request.setAttribute("item", updatedItemList.getItems());
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
}
