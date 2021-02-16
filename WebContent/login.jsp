<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("custid") != null) {
		response.sendRedirect("CustomerController?action=home&i=" + session.getAttribute("custid"));
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
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
<title>Login| Konichiwa Cafe</title>
</head>
<script type="text/javascript">
function showPassword() {
    var x = document.getElementById("psw");
    if (x.type === "password") {
      x.type = "text";
    } else {
      x.type = "password";
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
	<div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>Login</h2>
                        <form action="CustomerController?action=login" method="post">
                            <div class="group-input">
                                <label for="email">Email *</label>
                                <input type="email" name="email" placeholder="Email">
                            </div>
                            <div class="group-input">
                                <label for="pass">Password *</label>
                                <input type="password" name="password" id="psw"
						placeholder="Password">
                            </div>
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                    <label for="show-pass">
                                        Show Password
                                        <span class="checkmark" onclick="showPassword()"></span>
                                    </label>
                                </div>
                            </div>
                            <button type="submit" name="login" class="site-btn login-btn">Sign In</button>
                        </form>
                        <div class="switch-login">
                            <a href="signupcust.jsp" class="or-login">Or Create An Account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>


