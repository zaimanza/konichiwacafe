<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    	
    	<style type="text/css">
    	
    		table, th, td { 
    			border: 1px solid black; 
    			padding: 15px;
    		}
    		
    		 table.center { margin-left: auto; margin-right: auto; }
    		 
	        .center {
	          max-width: 1000px;
			  margin: auto;
	        }
	        .navv{
	        	float:right;
	        }
			
			/* Create four equal columns that floats next to each other */
			.column {
			  float: right;
			  width: 33%;
			  padding:15px;
			}
			.row > .column {
			  padding: 15px;
			}
			
			/* Content */
			.content {
			  background-color: white;
			  padding: 15px;
			  margin:auto;
			}
			.row:after {
			  content: "";
			  display: table;
			  clear: both;
			}
			
			* Responsive layout - makes a two column-layout instead of four columns */
			@media screen and (max-width: 900px) {
			  .column {
			    width: 50%;
			  }
			}
			
			/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
			@media screen and (max-width: 600px) {
			  .column {
			    width: 100%;
			  }
			}
			
			h3  {
				font-size: 19px;
				font-weight: 500;
				color: black;
				align: center;
				display: inline-block;
				
			}
			h4  {
				
				font-size: 17px;
				font-weight: 500;
				color: black;
				align: center;
				display: inline-block;
			}
			h5{
				font-size: 14px;
				font-weight: 400;
				color: 	#686868;
				align: center;
				display: inline-block;
				margin-left: 13px;
			}
			h6{
				font-size: 19px;
				font-weight: 700;
				color: 	red;
				align: center;
				display: inline-block;
				margin-left: 13px;
			}
			.p {
				font-size: 30px;
				font-family: "Muli", sans-serif;
				color: #636363;
				font-weight: 400;
				line-height: 26px;
				margin: 0 0 15px 0;
			}
			
			.alert {
		      opacity: 1;
		      transition: opacity 0.6s;
		      border-radius: 30px;
		      width: 30%;
		      margin-left:auto;
		      margin-right:auto;
		    }
			
		    .alert.success{background-color: #97BD64;}
		
		    .closebtn {
		      margin-left: 15px;
		      color: white;
		      font-weight: bold;
		      float: right;
		      font-size: 20px;
		      line-height: 10px;
		      cursor: pointer;
		      transition: 0.3s;      
		    }
		    
	    </style>
	    
		<title>Items | Konichiwa Cafe</title>
	</head>	
	<body class="example">
	<script type="text/javascript">
		function logoutFunction()
		{
			localStorage.removeItem("adminID");
			window.location.replace("loginStaff.jsp");
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
		<br><br>
		
		<div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                        	<br><br>
                            <p style="font-size:30px">Order Details</p>
                            <br><br>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
        
        
        <div class="main">
		<div class="center" align="center">
        <table border="1">
	
		<tr>
						<th>No.</th>
						<th>Item Name</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Total Price</th>						
					</tr>
						
					<c:forEach items="${orderdetails}" var="orders">
						<% bill++;%>
						<tr>
							<td><% out.print(bill);%></td>
							<td><c:out value="${orders.getItemName()}" /></td>
							<td><c:out value="${orders.getItem_OrderQty()}" /></td>
							<td style="text-align: center;">RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${orders.getItempr()}"/></td>
							<td style="text-align: center;">RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${orders.getItempr()*orders.getItem_OrderQty()}"/></td>
						</tr>
					</c:forEach>

		</table>
		</div>
		</div>
		<br><br>
		
		<div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                        	<br><br>
                            <p style="font-size:30px">Payment Details</p>
                            <br><br>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
        
        
        <div class="main">
		<div class="center" align="center">
        <table border="1">
        	<tr>
						<th>Payment No.</th>
						<th>Payment Method</th>
						<th>Delivery Fee</th>
						<th>Transaction Fee</th>
						<th>Grand Total</th>						
					</tr>
					<tr>
						<td><c:out value="${paymentdetails.getPaymentID()}" /></td>
						<td><c:out value="${paymentdetails.getPaymentMethodName()}" /></td>
						<td style="text-align: center;">RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${paymentdetails.getDeliveryFee()}"/></td>
						<td style="text-align: center;">RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${paymentdetails.getTransactionFee()}"/></td>
						<td style="text-align: center;">RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${paymentdetails.getTotalPrice()+paymentdetails.getTransactionFee()+paymentdetails.getDeliveryFee()}"/></td>
					</tr>
        </table>
        <br>
			
			<div class="container">
            	<div class="row">
	                <div class="col-lg-12">
	                    <div class="blog-details-inner">
	                        <div class="blog-detail-title">
	                        	<br><br>
	                            <p style="font-size:30px">Rider Details</p>
	                            <br><br>
	                        </div>
	                    </div>
	                 </div>
	            </div>
	        </div>
	        
	        <table border="1">
	
		<tr>
						<th>Rider Id</th>
						<th>Name</th>
						<th>Phone Number</th>						
					</tr>
						
						<tr>
							<td><c:out value='${rider.getRiderId()}' /></td>
							<td><c:out value='${rider.getFName()} ${rider.getLName()}' /></td>
							<td><c:out value='${rider.getPhone()}' /></td>
						</tr>

		</table>
		<br>
        <br>
		
		<div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                        	<br><br>
                            <p style="font-size:30px">Customer Details</p>
                            <br><br>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
		
		<table border="1">
	
		<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Phone Number</th>						
					</tr>
						
						<tr>
							<td><c:out value='${customer.fname} ${customer.lname}' /></td>
							<td><c:out value='${customer.phone}' /></td>
							<td><c:out value='${customer.phone}' /></td>
						</tr>

		</table>
        	<br>
			<a href="ReportController?action=adminViewReport"><button class="primary-btn" style="border:none">Back</button></a>
			<br><br>
		</div>
		</div>
	</body>
</html>