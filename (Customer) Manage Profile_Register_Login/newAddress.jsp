<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Add address|Konichiwa Cafe</title>
</head>
<script>
	function validate() {
		var a1 = document.newaddress.addr1.value;
		var a2 = document.newaddress.addr2.value;
		var a3 = document.newaddress.addr3.value;
		var a4 = document.newaddress.addr4.value;

		if (a1 == "" || a2 == "" || a3 == "" || a4 == "")
		{
			alert("Field cannot be blank!");
			return false;
		}
		else if (a3.length != 5)
		{
			alert("Postcode must be 5 number");
			return false;
		}
	}
</script>
<body>
	<div align="center">
		<h1>Add New Address</h1>
		<form name="newaddress" action="AddressController?action=new" method="post" onsubmit="return validate()">
			<table>
				<tr>
					<td>Address :</td>
					<td><input type="text" name="addr1" placeholder="Street"></td>
					<td><input type="text" name="addr2" placeholder="City"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" name="addr3" placeholder="Postcode"></td>
					<td><input type="text" name="addr4" placeholder="State"></td>
				</tr>
				<tr>
					<td><input type='hidden' name='custid' value="<%= session.getAttribute("custid") %>"></td>
					<td><input type="reset" value="Reset"></td>
					<td><input type="submit" value="Add"></td>
				</tr>
			</table>
		</form>
		<br><br><a href="AddressController?action=viewAddress&i=<%= session.getAttribute("custid") %>">Back</a>
		<br> <a href="CustomerController?action=viewCustomer&i=<%= session.getAttribute("custid") %>">My Account</a>
		<br> <a href="CustomerController?action=home&i=<%= session.getAttribute("custid") %>">Home</a>
		<br> <a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>">Logout</a>
	</div>
	
</body>
</html>