<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Home| Konichiwa Cafe</title>
</head>
<body>
<div align="center">
<h1>Hi <c:out value="${customer.fname} ${customer.lname}" /> !</h1>
<br>
<br>
<a href="ItemController?action=viewItem">View Menu</a>
<br>
<a href="CustomerController?action=viewCustomer&i=<%= session.getAttribute("custid") %>">My Account</a>
<br>
<a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>">Logout</a>
</div>
</body>
</html>