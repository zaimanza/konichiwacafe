<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
	

</style>
<head>
<meta charset="ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
<title>Register Rider</title>
</head>
<body class="example">
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
    
    <!-- Register rider section -->
    
	<script type="text/javascript">
		window.reload();
	</script>
	<div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
	<form name="form1" method="post" id="ff" action="RiderController">
		<h2>REGISTER</h2>
		<div class="group-input">
			<label for="name">First Name</label>
	  		<input type="text" name="fName" id="fName" placeholder="Enter First Name" required="required" />	
	  		<br>
	  		<label for="name">Last Name</label>
	  		<input type="text" name="lName" id="lName" placeholder="Enter Last Name" required="required" />	
	  		<br>
	  		<label for="name">Phone No</label>
	  		<input type="text" name="phone" id="phone" placeholder="Enter Phone" required="required" />	
	  		<br>
	  		<label for="name">Email</label>
	  		<input type="text" name="email" id="email" placeholder="Enter Email" required="required" />	
	  		<br>
	  		<label for="name">Password</label>
	  		<input type="password" name="pass" id="pass" placeholder="Enter Password" required="required" />		
	  		
  		</div>
  			<input type="submit"  class="site-btn register-btn" value="Register">
	</form>
	
						<div class="switch-login">
                            <a href="loginRider.jsp" class="or-login">Already have an account? Log in</a> 
                        </div>
					</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>