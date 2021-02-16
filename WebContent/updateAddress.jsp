<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (session.getAttribute("custid") == null) {
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
    <style>
    	.navv{
        	float:right;
        }
    </style>
<title>Update address|Konichiwa Cafe</title>
</head>
<script>
function validate() {
	var a1 = document.addressform.addr1.value;
	var a2 = document.addressform.addr2.value;
	var a3 = document.addressform.addr3.value;
	var a4 = document.addressform.addr4.value;
	
	if (a1 == "" || a2 == "" || a3 == "" || a4 == "")
	{
		alert("Field cannot be blank!");
		return false;
	}
	if (a3.length != 5)
	{
		alert("Postcode must be 5 number");
		return false;
	}
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

<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<h2>Update Address</h2>
						<form name="addressform" action="AddressController?action=updateAddress" method="post" onsubmit="return validate()">
						<input type='hidden' name='custid' value="<%= session.getAttribute("custid") %>">
						<input type="hidden" name="addressid" value="<c:out value="${address.addressid}" />">
							
							<div class="group-input">
								<label for="street">Address Line 1 / Street</label>
								<input type="text" name="addr1" placeholder="Street" value="<c:out value="${address.addressstreet}" />">
							</div>
							<div class="group-input">
								<label for="city">City</label>
								<input type="text" name="addr2" placeholder="City" value="<c:out value="${address.addresscity}" />">								
							</div>
							<div class="group-input">
								<label for="postcode">Postcode</label>
								<input type="text" name="addr3" placeholder="Postcode" value="<c:out value="${address.addresspostcode}" />">							
							</div>
							<div class="group-input">
								<label for="state">State</label>
								<input type="text" name="addr4" placeholder="State" value="<c:out value="${address.addressstate}" />">						
							</div>
							<button type="submit" class="site-btn register-btn">Update</button>
						</form>
						<div class="switch-login">
							<a href="AddressController?action=viewAddress&i=<%= session.getAttribute("custid") %>" class="or-login">Back</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>