<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="css/style.css">
<title>Konichiwa Cafe</title>
</head>
<body>
<div align="center">
	<h1>Welcome to Konichiwa Cafe</h1>
	<% 
		if (session.getAttribute("custid")!= null){
        	response.sendRedirect("CustomerController?action=home&i="+session.getAttribute("custid"));
		}
	%>
		<a href="signupcust.jsp">New Customer?</a><br>
		<a href="login.jsp">Already have an account? Login here</a>
	
</div>
</body>
</html>