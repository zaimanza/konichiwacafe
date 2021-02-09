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
<title>Address|Konichiwa Cafe</title>
</head>
<body>
	<div align="center">
		<h1>My Address</h1>		
		<table border=1 class="address">	
    	<tr>
        	<th>No.</th>
            <th>Street</th>
            <th>City</th>
            <th>Postcode</th>
            <th>State</th>
            <th>Action</th>
        </tr>

        <c:forEach items="${cust}" var="address">
        <%bill++; %>
        	<tr>
        		<td><% out.print(bill); %></td>                                    
                <td><c:out value="${address.addressstreet}" /></td>
                <td><c:out value="${address.addresscity}" /></td>                                              
         		<td><c:out value="${address.addresspostcode}" /></td>  
         		<td><c:out value="${address.addressstate}" /></td>
         		<td>
         			<a href="AddressController?action=edit&i=<%= session.getAttribute("custid") %>&a=<c:out value="${address.addressid}"/>">Edit</a> &nbsp;
         			<a href="AddressController?action=delete&i=<%= session.getAttribute("custid") %>&a=<c:out value="${address.addressid}"/>">Delete</a>
         		</td>  
        	</tr>
        </c:forEach>        
    </table>
		<br>
		<br> <a href="AddressController?action=addAddress&i=<%= session.getAttribute("custid") %>">Add More Address</a>
		<br> <a href="CustomerController?action=viewCustomer&i=<%= session.getAttribute("custid") %>">My Account</a>
		<br> <a href="CustomerController?action=home&i=<%= session.getAttribute("custid") %>">Home</a>
		<br> <a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>">Logout</a>
	</div>
</body>
</html>