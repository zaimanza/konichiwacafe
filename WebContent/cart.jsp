<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	        /* font-color:red; */
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
			
	    </style>
    
		<title>Cart | Konichiwa Cafe</title>
</head>
<script>
	function ask(){
		if(confirm("Are you sure to remove this item from cart?") == true)
			return true;
		else 
			return false;
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
		<h2>My Cart</h2>	
			<c:choose>
				<c:when test="${items == null}">
					<div class="cart-table">
							<table class="address">	
						    	<tr>
						        	<th>No.</th>
						            <th>Name</th>
						            <th>Quantity</th>
						            <th>Price</th>
						            <th>Total Price</th>
						            <th>Remove</th>
						        </tr>
								<tr>
					        		<td colspan=6 align="center">Your cart is empty</td>
					        	</tr>
				        	</table>
			        	</div>
				</c:when>
				<c:otherwise>
					<div class="cart-table">
					<table class="address">	
				    	<tr>
				        	<th>No.</th>
				            <th>Name</th>
				            <th>Quantity</th>
				            <th>Price</th>
				            <th>Total Price</th>
				            <th>Remove</th>
				        </tr>		         

			        <c:set var="totalPrice" value="${0}" />  
					<c:forEach items="${items}" var="item">
				    	<%bill++; %>
						<tr>
							<td style="width: 20px;"><% out.print(bill); %></td>  
							<td style="width: 50px;"><c:out value="${item.getName()}"/></td>
							<td style="width: 20px;">
								<div class="w3-container">
									<a href="CartController?action=minus&i=<c:out value="${item.getItemid()}"/>"><button class="button button1" >-</button></a>&nbsp;
									<c:out value="${item.getQuantity()}"/>
									<a href="CartController?action=plus&i=<c:out value="${item.getItemid()}"/>"><button class="button button1" >+</button></a> 
								</div>
							</td>
							<td style="width: 50px;">RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.getPrice()}"/></td>
							<td style="width: 50px;">RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.getPrice()*item.getQuantity()}"/></td>
							<td style="width: 20px;"><a href="CartController?action=remove&i=<c:out value="${item.getItemid()}"/>"><button class="removebtn" onclick="return ask()" style="border:none">REMOVE</button></a></td>
						</tr>
						
						<c:set var="total" value="${item.getPrice()*item.getQuantity()}"/>
						<c:set var="totalPrice" value="${totalPrice+total}" />						
		        	</c:forEach>		       
		        	<tr >
		        		<th colspan='6'>Grand Total: RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${totalPrice}"/></th>
		        	</tr>
		        </table>
			        <div class="cart-table"><br>
			        	<a href="OrdersController?action=createOrder&custID=<%= session.getAttribute("custid") %>&total=${totalPrice}"><button class="primary-btn" style="border:none">Check Out</button></a>
					</div>
			</div>
				</c:otherwise>
		</c:choose>
</div>
</body>
</html>