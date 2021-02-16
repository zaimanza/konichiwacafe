<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String e = (String) request.getAttribute("email"); %>
<%@ page import= "java.text.Format" %>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.Date"%>
<%
	int bill=0;
%>
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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    

	<style>
		.center {
          	display: block;
          	margin-left: auto;
          	margin-right: auto;
          	width: 50%;
          	padding-bottom:100px;
        }
        .navv{
        	float:right;
        }	
		table{
	        width:1000px;
	        
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
			.address1{
		  right: 100px;
		  max-width: 1000px;
		  }
		  .address2{
		  right: 100px;
		  max-width: 1000px;
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
				document.getElementById("p1").innerHTML = jsEmail2;
			} else {
				localStorage.setItem("email", jsEmail);
				jsEmail2 = jsEmail;
				document.getElementById("p1").innerHTML = jsEmail2;
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
			function updateAvailability(){
				window.location.replace("RiderController?action=updateAvailable&id=${rider.getRiderId()}");
			}
		</script>

	<!-- Navigation bar -->
	<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                    	  <a href="javascript:openPage()"><i class="fa fa-home  "></i> Home</a> 
	                        <span>Konichiwa Cafe</span> 
	                        <div class="navv">
	                        	<a href="#" onclick="viewProfile()"><i class="fa fa-user"></i> Profile</a>             	
	                        	<!--   <a class="active" href="#" onclick="updateAvailability()"><i class="fa fa-check-circle "></i> Availability</a> -->  
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
							<table class="address1" style="solid 20px;" >	
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
						            		<td style="width: 20px;"><c:out value="${order.orderID}" /></td>        
						                    <td style="width: 20px;"><c:out value="${order.orderDate}" /></td>  
						                    <td style="width: 50px;"><c:out value="${order.getDeliveryAddress()}" /></td>  
						                    <td style="width: 20px;"><c:out value="${order.custID}" /></td>  
						                   	<td style="width: 20px;"> <c:out value="${order.staffID}" /></td>  
						                   	<td style="width: 50px;"><a href="OrdersController?action=pickupOrder&orderid=${order.orderID}"><button class="removebtn" style="border:none">Pickup</button></a></td>    
						          		</tr>
					      			</c:forEach>
							</table>	
						</c:when>
						<c:otherwise>
			    			No Orders to Pickup
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
					<table class="address2">
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
	            				<td style="width: 20px;"><c:out value="${order.orderID}" /></td>        
			                    <td style="width: 20px;"><c:out value="${order.orderDate}" /></td>  
			                    <td style="width: 50px;"><c:out value="${order.getDeliveryAddress()}" /></td>  
			                    <td style="width: 20px;"><c:out value="${order.custID}" /></td>  
			                   	<td style="width: 20px;"> <c:out value="${order.staffID}" /></td>  
	                    		<td style="width: 50px;"><a href="OrdersController?action=deliverOrder&orderid=${order.orderID}"><button class="removebtn" style="border:none">Delivered</button></a></td> 
	            			</tr>
	            			
	        			</c:forEach>
					</table>
					
				</c:when>
					<c:otherwise>
		    			No Orders to Deliver
		  			</c:otherwise>
		  			
			</c:choose>
		</div>
		
	</div>	
		
</body> 	
</html>