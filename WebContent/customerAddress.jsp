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
        .alert {
	      opacity: 1;
	      transition: opacity 0.6s;
	      border-radius: 30px;
	      width: 30%;
	      margin-left:auto;
	      margin-right:auto;
	    }
		
	    .alert.success{background-color: #97BD64;}
		.alert.failed{background-color: #ff4d4d;}
		
	    .closebtn {
	      margin-left: 15px;
	      color: white;
	      font-weight: bold;
	      float: right;
	      font-size: 20px;
	      line-height: 10px;
	      cursor: pointer;
	      transition: 0.3s;      
	    }
    </style>
<title>Address | Konichiwa Cafe</title>
</head>
<script>
	function ask(){
		if(confirm("Are you sure to remove this address?") == true)
			return true;
		else 
			return false;
	}
</script>
	<script type="text/javascript">
	if(localStorage.getItem("CartQty")!= null){
		if(localStorage.getItem("CartQty") != 0){
			document.getElementById("cartIcon").innerHTML = "Cart(" + localStorage.getItem("CartQty") + ")";
		}
	} 
	</script>
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
	                        	<a id="cartIcon" href="CartController?action=showcart&i=<%= session.getAttribute("custid") %>"><i class="fa fa-shopping-cart "></i> Cart</a>
	                        	<a href="CustomerController?action=viewCustomer&i=<%= session.getAttribute("custid") %>"><i class="fa fa-user"></i> Account</a>
	                        	<a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>"><i class="fa fa-sign-out "></i> Logout</a>  
	                        </div>                       
	                    </div>
	                </div>
	            </div>
	        </div>
		</div>
		<br><br>
		<c:if test="${not empty added}"> 
          <div id="close" class="alert success">
 			<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
          	<h6 style="color:white"><c:out value="${added}"></c:out></h6>
          </div>
        </c:if>
        <% request.removeAttribute("added");%>
        <c:if test="${not empty failed}"> 
          <div id="close" class="alert failed">
 			<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
          	<h6 style="color:white"><c:out value="${failed}"></c:out></h6>
          </div>
        </c:if>
        <% request.removeAttribute("failed");%>
        <c:if test="${not empty updated}"> 
          <div id="close" class="alert success">
 			<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
          	<h6 style="color:white"><c:out value="${updated}"></c:out></h6>
          </div>
        </c:if>
        <% request.removeAttribute("updated");%>
        <c:if test="${not empty outdated}"> 
          <div id="close" class="alert failed">
 			<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
          	<h6 style="color:white"><c:out value="${outdated}"></c:out></h6>
          </div>
        </c:if>
        <% request.removeAttribute("outdated");%>
        <c:if test="${not empty deleted}"> 
          <div id="close" class="alert success">
 			<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
          	<h6 style="color:white"><c:out value="${deleted}"></c:out></h6>
          </div>
        </c:if>
        <% request.removeAttribute("deleted");%>

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
												<a href="AddressController?action=edit&i=<%= session.getAttribute("custid") %>&a=<c:out value="${address.addressid}"/>"
													style="background-color: #4CAF50; color: white">Edit</a>
												<a href="AddressController?action=delete&i=<%= session.getAttribute("custid") %>&a=<c:out value="${address.addressid}"/>"
													style="background-color: #E74C3C; color: white" onclick="return ask()">Delete</a>
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