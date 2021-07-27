<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	if (session.getAttribute("custid") == null) {
		response.sendRedirect("login.jsp");
	}
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
	        .center {
	          display: block;
	          margin-left: auto;
	          margin-right: auto;
	          width: 50%;
	        }
	        .navv{
	        	float:right;
	        }
	        table{
	        max-width:1000px;
	        }
	        th{
	        font-size:90px;
	        font-color:red;
	        }
	        .button {
			  background-color: #303030; 
			  border: solid;
			  border-radius: 10%;
			  color: white;
			  text-align: center;
			  font-size: 12px;
			  font-weight: 1000;
			  margin: 4px ;
			  cursor: pointer;
			}
			.removebtn {
				border:none;
				font-size: 14px;
				font-weight: 500;
				color: #ffffff;
				background: #ff4d4d;
				text-transform: uppercase;
			}
			
			.dropdown {
				width: 70%;
				height: 100%;
			}
			
			.address th,td{
				padding: 5px;
				margin-top: 30px;
			}
			
			.address select,option {
				border-radius: 4px;
    			border: none;
    			background-color: #f2f2f2;
    			padding: 12px;
			}
			
			.primary-btn a, input{
				padding: 5px;
			}
	    </style>
		
		<title>Order Details | Konichiwa Cafe</title>
	</head>
	
	<body class="example">
		<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                    	<a href="index.jsp"><i class="fa fa-home  "></i> Home</a> 
	                        <span>Konichiwa Cafe</span> 
	                        <div class="navv">
	                        	<a href="OrdersController?action=trackOrder&i=<%= session.getAttribute("custid") %>"><i class="fa fa-motorcycle"></i> Track</a>
	                        	<a href="ItemController?action=viewItem"><i class="fa fa-list-alt "></i> Menu</a> 
	                        	<a href="CartController?action=showcart&i=<%= session.getAttribute("custid") %>"><i class="fa fa-shopping-cart "></i> Cart</a>
	                        	<a href="CustomerController?action=viewCustomer&i=<%= session.getAttribute("custid") %>"><i class="fa fa-user"></i> Account</a>
	                        	<a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>"><i class="fa fa-sign-out "></i> Logout</a>  
	                        </div>                       
	                    </div>
	                </div>
	            </div>
	        </div>
		</div>
		
		<div align="center">
		<br><br><br>
			<h2>Order Details</h2>
			
			<div class="cart-table">
				<table class="address">
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
							<td>RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${orders.getItempr()}"/></td>
							<td>RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${orders.getItempr()*orders.getItem_OrderQty()}"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br><br>
			<h2>Payment Details</h2>
			
			<div class="cart-table">
				<table class="address">
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
						<td>RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${paymentdetails.getDeliveryFee()}"/></td>
						<td>RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${paymentdetails.getTransactionFee()}"/></td>
						<td>RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${paymentdetails.getTotalPrice()+paymentdetails.getTransactionFee()+paymentdetails.getDeliveryFee()}"/></td>
					</tr>

				</table>
				<br>
				<a href="OrdersController?action=trackOrder&i=<%= session.getAttribute("custid") %>"><button class="primary-btn" style="border:none">Back</button></a>
			</div>
			
		</div>
	</body>
</html>