<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Update address|Konichiwa Cafe</title>
</head>
<script>
function validate() {
	var a1 = document.addressform.addr1.value;
	var a2 = document.addressform.addr2.value;
	var a3 = document.addressform.addr3.value;
	var a4 = document.addressform.addr4.value;
	
	if (a1 == "" || a2 == "" || a3 == "" || a4 == "")
	{
		alert("Field cannot be blank!");
		return false;
	}
	if (a3.length != 5)
	{
		alert("Postcode must be 5 number");
		return false;
	}
}

</script>
<body>
	<div align="center">
		<h1>Update Address</h1>
		<form name="addressform" action="AddressController?action=updateAddress" method="post" onsubmit="return validate()">
			<table>
				<tr>
					<td>Address :</td>
					<td><input type="text" name="addr1" placeholder="Street" value="<c:out value="${address.addressstreet}" />"></td>
					<td><input type="text" name="addr2" placeholder="City" value="<c:out value="${address.addresscity}" />"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="addressid" value="<c:out value="${address.addressid}"/>"></td>
					<td><input type="text" name="addr3" placeholder="Postcode" value="<c:out value="${address.addresspostcode}" />"></td>
					<td><input type="text" name="addr4" placeholder="State" value="<c:out value="${address.addressstate}" />"></td>
				</tr>
				<tr>
				
					<td><input type='hidden' name='custid' value="<%= session.getAttribute("custid") %>"></td>
					<td><input type="reset" value="Reset"></td>
					<td><input type="submit" value="Update"></td>
				</tr>
			</table>
		</form>
		<br><br><a href="AddressController?action=viewAddress&i=<%= session.getAttribute("custid") %>">Back</a>
		<br> <a href="CustomerController?action=home&i=<%= session.getAttribute("custid") %>">Home</a>
	</div>
	
</body>
</html>