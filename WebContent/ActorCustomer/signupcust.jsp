<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    
   	<title>Sign Up | Konichiwa Cafe</title>
</head>
<style>
	.alert {
      opacity: 1;
      transition: opacity 0.6s;
      border-radius: 30px;
    }
    .alert.error {background-color: #ff4d4d;}

    .closebtn {
      margin-left: 15px;
      color: white;
      font-weight: bold;
      float: right;
      font-size: 20px;
      line-height: 10px;
      cursor: pointer;
      transition: 0.3s;      
    }    
</style>
<script>
function showPassword() {
    var x = document.getElementById("psw");
    var xx = document.getElementById("cpsw");
    if (x.type === "password" || xx.type === "password") {
      x.type = "text";
      xx.type = "text";

    } else {
      x.type = "password";
      xx.type = "password";
    }
  }

function validate(){
	var fn = document.getElementById("fname").value;
	var ln = document.getElementById("lname").value;
	var fntrimmed = fn.trim(); //remove spaces beginning and end
	var lntrimmed = ln.trim();
	document.getElementById("fname").value = fntrimmed;
	document.getElementById("lname").value = lntrimmed;
	
	var p1 = document.registration.psw.value;
	var p2 = document.registration.cpsw.value;
	
	if (p1.length<6)
	{
		alert("Password length must exceed 5 characters! ");
		return false;
	}
	
	if (p1 != p2)
	{
		alert("Password does not match!");
		return false;
	}
	
}
</script>
<body class="example">
<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                    	<a href="../index.jsp"><i class="fa fa-home"></i> Home</a>                        
                        <span>Konichiwa Cafe</span>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- Register Section Begin -->
<div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>Sign Up</h2>
                        <c:if test="${not empty signuperror}">
                        <div id="close" class="alert error">
                			<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
                        	<h6 align="center" style="color: white;"><c:out value="${signuperror}"></c:out></h6>
                        </div>
                        </c:if> 
                        <form name="registration" action="CustomerController?action=addCustomer" method="post" onsubmit="return validate()">
                            <div class="group-input">
                                <label for="name">Name *</label>
                                <input type="text" id="fname" name="fname" placeholder="First Name" pattern= "[A-Za-z ]+" required>
                                <br><br>
                                <input type="text" id="lname" name="lname" placeholder="Last Name" pattern= "[A-Za-z ]+" required>
                            </div>
                            <div class="group-input">
                                <label for="email">Email *</label>
                                <input type="email" name="email" placeholder="Email" required>
                            </div>
                            <div class="group-input">
                                <label for="phone">Phone No. *</label>
                                <input type="tel" name="phone" placeholder="Phone No. (e.g. 0123456789)"  pattern="[0]{1}[0-9]{9,11}" required>
                            </div>
                            <div class="group-input">
                                <label for="pass">Password * <i style="font-size:12px;">(minimum : 6 characters)</i></label>
                                <input type="password" name="psw" id="psw" placeholder="Password" required>
                            </div>
                            <div class="group-input">
                                <label for="con-pass">Confirm Password *</label>
                               <input type="password" name="cpsw" id="cpsw" placeholder="Confirm Password"  required>
                            </div>
                            <input type="checkbox" onclick="showPassword()"> Show Password
                            <button type="submit" class="site-btn register-btn">SIGN UP</button>
                        </form>
                        <div class="switch-login">
                            <a href="../ActorCustomer/login.jsp" class="or-login">Already have an account?</a> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
    

