<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String wrongPass = (String) request.getAttribute("wrongPass"); %>
<!DOCTYPE html>
<html>
<style>
	.res {
	  	width: 100px;
	  	background-color: #4CAF50;
	  	color: white;
	  	padding: 12px 100px;
	  	margin: 8px 0;
  		border: none;
  		border-radius: 4px;
  		cursor: pointer;
	}

	.res:hover {
  		background-color: #45a049;
	}

	
</style>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
<meta charset="ISO-8859-1">
<title>Login Rider</title>
</head>
<script type="text/javascript">
function showPassword() {
    var x = document.getElementById("pass");
    if (x.type === "password") {
      x.type = "text";
    } else {
      x.type = "password";
    }
  }
</script>
<body  class="example">
<div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                    	                 
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
							<input type="hidden" id="wrongPass" value="<%=wrongPass %>" height="0"/>
							<script type="text/javascript">
								window.reload();
							</script>
							<form name="form1" method="post" id="ff" action="RiderController?action=login">
								<h2>Rider Login</h2>
									<div class="group-input">
										
									  	<label for="email"><i class="fa fa-envelope "></i>&nbsp;Email *</label>
									  		<input type="email" name="email" id="email" placeholder="Enter Email" required="required" />	
								  	</div>
							  	 <div class="group-input">
							  	 	
								  	<label for="pass"><i class="fa fa-key "></i> &nbsp;Password *</label>
								  	<input type="password" name="pass" id="pass" placeholder="Enter Password" required="required" />		
							  	</div>
							  	<div class="group-input gi-check">
	                                <div class="gi-more">
	                                    <label for="show-pass">
	                                        Show Password
	                                        <span class="checkmark" onclick="showPassword()"></span>
	                                    </label>
	                                </div>
                            	</div>
							  	<input type="submit" class="site-btn login-btn" value="Login">
							  	
							</form><br>
							<div class="switch-login">
	                            <a href="registerRider.jsp" class="or-login">Or Create An Account</a>
	                        </div>
							
							<script type="text/javascript">
								var wrongPass = document.getElementById("wrongPass").value;
								if(wrongPass == "Incorrect Email or Password"){
									alert(wrongPass);
								}
								else if(wrongPass == "Rider is not verified"){
									alert(wrongPass);
								}
								else if(wrongPass == "Unregistered Rider"){
									alert(wrongPass);
								}
							</script>
	 				</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>