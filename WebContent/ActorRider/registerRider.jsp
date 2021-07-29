<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String wrongPass = (String) request.getAttribute("wrongPass"); %>
<!DOCTYPE html>
<html>
<style>
	

</style>
<head>
<meta charset="ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
<title>Register Rider</title>
</head>
<script>
function showPassword() {
    var x = document.getElementById("pass");
    var xx = document.getElementById("cpass");
    if (x.type === "password" || xx.type === "password") {
      x.type = "text";
      xx.type = "text";

    } else {
      x.type = "password";
      xx.type = "password";
    }
  }

function validate(){
	var fn = document.getElementById("fName").value;
	var ln = document.getElementById("lName").value;
	var fntrimmed = fn.trim(); //remove spaces beginning and end
	var lntrimmed = ln.trim();
	document.getElementById("fName").value = fntrimmed;
	document.getElementById("lName").value = lntrimmed;
	
	var p1 = document.riderForm.pass.value;
	var p2 = document.riderForm.cpass.value;
		
	if (p1.length<6)
	{
		alert("Password length must exceed 5 characters! ");
		return false;
	}
	
	if(p1 != p2)
	{
		alert("Password does not match!");
		return false;
	}
	
}
</script>
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
                     <input type="hidden" id="wrongPass" value="<%=wrongPass %>" height="0"/>
	<form name="riderForm" method="post" id="ff" action="RiderController?action=addORupdate" onsubmit="return validate()">
		<h2>Sign Up</h2>
		<div class="group-input">
			<label for="name">First Name *</label>
	  		<input type="text" name="fName" id="fName" placeholder="First Name" pattern= "[A-Za-z ]+" required="required" />	
	  	</div>
	  	<div class="group-input">
	  		<label for="name">Last Name *</label>
	  		<input type="text" name="lName" id="lName" placeholder="Last Name" pattern= "[A-Za-z ]+" required="required" />
	  	</div>
	  	<div class="group-input">
	  		<label for="name">Phone No *</label>
	  		<input type="tel" name="phone" id="phone" placeholder="Phone No. (e.g. 0123456789)"  pattern="[0]{1}[0-9]{9,11}" required="required" />
	  	</div>
	  	<div class="group-input">
	  		<label for="name">Email *</label>
	  		<input type="email" name="email" id="email" placeholder="Email" required="required" />
	  	</div>
	  	<div class="group-input">
	  		<label for="name">Password * <i style="font-size:12px;">(minimum : 6 characters)</i></label>
	  		<input type="password" name="pass" id="pass" placeholder="Password" required="required" />	  		
  		</div>
  		<div class="group-input">
            <label for="con-pass">Confirm Password *</label>
            <input type="password" name="confirmPassword" id="cpass" placeholder="Confirm Password"  required>
        </div>   
            <input type="checkbox" onclick="showPassword()"> Show Password 
  			<input type="submit"  class="site-btn register-btn" value="Register">
	</form>
	
						<div class="switch-login">
                            <a href="../ActorRider/loginRider.jsp" class="or-login">Already have an account? Log in</a> 
                        </div>
                       <script type="text/javascript">
								var wrongPass = document.getElementById("wrongPass").value;
								if(wrongPass == "This email has been registered"){
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