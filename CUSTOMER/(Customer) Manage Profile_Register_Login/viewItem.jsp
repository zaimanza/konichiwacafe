<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int bill=0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Menu|Konichiwa Cafe</title>
</head>
<body>
<div align="center">
		<h1>Menu</h1>		
		<table border=1 class="address">	
    	<tr>
        	<th>No.</th>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Stock</th>
            <th>Image</th>
            <th>Category</th>
        </tr>

        <c:forEach items="${item}" var="item">
        <%bill++; %>
        	<tr>
        		<td><% out.print(bill); %></td>                                    
                <td><c:out value="${item.name}" /></td>
                <td><c:out value="${item.price}" /></td>                                              
         		<td><c:out value="${item.description}" /></td>  
         		<td><c:out value="${item.stock}" /></td>
         		<td><c:out value="${item.image}" /></td>
         		<td><c:out value="${item.itemcategoryid}" /></td>
        	</tr>
        </c:forEach>        
    </table>
		<br>
		<br> <a href="CustomerController?action=viewCustomer&i=<%= session.getAttribute("custid") %>">My Account</a>
		<br> <a href="CustomerController?action=home&i=<%= session.getAttribute("custid") %>">Home</a>
		<br> <a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>">Logout</a>
	</div>
</body>
</html>