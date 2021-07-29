<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    
<title>Register Staff</title>
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
	
	var p1 = document.staffForm.pass.value;
	var p2 = document.staffForm.cpass.value;
		
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
    
    <!-- Register staff section -->
    <c:if test="${not empty signuperror}">
		<input type="hidden" id="error" value="<c:out value="${signuperror}"></c:out>" height="0"/>
		<script type="text/javascript">
			var signuperror = document.getElementById("error").value;
			alert(signuperror);							
		</script>
    </c:if>
	<% request.removeAttribute("signuperror");%>
    
	<!-- <script type="text/javascript">
		window.reload();
	</script> -->
	<div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
	<form name="staffForm" method="post" id="ff" action="StaffController?action=registerStaff" onsubmit="return validate()">
		<h2>Sign Up</h2>
		<div class="group-input">
			<label for="fname">First Name *</label>
	  		<input type="text" name="staffFName" id="fName" placeholder="First Name" pattern= "[A-Za-z ]+" required="required" />	
	  	</div>
	  	<div class="group-input">
	  		<label for="lname">Last Name *</label>
	  		<input type="text" name="staffLName" id="lName" placeholder="Last Name" pattern= "[A-Za-z ]+" required="required" />	
	  	</div>	
	  	<div class="group-input">
	  		<label for="phone">Phone No *</label>
	  		<input type="tel" name="staffPhone" id="phone" placeholder="Phone No. (e.g. 0123456789)"  pattern="[0]{1}[0-9]{9,11}" required="required" />	
	  	</div>
	  	<div class="group-input">
	  		<label for="email">Email *</label>
	  		<input type="email" name="staffEmail" id="email" placeholder="Email" required="required" />	
	  	</div>
	  	<div class="group-input">
	  		<label for="password">Password * <i style="font-size:12px;">(minimum : 6 characters)</i></label>
	  		<input type="password" name="staffPassword" id="pass" placeholder="Password" required="required" />		
	  	</div>
	  	<div class="group-input">
            <label for="con-pass">Confirm Password *</label>
            <input type="password" name="staffConfirmPassword" id="cpass" placeholder="Confirm Password"  required>
        </div>   
            <input type="checkbox" onclick="showPassword()"> Show Password  		
  			<input type="submit"  class="site-btn register-btn" value="Register">	
	</form>
		<div class="switch-login">
	           <a href="../ActorAdmin/loginStaff.jsp" class="or-login">Already have an account? Log in</a> 
	    </div>
	    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>