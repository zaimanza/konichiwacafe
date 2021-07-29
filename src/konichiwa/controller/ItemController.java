package konichiwa.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import konichiwa.dao.ItemDAO;
import konichiwa.model.Item;
import konichiwa.model.Item_Category;
/**
 * Servlet implementation class ItemController
 */
@WebServlet("/ItemController")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB

public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	static ArrayList<Integer> cartlist = new ArrayList<>();
	static ArrayList<Integer> itemQty = new ArrayList<>();
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
		HttpSession cartsession = request.getSession();
		if(action.equalsIgnoreCase("viewItem")) { //Customer view item list
			
			  List<Item> items = new ArrayList<Item>(); items = daoItem.getAllItem();
			  item.setItems(items);
			    
			  Item_Category itemcategory = new Item_Category(); List<Item_Category>
			  itemcategorylist = new ArrayList<Item_Category>(); itemcategorylist =
			  daoItem.getAllItemCategory(); itemcategory.setItemcategory(itemcategorylist);
			  
			  request.setAttribute("item", item.getItems());
			  request.setAttribute("category", itemcategory.getItemcategory());
			    
			  cartlist=(ArrayList<Integer>)cartsession.getAttribute("cartlist");
			  itemQty = (ArrayList<Integer>)cartsession.getAttribute("itemQty");
			
			  double totalPriceItems = 0.0;
			  int CartQty = 0;
				
			  if(cartlist!= null) {
					for(int i=0; i<cartlist.size(); i++) {
						Item tempItem = new Item();
						tempItem = daoItem.getItemById(cartlist.get(i),itemQty.get(i));
						totalPriceItems = totalPriceItems +  ( tempItem.getPrice() * tempItem.getQuantity() );
						CartQty = CartQty + tempItem.getQuantity();
					}
				
			  }
			  request.setAttribute("totalPriceItems", totalPriceItems);
			  request.setAttribute("CartQty", CartQty);
			  forward = "../ActorCustomer/viewItem.jsp"; 
		}
		
		if(action.equalsIgnoreCase("addItem")) {
			forward = "../ActorAdmin/adminAddItem.jsp";
		}
		
		if(action.equalsIgnoreCase("adminViewItem")) {
			List<Item> items = new ArrayList<Item>();
			items = daoItem.getAllItem();
			item.setItems(items);
			
			request.setAttribute("item", item.getItems());
			forward = "../ActorAdmin/adminViewItem.jsp";
		}
				
		if(action.equalsIgnoreCase("edit")) {
			int itemid= Integer.parseInt(request.getParameter("id"));
			item = new Item();
			item = daoItem.getItemForUpdate(itemid);

			request.setAttribute("item", item);   		
    		forward = "../ActorAdmin/adminUpdateItem.jsp";		    		    		
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");		
		
		if(action.equalsIgnoreCase("addItem")) {
			int staffid = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			double price = Double.parseDouble(request.getParameter("price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String desc = request.getParameter("desc");		
			String itemcategoryid = request.getParameter("itemcategoryid");
			
			Item item = new Item(name, price, stock, desc, staffid, itemcategoryid);
			
			InputStream inputStream = null;
			Part filePart = request.getPart("image");
			
			if(filePart != null) {
				// prints out some information for debugging
				System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());

	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
			}
	        
			item = daoItem.getItemValid(item);
			
			if(!item.isValid()) {
				daoItem.add(item, inputStream);				
				//request.setAttribute("success", "Item successfully added!");
				List<Item> items = new ArrayList<Item>();
				items = daoItem.getAllItem();
				item.setItems(items);
				
				request.setAttribute("item", item.getItems());
				request.setAttribute("added", "Item successfully added!");
				forward = "../ActorAdmin/adminViewItem.jsp";
			}
			
			if(item.isValid()) {
				List<Item> items = new ArrayList<Item>();
				items = daoItem.getAllItem();
				item.setItems(items);
				
				request.setAttribute("item", item.getItems());
				request.setAttribute("failed", "Oops, the item is already in the list!");
				forward = "../ActorAdmin/adminViewItem.jsp";
			}
		}
		
		if(action.equalsIgnoreCase("updateItem")) {
			int itemid = Integer.parseInt(request.getParameter("itemid")); 
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String description = request.getParameter("desc");
//          String image = request.getParameter("image");
          
            String itemcategoryid = request.getParameter("itemcategoryid");

            Item item = new Item (itemid,name,price,stock,description,itemcategoryid);

            //item = daoItem.getItemValid(item);//check item name duplication       
            
            //if(!item.isValid()) { // if no duplication
            	item = daoItem.updateItem(item);
            	request.setAttribute("updated", "Item successfully updated!");
            //}
				
			//if(item.isValid())
				//request.setAttribute("outdated", "Item failed to update!");
			
            List<Item> items = new ArrayList<Item>();
			items = daoItem.getAllItem();
			item = new Item();
			item.setItems(items);
			
			request.setAttribute("item", item.getItems());			
			forward = "../ActorAdmin/adminViewItem.jsp";
		}
		
		if(action.equalsIgnoreCase("deleteItem")) {
            int itemid = Integer.parseInt(request.getParameter("itemID"));
            daoItem.deleteItemById(itemid);
            
			
			  List<Item> items = new ArrayList<Item>(); 
			  items = daoItem.getAllItem(); 
			  Item item = new Item(); 
			  item.setItems(items);
			 
			
            System.out.println("Successfully delete item");
            request.setAttribute("deleted", "Item successfully deleted!");
            request.setAttribute("item",item.getItems());

            forward = "../ActorAdmin/adminViewItem.jsp";
          }
		
		if(action.equalsIgnoreCase("itemByCategory")) { //Customer view item list by category
			String categoryid = request.getParameter("itemcategoryid");
			System.out.println("item category: "+categoryid);
			
			List<Item> items = new ArrayList<Item>();
			items = daoItem.getAllItemByCategory(categoryid);
			Item item = new Item(); 
			item.setItems(items);
						
			Item_Category itemcategory = new Item_Category();
			List<Item_Category> itemcategorylist = new ArrayList<Item_Category>();
			itemcategorylist = daoItem.getAllItemCategory();
			itemcategory.setItemcategory(itemcategorylist);
			
			forward = "../ActorCustomer/viewItem.jsp";
			request.setAttribute("item", item.getItems());
			request.setAttribute("category", itemcategory.getItemcategory());
			request.setAttribute("selectedModule", request.getParameter("itemcategoryid"));
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

}
