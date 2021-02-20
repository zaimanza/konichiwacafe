<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
			
			.address a:hover{
			 	color:#e7ab3c;
			}
			
			.primary-btn a, input{
				padding: 5px;
			}
	    </style>
		
		<title>Order History | Konichiwa Cafe</title>
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
			<h2>My Order</h2>
			<c:choose>
				<c:when test="${empty order}">
					<div class="cart-table">
						<table class="address">
							<tr>
								<th>No.</th>
								<th>Order No.</th>
								<th>Order Date</th>
								<th>Order Status</th>
							</tr>
				        	<tr>
				        		<td colspan=4 align="center">No order</td>
				        	</tr>
				        </table>
				   </div>       	
				</c:when>
				<c:otherwise>
				<div class="cart-table">
					<table class="address">
						<tr>
							<th>No.</th>
							<th>Order No.</th>
							<th>Order Date</th>
							<th>Order Status</th>
						</tr>
						<c:forEach items="${order}" var="orders">
							<% bill++;%>
							<tr>
								<td><% out.print(bill);%></td>
								<td><a href="OrdersController?action=orderdetails&i=<c:out value="${orders.orderID}" />"><c:out value="${orders.orderID}" /></a></td>
								<td><c:out value="${orders.getOrderDate()}" /></td>
								
								<c:if test="${orders.getOrderStatus().equals('1')}">
								<td><c:out value="Order received" /></td>
								</c:if>  
								<c:if test="${orders.getOrderStatus().equals('2')}">
									<td><c:out value="Order is being prepared" /></td>
								</c:if>  
								<c:if test="${orders.getOrderStatus().equals('3')}">
									<td><c:out value="Order is ready for delivery" /></td>
								</c:if>
								<c:if test="${orders.getOrderStatus().equals('4')}">
									<td><c:out value="Order has been picked up by Rider" /></td>
								</c:if>
								<c:if test="${orders.getOrderStatus().equals('5')}">
									<td><c:out value="Order has been delivered" /></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
				</c:otherwise>
        	</c:choose>
		</div>
	</body>
</html>