package konichiwa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import konichiwa.dao.ItemDAO;
import konichiwa.model.Item;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ArrayList<Integer> cartlist = new ArrayList<>();
	static ArrayList<Integer> itemQty = new ArrayList<>();
    /**
     * @see HttpServlet#HttpServlet()
     */
	String forward="";
	private ItemDAO daoItem;
    public CartController() {
        super();
        daoItem = new ItemDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		/*adib*/HttpSession cartsession = request.getSession();
		
		/*adib*/
		if(action.equalsIgnoreCase("addtocart")) {
			int id = Integer.parseInt(request.getParameter("i"));
			System.out.println("Item ID: "+id);
			System.out.println("Adding to cart");
			Item p = new Item();
			boolean check = false;
			
			//call session cartlist
			cartlist = (ArrayList<Integer>)cartsession.getAttribute("cartlist");
			
			//item quantity session
			itemQty = (ArrayList<Integer>)cartsession.getAttribute("itemQty");
			
			if(cartlist == null) {
				check=false;		
			}
			else {
				check = p.check(cartlist,id);
			}
						
			if(check) {
				forward = "ItemController?action=viewItem";
				System.out.println("ITEM QUANTITY UPDATE");
								
				//check cartlist where id same and get index
				for(int i=0; i<itemQty.size(); i++){			
				    if(cartlist.get(i) == id){
				        int indfound= itemQty.get(i);
				        int qty = indfound+1;
						itemQty.set(i, qty);
				    }
				}
				
				request.setAttribute("mycart", "Yeay, you add some more!");
				System.out.println("<<<<CART LIST DETAIL AFTER ADD NEW ITEM>>>>");
				System.out.println("Item ID:  "+cartlist);
				System.out.println("Item Qty: "+itemQty);
				
				cartsession.setAttribute("cartlist",cartlist);
				cartsession.setAttribute("itemQty",itemQty);
				
				//JOptionPane.showMessageDialog(null, "Product is already added to Cart", "Info", JOptionPane.INFORMATION_MESSAGE);
			}
			else {
				if(cartlist== null) {
					cartlist=new ArrayList<>();
					itemQty=new ArrayList<>();
				}
				cartlist.add(id);
				itemQty.add(1);
				
				request.setAttribute("mycart", "Item successfully added to Cart");
				forward = "ItemController?action=viewItem";
				
				cartsession.setAttribute("cartlist",cartlist);
				cartsession.setAttribute("itemQty",itemQty);
				
				System.out.println("<<<<CART LIST DETAIL AFTER ADD NEW ITEM>>>>");
				System.out.println("Item ID:  "+cartlist);
				System.out.println("Item Qty: "+itemQty);
				System.out.println("Number type of item in cart: "+ cartlist.size());

				
				//JOptionPane.showMessageDialog(null, "Product successfully added to Cart", "Info", JOptionPane.INFORMATION_MESSAGE);
			}	
		}
		if(action.equalsIgnoreCase("showcart")) {
			cartlist=(ArrayList<Integer>)cartsession.getAttribute("cartlist");
			itemQty = (ArrayList<Integer>)cartsession.getAttribute("itemQty");
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
			forward="cart.jsp";
			
		}
		/*adib habis*/
		
		if(action.equalsIgnoreCase("plus")) {
			int id = Integer.parseInt(request.getParameter("i"));
			System.out.println("Item ID: "+id);
			System.out.println("Adding 1 to cart");
			Item p = new Item();
			boolean check = false;
			
			//call session cartlist
			cartlist = (ArrayList<Integer>)cartsession.getAttribute("cartlist");
			
			//item quantity session
			itemQty = (ArrayList<Integer>)cartsession.getAttribute("itemQty");
			
			check = p.check(cartlist,id);
			
			if(check) {
				forward = "CartController?action=showcart";
				System.out.println("ITEM QUANTITY UPDATE");
								
				//check cartlist where id same and get index
				for(int i=0; i<itemQty.size(); i++){			
				    if(cartlist.get(i) == id){
				        int indfound= itemQty.get(i);
				        int qty = indfound+1;
						itemQty.set(i, qty);
				    }
				}
				System.out.println("<<<<CART LIST DETAIL AFTER UPDATE QUANTITY>>>>");
				System.out.println("Item ID:  "+cartlist);
				System.out.println("Item Qty: "+itemQty);
				
				cartsession.setAttribute("cartlist",cartlist);
				cartsession.setAttribute("itemQty",itemQty);
				
			}
			
		}
		if(action.equalsIgnoreCase("minus")) {
			int id = Integer.parseInt(request.getParameter("i"));
			System.out.println("Item ID: "+id);
			System.out.println("Removing 1 from cart");
			Item p = new Item();
			boolean check = false;
			
			//call session cartlist
			cartlist = (ArrayList<Integer>)cartsession.getAttribute("cartlist");
			
			//item quantity session
			itemQty = (ArrayList<Integer>)cartsession.getAttribute("itemQty");
			
			check = p.check(cartlist,id);
			
			if(check) {
				forward = "CartController?action=showcart";
				System.out.println("ITEM QUANTITY UPDATE");
								
				//check cartlist where id same and get index
				for(int i=0; i<itemQty.size(); i++){			
				    if(cartlist.get(i) == id){
				        int indfound= itemQty.get(i);
				        if(indfound == 1) {
				        	System.out.println("Removing item id: "+ cartlist.get(i));
				        	itemQty.remove(i);
							cartlist.remove(i);
				        }
				        else {
				        	int qty = indfound-1;
				        	itemQty.set(i, qty);
				        }
				        
				    }
				}
				System.out.println("<<<<CART LIST DETAIL AFTER UPDATE QUANTITY>>>>");
				System.out.println("Item ID:  "+cartlist);
				System.out.println("Item Qty: "+itemQty);
				
				cartsession.setAttribute("cartlist",cartlist);
				cartsession.setAttribute("itemQty",itemQty);
				
			}
		}
		if(action.equalsIgnoreCase("remove")) {
			int id = Integer.parseInt(request.getParameter("i"));
			System.out.println("Item ID: "+id);
			System.out.println("Removing from cart");
			Item p = new Item();
			boolean check = false;
			
			//call session cartlist
			cartlist = (ArrayList<Integer>)cartsession.getAttribute("cartlist");
			
			//item quantity session
			itemQty = (ArrayList<Integer>)cartsession.getAttribute("itemQty");
			check = p.check(cartlist,id);
			
			if(check) {			
				//check cartlist where id same and get index
				for(int i=0; i<itemQty.size(); i++){			
				    if(cartlist.get(i) == id){
				    	itemQty.remove(i);
						cartlist.remove(i);
				    }
				}
				System.out.println("<<<<CART LIST DETAIL AFTER REMOVE AN ITEM>>>>");
				System.out.println("Item ID:  "+cartlist);
				System.out.println("Item Qty: "+itemQty);
				
				cartsession.setAttribute("cartlist",cartlist);
				cartsession.setAttribute("itemQty",itemQty);
				forward = "CartController?action=showcart";				
			}			
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
