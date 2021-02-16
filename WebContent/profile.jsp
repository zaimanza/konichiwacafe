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
    
    <style type="text/css">
        .navv{
        	float:right;
        }
        .btndelete{
        	border: none;        
		  	background-color: #ff4d4d;
		  	float:right;
        }
    </style>
    
<title>Account| Konichiwa Cafe</title>
</head>
<script type="text/javascript">
function ask(){
	if(confirm("Are you sure to delete account?") == true)
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
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<h2>My Profile</h2>
						<div class="group-input">
							<label for="name">Name</label>
							<p>
								<c:out value='${customer.fname} ${customer.lname}' />
							</p>
						</div>
						<div class="group-input">
							<label for="email">Email</label>
							<p>
								<c:out value='${customer.email}' />
							</p>
						</div>
						<div class="group-input">
							<label for="phone">Phone Number</label>
							<p>
								<c:out value='${customer.phone}' />
							</p>
						</div>
						<form name="remove" action="CustomerController?action=deleteProfile" method="post" onsubmit="return ask()">
							<button type="submit" name="custid" value="<%= session.getAttribute("custid") %>" class="btndelete primary-btn">Delete Account</button>
						</form>
						<a href="AddressController?action=viewAddress&i=<%= session.getAttribute("custid") %>" class="primary-btn">My Address</a>&nbsp;					
		 				<a href="CustomerController?action=updateProfile&i=<%=session.getAttribute("custid") %>" class="primary-btn">Edit</a>  				
					</div>					
				</div>				
			</div>			
		</div>		
	</div>	
		

</body>
</html>