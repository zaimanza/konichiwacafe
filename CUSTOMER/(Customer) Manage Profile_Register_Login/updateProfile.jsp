<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Account| Konichiwa Cafe</title>
</head>
<script>
function validate() {
	var x = document.updateForm.phone.value;
	
	if (x.length <10){
		alert("Phone No. too short!");
		return false;
	}		
}

</script>
<body>
	<div align="center">
		<h1>Update Account</h1>
		<form name="updateForm" action="CustomerController?action=updateProfile" method="post" onsubmit="return validate()">
			<input type='hidden' name='custid' value="<%= session.getAttribute("custid") %>">
			<table>
			<tr>
				<td>Name :</td>
				<td><input type='text' name='fname' value="<c:out value="${customer.fname}" />"required></td>	
				<td><input type='text' name='lname' value="<c:out value="${customer.lname}" />"required></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td colspan=3><input type='text' name='email' value="<c:out value="${customer.email}"/>" size='47px' disabled></td>
			</tr>
			<tr>
				<td>Phone No. :</td>
				<td colspan=3><input type='text' name='phone' value="<c:out value="${customer.phone}"/>" size='47px' required></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Update"></td>
			</tr>
			</table>
		</form>
		<br> <a href="CustomerController?action=psw&i=<%= session.getAttribute("custid") %>">Change Password</a>
		<br> <a href="AddressController?action=viewAddress&i=<%= session.getAttribute("custid") %>">My Address</a>
		<br> <a href="CustomerController?action=home&i=<%= session.getAttribute("custid") %>">Home</a>
		<br> <a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>">Logout</a>
	</div>
</body>
</html>