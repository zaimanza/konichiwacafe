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
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/orderid.css" type="text/css">
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
    </style>
<title>Track Orders | Konichiwa Cafe</title>
</head>
<body class="example" class="center">
<script type="text/javascript">
	function logoutFunction()
	{
		localStorage.removeItem("cashierID");
		window.location.replace("loginStaff.jsp");
	}
		
	function viewStaff(){
		location.href = "StaffController?action=profile&id=" + localStorage.getItem("cashierID") + "";
	}
	//baru sampai sini Hanis ^
	
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
	<div class="center">
		<br><br><br>
		<h2 style="text-align:center">Track Orders</h2>	
		<div id="Pickup" >
			<div class="cart-table">		
	  			<c:set var="orderCheck" value="${listTrack}"/>
					<c:choose> 
						<c:when test="${orderCheck != null}">
							<table class="address">	
								<tr>
			        				<th>Order ID</th>
			        				<th>DATE</th>
			        				<th>ADDRESS</th>
			        				<th>Customer ID</th>
			        				<th>Staff ID</th>
			        				<th>Order Status</th>
			        			</tr>
					        		<c:forEach items="${listTrack}" var="order">
						        		<tr>
						            		<td><a class="orderid" href="OrdersController?action=cashierTrackOrderdetails&i=<c:out value="${order.orderID}" />"><c:out value="${order.orderID}" /></a></td>        
						                    <td><c:out value="${order.orderDate}" /></td>  
						                    <td><c:out value="${order.getDeliveryAddress()}" /></td>  
						                    <td><c:out value="${order.custID}" /></td>  
						                   	<td><c:out value="${order.staffID}" /></td>  
						                   	<td>
						                   		<c:choose>
						                   			<c:when test="${order.getOrderStatus()=='3'}" >
						                   				Ready for Pickup
						                   			</c:when>
						                   			<c:otherwise>
						                   				Out for Delivery
						                   			</c:otherwise>
						                   		</c:choose>
						                   	</td>     
						          		</tr>
					      			</c:forEach>
							</table>	
						</c:when>
						<c:otherwise>			    			
			    			<table class="address">
		        			<tr>
		        				<td colspan=6>No Orders</td>
		        			</tr> 
						</table>
			  			</c:otherwise>
					</c:choose>
					
			</div>
		</div>	
		<br><br>
		
	</div>	
</body>
</html>