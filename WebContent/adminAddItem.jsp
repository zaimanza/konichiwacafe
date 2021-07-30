<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import= "java.text.Format" %>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.Date"%>
<% 
	
	Format dateFormat = new SimpleDateFormat("EEEEE");
	Format dateFormat2 = new SimpleDateFormat("MMMM dd, yyyy");
	
	String day = dateFormat.format(new Date());
	String date = dateFormat2.format(new Date()); 

	int bill=0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/orderid.css" type="text/css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<title>Add New Item | Konichiwa Cafe</title>
</head>
<style>
	.center 
	{
	   	display: block;
	       margin-left: auto;
	       margin-right: auto;
	       width: 85%;
	       padding-bottom:100px;
	  	}		
	.table th
	{
		font-size:10px;
	}
	    
	.address th,td
	{
		padding: 5px;
		margin-top: 30px;
		
	}
	  
</style>
</head>
<body class="example">
<script type="text/javascript">
			
	function logoutFunction()
	{
		localStorage.removeItem("adminID");
		window.location.replace("loginStaff.jsp");
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
	function updateStaff(){
		location.href = "StaffController?action=updateProfile&id=" + localStorage.getItem("adminID") + "";
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
	
	//form
	function submitAdd(){
		var str = document.getElementById("name").value;
		var trimmed = str.trim(); //remove spaces beginning and end
		document.getElementById("name").value = trimmed;
		
		document.getElementById("createItem").action="ItemController?action=addItem&id="+ localStorage.getItem("adminID") + "";
	}
	function fileValidation() {
        var fileInput = document.getElementById('image');
          
        var filePath = fileInput.value;
      
        // Allowing file type
        var allowedExtensions = 
                /(\.jpg|\.jpeg|\.png)$/i;
          
        if (!allowedExtensions.exec(filePath)) {
            alert('Invalid file type');
            fileInput.value = '';
            return false;
        } 
        else 
			return true;
	}
	
	//price
	document.getElementById('price').addEventListener('change', force2decimals);

	function force2decimals(event) {
		event.target.value = parseFloat(event.target.value).toFixed(2);
	}
	
</script>
		<!-- Navigation bar -->
		<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                   		<a href="indexStaff.jsp"><i class="fa fa-home  "></i> Home</a> 
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
                     <li><a href="#" onclick="preparingOrder()"><i class=" "></i> Preparing</a></li> <!-- btn ready-->
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
					<h2>Add New Item</h2>
					<form name="createItem" id="createItem" action="" onsubmit="submitAdd()" method="post" enctype="multipart/form-data">
						
						<div class="group-input">
                            <label for="itemname">Item name : </label>
                            <input type="text" id="name" name="name" pattern= "[A-Za-z ]+" required>
                        </div>
                        
                        <div class="group-input">
                            <label for="itemprice">Item price :  </label>
                            <input type="number" id="price" name="price" placeholder="RM" step=".01" onchange="force2decimals(this)" required>
                        </div>
                        
                        <div class="group-input">
                            <label for="itemstock">Item stock : </label>
                            <input type="number" name="stock" min=0 required>
                        </div>
                        
                        <div class="group-input">
                            <label for="itemdesc">Item description : </label>
                            <input type="text" name="desc" required>
                        </div>
                        
                        <div class="group-input">
                            <label for="itemimage">Item image : </label>
                            <input type="file" name="image" id="image" onchange="fileValidation()" accept="image/png, image/jpg, image/jpeg" required>
                        </div>
						
						<div class="group-input">
							<label for="itemcategory">Item category : </label>
							<select name="itemcategoryid">
								<option selected disabled>Please choose one</option>
								<option value="1">Teppanyaki</option>
								<option value="2">Donburi</option>
								<option value="3">Japanese Noodle</option>
								<option value="4">Bento</option>
								<option value="5">Appetizer</option>
								<option value="6">Futomaki</option>
								<option value="7">Hand Roll</option>
								<option value="8">Malaysian Cuisine</option>
							</select>
						</div>
						
						<input type="submit" value="Add" class="btnenable primary-btn">
					</form>
					</div>
					</div>
					</div>
					</div>
					</div>
	</body>
</html>