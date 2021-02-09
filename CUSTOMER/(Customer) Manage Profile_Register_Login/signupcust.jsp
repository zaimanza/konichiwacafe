<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="css/style.css">
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
<body>
	<div align="center">
	<h1>Create New Account</h1>
		<form name="registration" action="CustomerController?action=addCustomer" method="post" onsubmit="return validate()">
			<table>
				<tr>
					<td>Name :</td>
					<td><input type="text" name="fname" placeholder="First Name" required></td>
					<td><input type="text" name="lname" placeholder="Last Name" required></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td colspan=3><input type="email" name="email"
						placeholder="Email" required></td>
				</tr>
				<tr>
					<td>Phone No. :</td>
					<td colspan=3><input type="text" name="phone"
						placeholder="Phone No."  required></td>
				</tr>
				<tr>
					<td>Address :</td>
					<td><input type="text" name="addr1" placeholder="Street" required></td>
					<td><input type="text" name="addr2" placeholder="City" required></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" name="addr3" placeholder="Postcode" required></td>
					<td><input type="text" name="addr4" placeholder="State" required></td>
				</tr>
				<tr>
					<td>Enter Password :</td>
					<td colspan=3><input type="password" name="psw" id="psw"
						placeholder="Password" required></td>
				</tr>
				<tr>
					<td>Confirm Password :</td>
					<td colspan=3><input type="password" name="cpsw" id="cpsw"
						placeholder="Confirm Password"  required></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" onclick="showPassword()">Show Password
					</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="reset" value="Reset">&nbsp; <input
						type="submit" value="Sign up"></td>
				</tr>
			</table>
		</form>
		<br>
		<a href="login.jsp">Already have an account?</a>
	</div>
</body>
</html>