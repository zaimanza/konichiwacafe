<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<style>
		.navv{
		float:right;}
		
	
	input[type=text],input[type=password], select {
	  width: 100%;
	  padding: 12px 20px;
	  margin: 2px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  border-radius: 2px;
	  box-sizing: border-box;
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
    
<title>Update RiderProfile</title>
</head>
<body class="example">

<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                    	  <a href="#" onclick="goBack()"><i class="fa fa-user "></i> Profile</a> 
	                        <span>Konichiwa Cafe</span> 
	                        <div class="navv">
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
	function goBack(){
			window.location.replace("RiderController?action=viewRider&email=${rider.getEmail()}");
		}
</script>
<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<h2>My Profile</h2>

					<form name="form1" method="post" id="ff" action="RiderController">
				
						
						<input type="hidden" name="riderId" id="riderId" value="<c:out value="${rider.getRiderId()}" />"/><br>
						
						<b>First name: </b>
						<br><input type="text" name="fName" id="fName" value="<c:out value="${rider.getFName()}" />"/><br>	
						
						<b>Last Name: </b>
						<br><input type="text" name="lName" id="lName" value="<c:out value="${rider.getLName()}" />"/><br>
						
						<b>Phone: </b>
						<br><input type="text" name="phone" id="phone" value="<c:out value="${rider.getPhone()}" />" /><br>
						
						<b>Email: </b>
						<br><input type="text" name="email" id="email" value="<c:out value="${rider.getEmail()}" />" /><br>
						
						<b>Password: </b>
						<br><input type="password" name="pass" id="pass" value="<c:out value="${rider.getPass()}" />" /><br>
						<br/>
						<input class="site-btn register-btn" type="submit" name="submitcontact" value="Submit">

					</form>
					</div>					
				</div>				
			</div>			
		</div>		
	</div>	

</body>
</html>