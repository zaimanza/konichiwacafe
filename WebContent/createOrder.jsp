<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
			
			.address td {
				padding: 5px;
				margin-top: 30px;
				border:none;
							
			}
			
			.address select,option {
				border-radius: 4px;
    			border: none;
    			background-color: #f2f2f2;
    			padding: 12px;
			}
			
	    </style>
	    
		<title>Create Order | Konichiwa Cafe</title>
	</head>
	
	<script>
    	function successPymt(){
        	window.alert("Payment Successful! Now, sit back while we prepare your food.");
        }
    </script>
	
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
			<h2>Billing Details</h2>
			
			<div class="cart-table">
				<form name="checkoutForm" method="post" action="OrdersController?action=checkout" onsubmit="successPymt()">
					<table class="address">
						<tr>
							<td style="font-size: 20px; font-weight:700;">Select Delivery Address</td>
							<td style="text-align:left; padding-left:80px;">
							<c:forEach items="${cust}" var="address">
								<input type="radio" name="DeliveryAddress" id="DeliveryAddress" value="${address.addressstreet}, ${address.addresspostcode} ${address.addresscity}, ${address.addressstate}." required>
								<c:out value="${address.addressstreet}, ${address.addresspostcode} ${address.addresscity}, ${address.addressstate}" />
								<br>
							</c:forEach>
							</td>
						</tr>
						
						<tr>
							<td style="font-size: 20px; font-weight:700;">Subtotal </td>
							<td>RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${totalPrice}"/></td>
						</tr>
						
						<tr>
							<td style="font-size: 20px; font-weight:700;">Delivery Fee </td>
							<td>RM5.00 (Flat rate) </td>
						</tr>
						
						<tr>
							<td style="font-size: 20px; font-weight:700;">Transaction Fee </td>
							<td>RM1.20 (Flat rate) </td>
						</tr>
						
						<tr>
							<td style="font-size: 20px; font-weight:700;">Grand Total </td>
							<td>
								<c:set var="grandTotal" value="${0}" />
								<c:set var="grandTotal" value="${totalPrice + 5.0 + 1.2}"/>
								RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${grandTotal}"/>
							</td>
						</tr>
						
						<tr>
							<td style="font-size: 20px; font-weight:700;">Select Payment</td>
							<td>
								<select name="paymentMethod" id="paymentMethod" class="dropdown" required>
									<option value="">Choose One</option>
									<option value="1">Online Banking</option>
									<option value="2">Credit/Debit Card</option>
								</select>
							</td>
						</tr>
					</table>
					<br>
					
					<input type="hidden" value="${grandTotal}" name="grandTotal" id="grandTotal">
					<input type="hidden" value="${totalPrice}" name="total" id="total">
					<a	href="AddressController?action=addAddress&i=<%=session.getAttribute("custid")%>" class="primary-btn" >Add New Address</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="Make Payment" class="primary-btn">
				</form>
			</div>
		</div>
	</body>
</html>