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
	<title>Account| Konichiwa Cafe</title>
</head>
<script>
function validate() {
	var x = document.updateForm.phone.value;
	
	if (x.length <10){
		alert("Phone No. too short!");
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
						<h2>Update Profile</h2>
						<form name="updateForm" action="CustomerController?action=updateProfile" method="post" onsubmit="return validate()">
							<input type='hidden' name='custid' value="<%=session.getAttribute("custid")%>">
							<div class="group-input">
								<label for="fname">First Name</label>
								<input type='text' name='fname' value="<c:out value="${customer.fname}" />"required>
							</div>
							<div class="group-input">
								<label for="lname">Last Name</label>
								<input type='text' name='lname' value="<c:out value="${customer.lname}" />"required>
							</div>
							<div class="group-input">
								<label for="email">Email</label>
								<input type='text' name='email' value="<c:out value="${customer.email}"/>" disabled>
							</div>
							<div class="group-input">
								<label for="phone">Phone No.</label>
								<input type='text' name='phone' value="<c:out value="${customer.phone}"/>" required>
							</div>
							<button type="submit" class="site-btn register-btn">Update</button>
						</form>
						<div class="switch-login">
							<a href="CustomerController?action=psw&i=<%= session.getAttribute("custid") %>" class="or-login">Change Password</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>