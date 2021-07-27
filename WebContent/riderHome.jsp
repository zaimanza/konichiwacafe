<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String e = (String) request.getAttribute("email"); %>

<%
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
    

	<style>
		.center {
          	display: block;
          	margin-left: auto;
          	margin-right: auto;
          	width: 85%;
          	padding-bottom:100px;
        }
        .navv{
        	float:right;
        }	
		
	    .table th{
	        font-size:10px;
	    }
	    .removebtn {
				border:none;
				font-size: 14px;
				font-weight: 500;
				color: #ffffff;
				background: #e7ab3c;
				text-transform: uppercase;
			}

	  .address th,td{
			padding: 5px;
			margin-top: 30px;
		
		}
  
	</style>
<meta charset="ISO-8859-1">
<title>Home Rider</title>
</head>
<body class="example" class="center">

		<input type="hidden" id="emailJSP" value="<%=e %>" height="0"/>
		<script type="text/javascript">
			var jsEmail = document.getElementById("emailJSP").value;
			var jsEmail2;
			if(localStorage.getItem("email")!=null) {
				jsEmail2 = localStorage.getItem("email");
				//document.getElementById("p1").innerHTML = jsEmail2;
			} else {
				localStorage.setItem("email", jsEmail);
				jsEmail2 = jsEmail;
				//document.getElementById("p1").innerHTML = jsEmail2;
			}
			window.reload();
			function logoutFunction(){
				localStorage.removeItem("email");
				window.location.replace("loginRider.jsp");
			}
			
			function viewProfile(){
				window.location.replace("RiderController?action=viewRider&email="+ jsEmail2 + "");
			}
			
			openPage = function() {
				location.href = "OrdersController?action=viewRiderOrders&email=" + localStorage.getItem("email") + "";
				}
			
		</script>

	<!-- Navigation bar -->
	<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                    	  <a href="indexRider.jsp"><i class="fa fa-home  "></i> Home</a> 
	                        <span>Konichiwa Cafe</span> 
	                        <div class="navv">
	                           	<a href="#" onclick="viewProfile()"><i class="fa fa-user"></i> Profile</a>
	                        	<a class="active" href="#" onclick="logoutFunction()"><i class="fa fa-sign-out "></i> Logout</a>  
	                        </div>                       
	                    </div>
	                </div>
	            </div>
	        </div>
	</div>
		
		
	<div class="center">
		<br><br><br>
		<h2 style="text-align:center">Pickup</h2>	
		<div id="Pickup" >
			<div class="cart-table">		
	  			<c:set var="orderCheck" value="${ordersReady}"/>
					<c:choose> 
						<c:when test="${orderCheck != null}">
							<table class="address">	
								<tr>
			        				<th>Order ID</th>
			        				<th>DATE</th>
			        				<th>ADDRESS</th>
			        				<th>Customer ID</th>
			        				<th>Staff ID</th>
			        				<th>I am picking up</th>
			        			</tr>
					        		<c:forEach items="${ordersReady}" var="order">
						        		<tr>
						            		<td><a class="orderid" href="OrdersController?action=riderorderdetails&i=<c:out value="${order.orderID}" />"><c:out value="${order.orderID}" /></a></td>        
						                    <td><c:out value="${order.orderDate}" /></td>  
						                    <td><c:out value="${order.getDeliveryAddress()}" /></td>  
						                    <td><c:out value="${order.custID}" /></td>  
						                   	<td><c:out value="${order.staffID}" /></td>  
						                   	<td><a href="OrdersController?action=pickupOrder&orderid=${order.orderID}"><button class="removebtn" style="border:none">Pickup</button></a></td>    
						          		</tr>
					      			</c:forEach>
							</table>	
						</c:when>
						<c:otherwise>			    			
			    			<table class="address">
		        			<tr>
		        				<td colspan=6>No Orders to Pickup</td>
		        			</tr> 
						</table>
			  			</c:otherwise>
					</c:choose>
					
			</div>
		</div>	
		<br><br>
		
		<h2 style="text-align:center">Deliver</h2>	
		<br>
		<div class="cart-table">
					
  			<c:set var="orderPick" value="${ordersPickedUp}"/>
			<c:choose> 
				<c:when test="${orderPick != null}">
					<table class="address">
	    				<tr>
	        				<th>Order ID</th>
	        				<th>DATE</th>
	        				<th>ADDRESS</th>
	        				<th>Customer ID</th>
	        				<th>Staff ID</th>
	        				<th>Arrive at location</th>
	        			</tr>
	        
	        			<c:forEach items="${ordersPickedUp}" var="order">
	        				<tr>
	            				<td><a class="orderid" href="OrdersController?action=riderorderdetails&i=<c:out value="${order.orderID}" />"><c:out value="${order.orderID}" /></a></td>        
			                    <td><c:out value="${order.orderDate}" /></td>  
			                    <td><c:out value="${order.getDeliveryAddress()}" /></td>  
			                    <td><c:out value="${order.custID}" /></td>  
			                   	<td><c:out value="${order.staffID}" /></td>  
	                    		<td><a href="OrdersController?action=deliverOrder&orderid=${order.orderID}"><button class="removebtn" style="border:none">Delivered</button></a></td> 
	            			</tr>
	            			
	        			</c:forEach>
					</table>
					
				</c:when>
					<c:otherwise>		    			
		    			<table class="address">
		         			<tr>
		        				<td colspan=6>No Orders to Deliver</td>
		        			</tr> 
						</table>
		  			</c:otherwise>
		  			
			</c:choose>
		</div>
		
	</div>	
		
</body> 	
</html>