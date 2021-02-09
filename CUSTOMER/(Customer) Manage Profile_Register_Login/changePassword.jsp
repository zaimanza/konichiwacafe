<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Account|Konichiwa Cafe</title>
</head>
<script>
	function validate() {
		var a1 = document.pswForm.npsw.value;
		var a2 = document.pswForm.cpsw.value;
		var a3 = document.pswForm.password.value;
		
		if (a3 == a1 || a3 == a2)
		{
			alert("It looks like you are using the previous password!");
			return false;
		}

		if (a1.length<6 || a1.length>8 || a2.length<6 || a2.length>8)
		{
			alert("Password length must be 6-8 only!");
			return false;
		}
		
		if (a1 != a2){
			alert("Password not match!");
			return false;
		}		
	}
	
	function showPassword() {
		var x = document.getElementById("npsw");
	    var xx = document.getElementById("cpsw");
	    if (x.type === "password" || xx.type === "password") {
	      x.type = "text";
	      xx.type = "text";

	    } else {
	      x.type = "password";
	      xx.type = "password";
	    }
	  }
</script>
<body>
	<div align="center">
		<h1>Change Password</h1>
		<form name="pswForm" action="CustomerController?action=changePassword" method="post" onsubmit="return validate()">
			<input type='hidden' name='custid' value="<%= session.getAttribute("custid") %>">
			<input type='hidden' name='password' value="<c:out value="${customer.password}" />">
			
			<table>
			<tr>
				<td>New Password:</td>
				<td><input type='password' name='npsw' id="npsw" placeholder="Password"></td>
			</tr>
			<tr>
				<td>Confirm Password :</td>
				<td><input type='password' name='cpsw' id="cpsw" placeholder="Re-enter Password"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="checkbox" onclick="showPassword()">Show Password</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Change"></td>
			</tr>
			</table>
		</form>
		
		<br> <a href="CustomerController?action=viewCustomer&i=<%= session.getAttribute("custid") %>">My Account</a>
		<br> <a href="CustomerController?action=home&i=<%= session.getAttribute("custid") %>">Home</a>
		<br> <a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>">Logout</a>
	</div>
<%-- <%} %> --%>
</body>
</html>