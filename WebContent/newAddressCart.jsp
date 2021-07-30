<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("custid") == null) {
		response.sendRedirect("../ActorCustomer/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
	<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    
    <style>
    	.navv{
        	float:right;
        }
    </style>
<title>Add address | Konichiwa Cafe</title>
</head>
<script>
	function validate() {
		var a1 = document.newaddress.addr1.value;
		var a2 = document.newaddress.addr2.value;
		var a3 = document.newaddress.addr3.value;
		var a4 = document.newaddress.addr4.value;

		if (a1 == "" || a2 == "" || a3 == "" || a4 == "")
		{
			alert("Field cannot be blank!");
			return false;
		}
		if (isNaN(a3))
		{
			alert("Postcode must be numeric");
			return false;
		}
		if (a3.length != 5)
		{
			alert("Postcode must be 5 numbers");
			return false;
		}
	}
</script>
	<script type="text/javascript">
	if(localStorage.getItem("CartQty")!= null){
		if(localStorage.getItem("CartQty") != 0){
			document.getElementById("cartIcon").innerHTML = "Cart(" + localStorage.getItem("CartQty") + ")";
		}
	} 
	
	document.getElementById("total").value = localStorage.getItem("totalPriceItems");
	</script>
<body class="example">
<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                    	<a href="../index.jsp"><i class="fa fa-home  "></i> Home</a> 
	                        <span>Konichiwa Cafe</span> 
	                        <div class="navv">
	                        	<a href="OrdersController?action=trackOrder&i=<%= session.getAttribute("custid") %>"><i class="fa fa-motorcycle"></i> Track</a>
	                        	<a href="ItemController?action=viewItem"><i class="fa fa-list-alt "></i> Menu</a> 
	                        	<a id="cartIcon" href="CartController?action=showcart&i=<%= session.getAttribute("custid") %>"><i class="fa fa-shopping-cart "></i> Cart</a>
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
						<h2>Add New Address</h2>
						<form name="newaddress" action="AddressController?action=newCart" method="post" onsubmit="return validate()">
							<input type='hidden' name='custid' value="<%= session.getAttribute("custid") %>">
							<input type='hidden' name='total' value="">
							<div class="group-input">
								<label for="street">Address Line 1 / Street *</label>
								<input type="text" name="addr1" placeholder="Address Line 1 / Street" required>
							</div>
							<div class="group-input">
								<label for="city">City *</label>
								<input type="text" name="addr2" placeholder="City" required>								
							</div>
							<div class="group-input">
								<label for="postcode">Postcode *</label>
								<input type="text" name="addr3" placeholder="Postcode" required>							
							</div>
							<div class="group-input">
								<label for="state">State *</label>
								<input type="text" name="addr4" placeholder="State" required>							
							</div>
							<button type="submit" class="site-btn register-btn" >Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>