<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("custid") == null) {
		response.sendRedirect("login.jsp");
	}

	int bill=0;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
    <style>
    	.navv{
        	float:right;
        }
        .tbl{
        	margin-left: auto;
  			margin-right: auto;
  			width:50%;
  			padding: 0px;
        }
    </style>
<title>Address|Konichiwa Cafe</title>
</head>
<body class="example">
<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                    	<a href="index.jsp"><i class="fa fa-home  "></i> Home</a> 
	                        <span>Konichiwa Cafe</span> 
	                        <div class="navv">
	                        	<a href="OrdersController?action=trackOrder&i=<%= session.getAttribute("custid") %>"><i class="fa fa-motorcycle"></i> Track</a>
	                        	<a href="ItemController?action=viewItem"><i class="fa fa-list-alt "></i> Menu</a> 
	                        	<a href="CartController?action=showcart&i=<%= session.getAttribute("custid") %>"><i class="fa fa-shopping-cart "></i> Cart</a>
	                        	<a href="CustomerController?action=viewCustomer&i=<%= session.getAttribute("custid") %>"><i class="fa fa-user"></i> Account</a>
	                        	<a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>"><i class="fa fa-sign-out "></i> Logout</a>  
	                        </div>                       
	                    </div>
	                </div>
	            </div>
	        </div>
		</div>

	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog-details-inner">
						<div class="blog-detail-title">
							<h2>My Address</h2>
							<br>
							<a	href="AddressController?action=addAddress&i=<%=session.getAttribute("custid")%>"
							class="primary-btn" >Add New Address</a>
						</div>						
						<div class="tbl specification-table">							
						<c:forEach items="${cust}" var="address">
						<% bill++;%>
							<table>
								<tr class="p-catagory" style="background-color: #e7ab3c; color:white;">
									<td colspan=2>ADDRESS <% out.print(bill);%></td>
								</tr>
								<tr>
									<td>
									<c:out value="${address.addressstreet}, ${address.addresscity}, ${address.addresspostcode}, ${address.addressstate}" />
									</td>
									<td>
										<div class="filter-widget">
											<div class="fw-tags">
												<a
													href="AddressController?action=edit&i=<%= session.getAttribute("custid") %>&a=<c:out value="${address.addressid}"/>"
													style="background-color: #4CAF50; color: white">Edit</a> <a
													href="AddressController?action=delete&i=<%= session.getAttribute("custid") %>&a=<c:out value="${address.addressid}"/>"
													style="background-color: #E74C3C; color: white">Delete</a>
											</div>
										</div>
									</td>
								</tr>
								</table>
								<br>
								</c:forEach>							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>