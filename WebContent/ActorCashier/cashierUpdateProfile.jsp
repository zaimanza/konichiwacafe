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
		localStorage.removeItem("cashierID");
		window.location.replace("../ActorAdmin/loginStaff.jsp");
	}
	
	function newOrder() {
		location.href = "OrdersController?action=cashierViewNewOrder";
	
	}
	function preparingOrder() {
		location.href = "OrdersController?action=cashierViewPrepareOrder";
	
	}
	function trackOrder() {
		location.href = "OrdersController?action=cashierViewTrackOrder";
	
	}
	//baru sampai sini Aiman ^
	function viewMenu(){
		location.href = "StockController?action=cashierViewItemList";
	}
	
	function viewStaff(){
		location.href = "StaffController?action=profile&id=" + localStorage.getItem("cashierID") + "";
	}
	function updateStaff(){
		location.href = "StaffController?action=updateProfile&id=" + localStorage.getItem("cashierID") + "";
	}
	function validate() {
		var x = document.updateForm.staffPhone.value;
		var newFName = document.updateForm.staffFName.value;
		var newLName = document.updateForm.staffLName.value;
		var newName = newFName+" "+newLName;
		
		if (x.length <10){
			alert("Phone No. too short!");
			return false;
		}
		
		if(newName != localStorage.getItem("staffName")){
			localStorage.setItem("staffName",newName);
		}
	}
	//baru sampai sini Hanis ^
	
	
</script>
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
           		<li><a href="#" onclick="viewMenu()">Manage Menu</a>
                 </li>
             <li><a href="#">Manage Orders</a>
                 <ul class="dropdown">
                     <li><a href="#" onclick="newOrder()"><i class=" "></i> New Orders</a></li> <!-- assign rider-->
                     <li><a href="#" onclick="preparingOrder()"><i class=" "></i> Preparing</a></li> <!-- btn ready-->
                     <li><a href="#" onclick="trackOrder()"><i class=" "></i> Track Orders</a></li>				                                
                 </ul>
             </li>   
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
					<form name="updateForm" action="StaffController?action=updateStaff" method="post" onsubmit="return validate()">
						<input type='hidden' name='staffId' id="staffId" value="<c:out value="${staff.getStaffId()}" />">
						<div class="group-input">
							<label for="fname">First Name : </label>
							<input type='text' name='staffFName'  value="<c:out value="${staff.getStaffFName()}" />" pattern= "[A-Za-z ]+" required>
						</div>
						<div class="group-input">
							<label for="lname">Last Name : </label>
							<input type='text' name='staffLName' value="<c:out value="${staff.getStaffLName()}" />" pattern= "[A-Za-z ]+" required>
						</div>
						<div class="group-input">
							<label for="email">Email : </label>
							<input type='text' name='staffEmail' value="<c:out value="${staff.getStaffEmail()}"/>" readonly>
						</div>
						<input type='hidden' name='staffPassword' value="<c:out value="${staff.getStaffPassword()}" />">
						<input type='hidden' name='staffType' value="<c:out value="${staff.getStaffType()}" />">
						
						<div class="group-input">
							<label for="phone">Phone No. : </label>
							<input type='tel' name='staffPhone' value="<c:out value="${staff.getStaffPhone()}"/>" pattern="[0]{1}[0-9]{9,11}" required>
						</div>
						
						<br>
						<button type="submit" class="btnenable primary-btn">Update</button>	
						</form>	
						</div>								
				</div>				
			</div>			
		</div>		
	</div>	
</body>
</html>