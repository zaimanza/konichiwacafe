package konichiwa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import konichiwa.dao.StaffDAO;
import konichiwa.model.Staff;

/**
 * Servlet implementation class StaffController
 */
@WebServlet("/StaffController")
public class StaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDAO daoStaff;
	
	private static String ADD_STAFF = "registerStaff.jsp";
	
	String forward="";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffController() {
        super();
        daoStaff = new StaffDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		int staffid = Integer.parseInt(request.getParameter("id"));
		
		if(action.equalsIgnoreCase("profile")) {
			Staff staff = daoStaff.getStaffById(staffid);
			request.setAttribute("staff", staff);
			if(staff.getStaffType() == 2) //master admin
				forward = "adminViewProfile.jsp";
			else if(staff.getStaffType() == 1) //cashier 
				forward = "cashierViewProfile.jsp";
		}
		
		else if(action.equalsIgnoreCase("updateProfile")) {
			Staff staff = daoStaff.getStaffById(staffid);
			request.setAttribute("staff", staff);
			if(staff.getStaffType() == 2) //master admin
				forward = "adminUpdateProfile.jsp";
			else if(staff.getStaffType() == 1) //cashier 
				forward = "cashierUpdateProfile.jsp";
		}
		
		else if(action.equalsIgnoreCase("home")) {
			Staff staff = daoStaff.getStaffById(staffid);
						
			if (staff.getStaffType() == 1) { //cashier 
				forward = "cashierHome.jsp";
				request.setAttribute("cashier", staff);
				request.setAttribute("cashierId", staff.getStaffId());
			}

			else if (staff.getStaffType() == 2) { //master admin
				forward = "adminHome.jsp";						
				request.setAttribute("admin", staff);
				request.setAttribute("adminId", staff.getStaffId());
			}
		}
		
		else if(action.equalsIgnoreCase("adminViewAllCashier")) {
			request.setAttribute("cashierlist", daoStaff.getAllCashier());
            forward = "adminViewCashier.jsp";
		}
		
		else if (action.equalsIgnoreCase("adminDeleteCashier")) {
			
			String id = request.getParameter("id"); // ni maybe salah jugak
		 
			daoStaff.deleteStaff(id);
			request.setAttribute("deleted", "Successfully deleted!");
			
			request.setAttribute("cashierlist", daoStaff.getAllCashier());
            forward = "adminViewCashier.jsp";
		}
		
		else if (action.equalsIgnoreCase("adminVerifyCashier")) { 
			
			String id = request.getParameter("id");
		 
			daoStaff.verifyStaff(id);
		
			request.setAttribute("cashierlist", daoStaff.getAllCashier());
            forward = "adminViewCashier.jsp";
		}
		
		else if (action.equalsIgnoreCase("adminUnVerifyCashier")) {
			
			String id = request.getParameter("id");
		 
			daoStaff.unVerifyStaff(id);
		
			request.setAttribute("cashierlist", daoStaff.getAllCashier());
            forward = "adminViewCashier.jsp";
		}
		
		else if (action.equalsIgnoreCase("adminUpdateCashier")) {
			 int id = Integer.parseInt(request.getParameter("id"));
			 Staff staff = new Staff(); 
			 staff = daoStaff.getStaffById(id);
			 forward = "adminUpdateCashier.jsp"; 
			 request.setAttribute("staff", staff); 
			 
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String staffFName = null, staffLName = null, staffPhone = null, staffEmail = null, staffPassword = null;
		int staffId = 0, staffType = 0;
		
		if (request.getParameter("staffId") != null
				&& request.getParameter("staffId").replaceAll("\\s+", "").length() != 0) {
			staffId = Integer.parseInt(request.getParameter("staffId"));
		}
		if (request.getParameter("staffFName") != null
				&& request.getParameter("staffFName").replaceAll("\\s+", "").length() != 0) {
			staffFName = request.getParameter("staffFName");
		}
		if (request.getParameter("staffLName") != null
				&& request.getParameter("staffLName").replaceAll("\\s+", "").length() != 0) {
			staffLName = request.getParameter("staffLName");
		}
		if (request.getParameter("staffEmail") != null
				&& request.getParameter("staffEmail").replaceAll("\\s+", "").length() != 0) {
			staffEmail = request.getParameter("staffEmail");
		}
			
		if (request.getParameter("staffPhone") != null
				&& request.getParameter("staffPhone").replaceAll("\\s+", "").length() != 0) {
			staffPhone = request.getParameter("staffPhone");
		}
		if (request.getParameter("staffPassword") != null
				&& request.getParameter("staffPassword").replaceAll("\\s+", "").length() != 0) {
			staffPassword = request.getParameter("staffPassword");
		}
		if (request.getParameter("staffType") != null
				&& request.getParameter("staffType").replaceAll("\\s+", "").length() != 0) {
			staffType = Integer.parseInt(request.getParameter("staffType"));
		}
		
		Staff staff = new Staff(staffId, staffFName, staffLName, staffPhone, staffEmail, staffPassword, staffType);
		staff = daoStaff.getStaff(staff);
		
		String action = request.getParameter("action");
		
		if (action.equalsIgnoreCase("registerStaff")) {

			if (!staff.isValid()) {
				System.out.println("Adding . . ."+ staff.getStaffEmail());
				daoStaff.add(staff);
				request.setAttribute("loginerror", "Successfuly registered");
				response.sendRedirect("loginStaff.jsp");
			}

			else {
				System.out.println("Staff with this email already exist");
				request.setAttribute("signuperror", "Staff with this email already exist");
				RequestDispatcher view = request.getRequestDispatcher(ADD_STAFF);
				view.forward(request, response);
			}
		}
		
		if (action.equalsIgnoreCase("loginStaff")) {
			
			if (!staff.isValid()) {
				System.out.println("Staff does not exist");
				request.setAttribute("loginerror", "Unregistered Staff");
				forward = "loginStaff.jsp";
			} 
			else { // if staff exist
							
				staff = StaffDAO.getStaffByEmail(staff.getStaffEmail());
				
				if (staff.getStaffPassword().equals(staffPassword)) {
					System.out.println("Logged in: "+staff.getStaffEmail());
					System.out.println("Staff ID: " + staff.getStaffId());
					request.setAttribute("staffName", staff.getStaffFName()+" "+staff.getStaffLName());
					
					if (staff.getStaffType() == 1) { //cashier 
						forward = "cashierHome.jsp";
						request.setAttribute("cashier", staff);
						request.setAttribute("cashierId", staff.getStaffId());
					}

					else if (staff.getStaffType() == 2) { //master admin
						forward = "adminHome.jsp";						
						request.setAttribute("admin", staff);
						request.setAttribute("adminId", staff.getStaffId());
					}
					
					else if(staff.getStaffType() == 0) { //invalid staff @ account has been deactivate
						forward = "loginStaff.jsp";
						System.out.println("Invalid staff");
						request.setAttribute("loginerror", "Please wait for validation");
					}
					
					
				} 
				else {
					System.out.println("Wrong password");
					request.setAttribute("loginerror", "Incorrect Password");
					forward = "loginStaff.jsp";
				}							
			}
			
			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		}
		
		if(action.equalsIgnoreCase("updateStaff")) { // Staff manage profile
			staff = daoStaff.updateStaff(staff);
			daoStaff.getStaffById(staff.getStaffId());
			request.setAttribute("staff", staff);
			
			if(staff.isValid()) {
				request.setAttribute("updated", "Successfully updated!");
				
				if(staff.getStaffType() == 2) //master admin
					forward = "adminViewProfile.jsp";
				else if(staff.getStaffType() == 1) //cashier 
					forward = "cashierViewProfile.jsp";
			}
			
			if(!staff.isValid()) {
				request.setAttribute("outdated", "Failed to update!");
				
				if(staff.getStaffType() == 2) //master admin
					forward = "adminViewProfile.jsp";
				else if(staff.getStaffType() == 1) //cashier 
					forward = "cashierViewProfile.jsp";
			}
			
	
			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		}
		
		if(action.equalsIgnoreCase("adminUpdatingStaff")) { // Admin update Cashier profile
			staff = daoStaff.updateStaff(staff);
			daoStaff.getStaffById(staff.getStaffId());
			
			request.setAttribute("cashierlist", daoStaff.getAllCashier()); 
			forward = "adminViewCashier.jsp"; 
			
			if(staff.isValid()) {
				request.setAttribute("updated", "Successfully updated!");				
			}
			
			if(!staff.isValid()) {
				request.setAttribute("outdated", "Failed to update!");
			}
			
			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		}
		
	}

	

}
