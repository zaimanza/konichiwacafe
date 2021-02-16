<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
   	<title>Sign Up| Konichiwa Cafe</title>
</head>
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
	var p1 = document.registration.psw.value;
	var p2 = document.registration.cpsw.value;
	var p3 = document.registration.addr3.value;
	
	if (p1.length<6 || p1.length>8 || p2.length<6 || p2.length>8)
	{
		alert("Password length must be 6-8 only! ");
		return false;
	}
	
	if(p1 != p2)
	{
		alert("Password not match!");
		return false;
	}
	
	if(p3.length != 5)
	{
		alert("Invalid Postcode!");
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
                    	<a href="index.jsp"><i class="fa fa-home"></i> Home</a>                        
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
                        <form name="registration" action="CustomerController?action=addCustomer" method="post" onsubmit="return validate()">
                            <div class="group-input">
                                <label for="name">Name *</label>
                                <input type="text" name="fname" placeholder="First Name" required>
                                <input type="text" name="lname" placeholder="Last Name" required>
                            </div>
                            <div class="group-input">
                                <label for="email">Email *</label>
                                <input type="email" name="email" placeholder="Email" required>
                            </div>
                            <div class="group-input">
                                <label for="phone">Phone No.*</label>
                                <input type="text" name="phone" placeholder="Phone No."  required>
                            </div>
                            <!-- <div class="group-input">
                                <label for="address">Address *</label>
                                <input type="text" name="addr1" placeholder="Address Line 1 / Street" required>
                                <input type="text" name="addr2" placeholder="City" required>
                                <input type="text" name="addr3" placeholder="Postcode" required>
                                <input type="text" name="addr4" placeholder="State" required>
                            </div> -->
                            <div class="group-input">
                                <label for="pass">Password *</label>
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
                            <a href="login.jsp" class="or-login">Already have an account?</a> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
    

