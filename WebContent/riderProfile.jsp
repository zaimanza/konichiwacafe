<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<style>
		.navv{
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

<title>View Rider's Details</title>
</head>
<body class="example">

<!-- Navigation bar -->
	<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                    	  <a href="#" onclick="goHome()"><i class="fa fa-home  "></i> Home</a> 
	                        <span>Konichiwa Cafe</span> 
	                        <div class="navv">
	                        	<a  href="#" onclick="updateAvailability()"><i class="fa fa-check-circle"></i> Update Availability</a>             	
	                        	<a  href="#" onclick="updateProfile()"><i class="fa fa-user "></i> Update Profile</a> 
	                        	<a class="active" href="#" onclick="logoutFunction()"><i class="fa fa-sign-out "></i> Logout</a>  
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
						<h2>Rider Profile</h2>
	
						<p><b>Rider id:</b> <c:out value="${rider.getRiderId()}" /></p>
						<p><b>First name:</b> <c:out value="${rider.getFName()}" /></p>
						<p><b>Last name:</b> <c:out value="${rider.getLName()}" /></p>
						<p><b>Phone:</b> <c:out value="${rider.getPhone()}" /></p>
						<p><b>Email:</b> <c:out value="${rider.getEmail()}" /></p>
						<p><b>Status:</b> <c:out value="${rider.getStatString()}" /></p>
						<p><b>Availability:</b> <c:out value="${rider.getAvailableString()}" /></p>
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
		function updateAvailability(){
			window.location.replace("RiderController?action=updateAvailable&id=${rider.getRiderId()}");
		}
		function updateProfile(){
			window.location.replace("RiderController?action=updateRider&id=${rider.getRiderId()}");
		}
		function goHome(){
			window.location.replace("indexRider.jsp");
		}
	</script>
</body>
</html>