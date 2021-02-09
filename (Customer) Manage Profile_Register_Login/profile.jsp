<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Account| Konichiwa Cafe</title>
</head>
<script type="text/javascript">
function ask(){
	if(confirm("Are you sure to delete account?") == true)
		return true;
	else 
		return false;
}
</script>
<body>
	<div align="center">
		<h1>My Account</h1>
		
		<table>
		<tr><td>Name: </td><td><c:out value="${customer.fname} ${customer.lname}" /></td></tr>
		<tr><td>Email: </td><td><c:out value="${customer.email}" /></td></tr>
		<tr><td>Phone No.: </td><td><c:out value="${customer.phone}" /></td></tr>
		</table>
		<br>
		<form name="remove" action="CustomerController?action=deleteProfile" method="post" onsubmit="return ask()">
			<button type="submit" name="custid" value="<%= session.getAttribute("custid") %>" >Delete Account</button>
		</form>
		<br> <a href="AddressController?action=viewAddress&i=<%= session.getAttribute("custid") %>">My Address</a>
		<br> <a href="CustomerController?action=updateProfile&i=<%=session.getAttribute("custid") %>">Edit</a>
		<br> <a href="CustomerController?action=home&i=<%= session.getAttribute("custid") %>">Home</a>
		<br> <a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>">Logout</a>
	</div>
</body>
</html>