<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Account|Konichiwa Cafe</title>
</head>
<script>
	function validate() {
		var a1 = document.pswForm.npsw.value;
		var a2 = document.pswForm.cpsw.value;
		var a3 = document.pswForm.password.value;
		
		if (a3 == a1 || a3 == a2)
		{
			alert("Invalid password!");
			return false;
		}

		if (a1.length<6 || a1.length>8 || a2.length<6 || a2.length>8)
		{
			alert("Password length must be 6-8 only!");
			return false;
		}
		
		if (a1 != a2){
			alert("Password not match!");
			return false;
		}		
	}
	
	function showPassword() {
		var x = document.getElementById("npsw");
	    var xx = document.getElementById("cpsw");
	    if (x.type === "password" || xx.type === "password") {
	      x.type = "text";
	      xx.type = "text";

	    } else {
	      x.type = "password";
	      xx.type = "password";
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
						<h2>Change Password</h2>
						
							<form name="pswForm" action="CustomerController?action=changePassword" method="post" onsubmit="return validate()">
							<input type='hidden' name='custid' value="<%=session.getAttribute("custid")%>">
							<input type='hidden' name='password' value="<c:out value="${customer.password}" />">
							
							<div class="group-input">
								<label for="npsw">New Password</label>
								<input type='password' name='npsw' id="npsw" placeholder="Password">
							</div>
							
							<div class="group-input">
								<label for="cpsw">Confirm Password</label>
								<input type='password' name='cpsw' id="cpsw" placeholder="Re-enter Password">
								
							</div>
							
							<input type="checkbox" onclick="showPassword()"> Show Password
							<button type="submit" class="site-btn register-btn">Change</button>
						</form>
						
						<div class="switch-login">
							<a href="CustomerController?action=updateProfile&i=<%= session.getAttribute("custid") %>" class="or-login">Cancel</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>