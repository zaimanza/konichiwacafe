<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<style>
	.navv{
	float:right;}
	/* The container */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  
  font-size: 13px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
.container1 {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 50px;
  cursor: pointer;
  font-size: 13px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}


/* Hide the browser's default radio button */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;margin-right: 0;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 20px;
  width: 20px;
  background-color: #eee;
  border-radius: 45%;
  margin-right: 20px;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 5.5px;
	left: 5.5px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
		
		.btndelete{
        	border: none;        
		  	background-color: #ff4d4d;
		  	float:right;
        }
	</style>
<head>
<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
<title>Update Availability</title>

</head>
<body class="example">
<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                    	   <a href="#" onclick="goHome()"><i class="fa fa-home "></i> Home</a>
	                        <span>Konichiwa Cafe</span> 
	                        <div class="navv">
	                        	 <a href="#" onclick="goProfile()"><i class="fa fa-user "></i> Profile</a>
	                        	<a class="active" href="#" onclick="logoutFunction()"><i class="fa fa-sign-out "></i> Logout</a>  
	                        </div>                       
	                    </div>
	                </div>
	            </div>
	        </div>
	</div>
<script>
	function logoutFunction(){
		localStorage.removeItem("email");
		window.location.replace("loginRider.jsp");
	}
	document.getElementById("p1").innerHTML = "${rider.getEmail()}";
	function goProfile(){
		window.location.replace("RiderController?action=viewRider&email=${rider.getEmail()}");
	}
	function goHome(){
		window.location.replace("OrdersController?action=viewRiderOrders&email=${rider.getEmail()}");
	}
</script>
<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<h2>Update availability</h2>
							<form name="form1" method="post" id="ff" action="RiderController?action=updateAvailable">
						
								
								<input type="hidden" name="riderId" id="riderId" value="<c:out value="${rider.getRiderId()}" />"/>
								
								<input type="hidden" name="email" id="email" value="<c:out value="${rider.getEmail()}" />"/><br>
			
								<p><b>Availability:  </b></p>
								<br>
								
								<label class="container1">
						  			<input type="radio" checked="checked" name="available" id="available" value="1">Not Available
						  			<span class="checkmark"></span>
								</label>
								<label class="container1">
						  			<input type="radio" name="available" id="available" value="2">Available
						  			<span class="checkmark"></span>
								</label>
								<button type="submit" name="submitcontact" class="btndelete primary-btn" value="submit">Update</button>
							</form>
							
					</div>					
				</div>				
			</div>			
		</div>		
	</div>	
	
</body>
</html>