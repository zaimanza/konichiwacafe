<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import= "java.text.Format" %>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.Date"%>
<% 
	
	Format dateFormat = new SimpleDateFormat("EEEEE");
	Format dateFormat2 = new SimpleDateFormat("MMMM dd, yyyy");
	
	String day = dateFormat.format(new Date());
	String date = dateFormat2.format(new Date()); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <style>
    	.btndisable{
	       	border: none;        
		  	background-color: #ff4d4d;
       }
       
       .btnenable{
	       	border: none;        
		  	background-color: green;
       }
       
    </style>
<title>Staff | Konichiwa Cafe</title>
</head>
<body class="example">
<script type="text/javascript">
				
	function logoutFunction()
	{
		localStorage.removeItem("adminID");
		window.location.replace("../ActorAdmin/loginStaff.jsp");
	}
	
	function viewCustomer(){
		location.href = "CustomerController?i=all&id=" + localStorage.getItem("adminID") + "";
	}
	function viewCustomerActive(){
		location.href = "CustomerController?i=active&id=" + localStorage.getItem("adminID") + "";
	}
	function viewCustomerInactive(){
		location.href = "CustomerController?i=inactive&id=" + localStorage.getItem("adminID") + "";
	}
	function viewStaff(){
		location.href = "StaffController?action=profile&id=" + localStorage.getItem("adminID") + "";
	}
	
	//baru sampai sini Hanis ^
	function viewRider(){
		location.href = "RiderController?action=adminViewAllRider&id=" + localStorage.getItem("adminID") + "";
	}
	
	function viewCashier(){
		location.href = "StaffController?action=adminViewAllCashier&id=" + localStorage.getItem("adminID") + "";
	}
	function newOrder() {
		location.href = "OrdersController?action=adminViewNewOrder";
	
	}
	function preparingOrder() {
		location.href = "OrdersController?action=adminViewPrepareOrder";
	
	}
	function trackOrder() {
		location.href = "OrdersController?action=adminViewTrackOrder";
	
	}
	function viewReport(){
		location.href = "ReportController?action=adminViewReport";
	}
	function viewMenu(){
		location.href = "ItemController?action=adminViewItem";
	}
	function addItem(){
		location.href = "ItemController?action=addItem";
	}
	//baru sampai sini Aiman ^
	function validate() {
		var x = document.updateForm.staffPhone.value;
		
		if (x.length <10){
			alert("Phone No. too short!");
			return false;
		}
		
		
	}
	//baru sampai sini Hanis ^
	
	
</script>
		<!-- Navigation bar -->
		<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                   		<a href="../ActorAdmin/indexStaff.jsp"><i class="fa fa-home  "></i> Home</a> 
	                      	<span>Konichiwa Cafe</span> 
	                       	  <p style="float:right;"><% out.print(day); %> <span>- <% out.print(date); %></span></p>
	                    </div>
	                </div>
	           </div>
	       </div>
	    </div>
         <div class="nav-item">
           <nav class="nav-menu mobile-menu" style="margin:auto;">
                                   
           	<ul>
           		<li><a href="#">Manage Menu</a>
	           		<ul class="dropdown">
	                     <li><a href="#" onclick="viewMenu()"><i class=" "></i> View Menu</a></li>
	                     <li><a href="#" onclick="addItem()"><i class=" "></i> Add New Item</a></li>				                                
	                 </ul>
                 </li>
             <li><a href="#">Manage Orders</a>
                 <ul class="dropdown">
                     <li><a href="#" onclick="newOrder()"><i class=" "></i> New Orders</a></li> <!-- assign rider-->
                     <li><a href="#" onclick="prepareOrder()"><i class=" "></i> Preparing</a></li> <!-- btn ready-->
                     <li><a href="#" onclick="trackOrder()"><i class=" "></i> Track Orders</a></li>				                                
                 </ul>
             </li>
             <li><a href="#">Manage Accounts</a>
                 <ul class="dropdown">
                     <li><a href="#" onclick="viewCustomer()"><i class="fa fa-user "></i> Customer</a></li>
                     <li><a href="#" onclick="viewRider()"><i class="fa fa-user "></i> Rider</a></li>
                     <li><a href="#" onclick="viewCashier()"><i class="fa fa-user "></i> Cashier</a></li>				                                
                 </ul>
             </li>
             <li><a href="#" onclick="viewReport()">View Report</a></li>     
             <li><a href="#" id="staff"></a>
                 <ul class="dropdown">
                 	<li><a href="#" onclick="viewStaff()"><i class="fa fa-user "></i> Profile</a></li>
                     <li><a href="#" onclick="logoutFunction()"><i class="fa fa-sign-out "></i> Logout</a></li>
                     
                 </ul>
             </li>
         </ul>         				                    
     	</nav>
    </div>
    <script>
    	document.getElementById("staff").innerHTML = "Hi, "+ localStorage.getItem("staffName")+"!";
    </script>
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
<<<<<<< HEAD:WebContent/ActorAdmin/adminUpdateCashier.jsp
					<form name="updateForm" action="StaffController?action=adminUpdatingStaff" method="post" onsubmit="return validate()">
=======
						<form name="updateForm" action="StaffController?action=adminUpdatingStaff" method="post" onsubmit="return validate()">
>>>>>>> 4f2c96ca0ed68185d8abbdf616e7bac64e0efa4a:WebContent/adminUpdateCashier.jsp
							<input type='hidden' name='staffId' id="staffId" value="<c:out value="${staff.getStaffId()}" />">
							<div class="group-input">
								<label for="fname">First Name : </label>
								<input type='text' name='staffFName'  pattern= "[A-Za-z @/]+" 
								title="Name can only contain letters, @, / or spaces." value="<c:out value="${staff.getStaffFName()}" />"required>
							</div>
							<div class="group-input">
								<label for="lname">Last Name : </label>
								<input type='text' name='staffLName' pattern= "[A-Za-z @/]+" 
								title="Name can only contain letters, @, / or spaces." value="<c:out value="${staff.getStaffLName()}" />"required>
							</div>
							<div class="group-input">
								<label for="email">Email : </label>
								<input type='text' name='staffEmail' value="<c:out value="${staff.getStaffEmail()}"/>" readonly>
							</div>
							<input type='hidden' name='staffPassword' value="<c:out value="${staff.getStaffPassword()}" />">
<<<<<<< HEAD:WebContent/ActorAdmin/adminUpdateCashier.jsp


=======
							
							
>>>>>>> 4f2c96ca0ed68185d8abbdf616e7bac64e0efa4a:WebContent/adminUpdateCashier.jsp
							<div class="group-input">
								<label for="phone">Phone No. : </label>
								<input type='tel' name='staffPhone' value="<c:out value="${staff.getStaffPhone()}"/>" pattern="[0]{1}[0-9]{9,11}" 
								title="Please exclude '-' or any special charaters. e.g. 0123456789" required>
							</div>
<<<<<<< HEAD:WebContent/ActorAdmin/adminUpdateCashier.jsp

=======
							
>>>>>>> 4f2c96ca0ed68185d8abbdf616e7bac64e0efa4a:WebContent/adminUpdateCashier.jsp
							<div class="group-input">
								<label for="verification">Verify Status : </label>
								<select name='staffType'>
									<option value="0" <c:if test = "${staff.getStaffType() == 0}"> selected </c:if>>Not Verified</option>
									<option value="1" <c:if test = "${staff.getStaffType() == 1}"> selected </c:if>>Verified </option>
								</select> 
<<<<<<< HEAD:WebContent/ActorAdmin/adminUpdateCashier.jsp

							</div>

=======
								
							</div>
							
>>>>>>> 4f2c96ca0ed68185d8abbdf616e7bac64e0efa4a:WebContent/adminUpdateCashier.jsp
							<br>
							<button type="submit" class="btnenable primary-btn">Update</button>	
							</form>
						<a href="#" onclick="viewCashier()"><button class="primary-btn" style="border:none; float:right;">Back</button></a>
						</div>								
				</div>				
			</div>			
		</div>		
	</div>	
</body>
</html>