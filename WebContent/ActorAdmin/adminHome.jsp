<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import= "java.text.Format" %>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.Date"%>
<% int id = (Integer) request.getAttribute("adminId");
	String staffname = (String) request.getAttribute("staffName");
	
	Format dateFormat = new SimpleDateFormat("EEEEE");
	Format dateFormat2 = new SimpleDateFormat("MMMM dd, yyyy");
	
	String day = dateFormat.format(new Date());
	String date = dateFormat2.format(new Date()); 

	int bill=0;
%>


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
			    
			.removebtn 
			{
				border:none;
				font-size: 14px;
				font-weight: 500;
				color: #ffffff;
				background: #e7ab3c;
				text-transform: uppercase;
			}
			.address th,td
			{
				padding: 5px;
				margin-top: 30px;
				
			}
			.container2{
        	text-align:center;
        	overflow-x: hidden;
	        background-color:#e7ab3c; 
	        padding-top: 30px;
	        padding-bottom: 30px;
        	}

	        .container2 p {
	        	text-align: center;
	        	font-size: 36px;
				font-family: "Muli", sans-serif;
				color: white;
				font-weight: 600;
				line-height: 26px;
				margin: 0 0 15px 0;
			}
			.container2 h1 {
	        	text-align: center;
	        	font-size: 20px;
				font-family: "Muli", sans-serif;
				color: white;
				font-weight: 400;
				line-height: 26px;
				margin: 0 0 15px 0;
			}
			.container2 h2 {
	        	text-align: center;
	        	font-size: 15px;
				font-family: "Muli", sans-serif;
				color: white;
				font-weight: 400;
				line-height: 26px;
				margin: 0 0 15px 0;
			}
			.container3{
				margin:auto;
				width:60%;
				text-align: justify;
			}
			footer {
			  	text-align: center;
			  	padding: 1px;
			 	background-color: black;
			  	color: white;
			}
			.fa-instagram {
		      color: white;
		    }
		    .fa-facebook {
		      color: white;
		    }
		    
		    footer a{
			  color: white;
			  background-color: transparent;
			  text-decoration: none;
			}
			footer p{
				text-align: center;
	        	font-size: 15px;
				font-family: "Muli", sans-serif;
				color: #636363;
				font-weight: 400;
			}
		</style>
		<meta charset="ISO-8859-1">
		<title>Admin Home | Konichiwa Cafe</title>
	</head>
	<body class="example" class="center">
		<input type="hidden" id="staffid" value="<%=id %>" height="0"/>
		<input type="hidden" id="staffname" value="<%=staffname %>" />
		<script type="text/javascript">
			var jsStaffID = document.getElementById("staffid").value;
			var jsStaffID2;
			var jsStaffName = document.getElementById("staffname").value;
			var jsStaffName2;
			
			if(localStorage.getItem("adminID")!=null && localStorage.getItem("staffName")!=null ) 
			{
				jsStaffID2 = localStorage.getItem("adminID");
				jsStaffName2 = localStorage.getItem("staffName");
			} 
			
			else 
			{
				localStorage.setItem("adminID", jsStaffID);
				jsStaffID2 = jsStaffID;
				localStorage.setItem("staffName", jsStaffName);
				jsStaffName2 = jsStaffName;
			}
			
			window.reload();
						
			function logoutFunction()
			{
				localStorage.removeItem("adminID");
				window.location.replace("../ActorAdmin/loginStaff.jsp");
			}
			
			function viewCustomer(){
				location.href = "CustomerController?i=all";
			}
			function viewCustomerActive(){
				location.href = "CustomerController?i=active";
			}
			function viewCustomerInactive(){
				location.href = "CustomerController?i=inactive";
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
			//baru sampai sini Aiman ^
			function viewMenu(){
				location.href = "ItemController?action=adminViewItem";
			}
			function viewReport(){
				location.href = "ReportController?action=adminViewReport";
			}
			function addItem(){
				location.href = "ItemController?action=addItem";
			}
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
             <li><a href="#">Hi, <c:out value="${admin.staffFName} ${admin.staffLName}"></c:out> !</a>
                 <ul class="dropdown">
                 	<li><a href="#" onclick="viewStaff()"><i class="fa fa-user "></i> Profile</a></li>
                     <li><a href="#" onclick="logoutFunction()"><i class="fa fa-sign-out "></i> Logout</a></li>
                     
                 </ul>
             </li>
         </ul>
         				                    
     	</nav>
    </div>		
	<section class="blog-details spad">
	<div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
				    	<div class="blog-detail-title">            
				            <h2>Konichiwa Cafe Online Food System</h2>
				        </div>
    <!-- From Banner Section Begin -->
         <div class="banner-section spad">
             <div class="container-fluid">
                 <div class="row">
                     <div class="col-lg-4">
                         <div class="single-banner">
                             <img src="img/ayam.png" alt="">
                         </div>
                     </div>
                     <div class="col-lg-4">
                         <div class="single-banner">
                             <img src="img/pexels1.jpg" alt="">
                         </div>
                     </div>
                     <div class="col-lg-4">
                         <div class="single-banner">
                             <img src="img/pexels2.jpg" alt="">
                         </div>
                     </div>
                 </div>
             </div>
         </div>
    <!-- Banner Section End -->
    </div>
    </div>
    </div>
    </div>
		<div class="container2" >
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        
                         <p>About Us</p>
                         <h1>We Are Syariah Compliance Restaurant</h1>
                         <div class="container3">
                         <h2>Konichiwa Cafe is a premier and creative Japanese Restaurant that has been proudly serving the local and tourist beyond since 2016. 
                         Since day one, our mission has been to provide high-quality Asian food for those who seek skillful cooking and an extraordinary dining experience. 
                         Go ahead and make a reservation to find out firsthand why clients keep coming back to our Muslim Japanese Restaurant.</h2>
                       	 </div>
                </div>
				</div>
            </div>
        </div> 
        
    </section>
    <footer>
    <br>
     <p><i class="fa fa-fw fa-instagram"></i><a href="https://www.instagram.com/konichiwacafe/?hl=en"> konichiwacafe</a>
     <i class="fa fa-fw fa-facebook"></i><a href="https://www.facebook.com/Konichiwa-Cafe-146233119211261/"> Konichiwa Cafe</a>
	 <p style="padding-left:700px;"><i class="fa fa-fw fa-copyright ">2021Beelab,Inc.AllRightsReserved</i></p>
	</footer>
	</body> 	
</html>