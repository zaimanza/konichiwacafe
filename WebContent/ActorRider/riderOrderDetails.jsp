<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import= "java.text.Format" %>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.Date"%>
<%
	Format dateFormat = new SimpleDateFormat("EEEEE");
	Format dateFormat2 = new SimpleDateFormat("MMMM dd, yyyy");
	String e = (String) request.getAttribute("email");
	String day = dateFormat.format(new Date());
	String date = dateFormat2.format(new Date());
	int bill=0;
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
	    <link rel="stylesheet" href="../css/style.css" type="text/css">
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    	
    	<style type="text/css">
    	
    		table, th, td { 
    			border: 1px solid black; 
    			padding: 15px;
    		}
    		
    		 table.center { margin-left: auto; margin-right: auto; }
    		 
	        .center {
	          max-width: 1000px;
			  margin: auto;
	        }
	        .navv{
	        	float:right;
	        }
			
			/* Create four equal columns that floats next to each other */
			.column {
			  float: right;
			  width: 33%;
			  padding:15px;
			}
			.row > .column {
			  padding: 15px;
			}
			
			/* Content */
			.content {
			  background-color: white;
			  padding: 15px;
			  margin:auto;
			}
			.row:after {
			  content: "";
			  display: table;
			  clear: both;
			}
			
			* Responsive layout - makes a two column-layout instead of four columns */
			@media screen and (max-width: 900px) {
			  .column {
			    width: 50%;
			  }
			}
			
			/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
			@media screen and (max-width: 600px) {
			  .column {
			    width: 100%;
			  }
			}
			
			h3  {
				font-size: 19px;
				font-weight: 500;
				color: black;
				align: center;
				display: inline-block;
				
			}
			
			.p {
				font-size: 30px;
				font-family: "Muli", sans-serif;
				color: #636363;
				font-weight: 400;
				line-height: 26px;
				margin: 0 0 15px 0;
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
		
		<title>Order Details | Konichiwa Cafe</title>
	</head>
	<body class="example" class="center">

		<input type="hidden" id="emailJSP" value="<%=e %>" height="0"/>
		<script type="text/javascript">
			var jsEmail = document.getElementById("emailJSP").value;
			var jsEmail2;
			if(localStorage.getItem("email")!=null) {
				jsEmail2 = localStorage.getItem("email");
				//document.getElementById("p1").innerHTML = jsEmail2;
			} else {
				localStorage.setItem("email", jsEmail);
				jsEmail2 = jsEmail;
				//document.getElementById("p1").innerHTML = jsEmail2;
			}
			window.reload();
			function logoutFunction(){
				localStorage.removeItem("email");
				window.location.replace("../ActorRider/loginRider.jsp");
			}
			
			function viewProfile(){
				window.location.replace("RiderController?action=viewRider&email="+ jsEmail2 + "");
			}
			
			//tak jadi
			openPage = function() {
				location.href = "OrdersController?action=viewRiderOrders&email=" + localStorage.getItem("email") + "";
				}
			
		</script>
	<!-- Navigation bar -->
	<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                    	  <a href="../ActorRider/indexRider.jsp"><i class="fa fa-home  "></i> Home</a> 
	                        <span>Konichiwa Cafe</span> 
	                        <div class="navv">
	                           	<a href="#" onclick="viewProfile()"><i class="fa fa-user"></i> Profile</a>
	                        	<a class="active" href="#" onclick="logoutFunction()"><i class="fa fa-sign-out "></i> Logout</a>  
	                        </div>                       
	                    </div>
	                </div>
	            </div>
	        </div>
	</div>
         
		<br><br>
		
		<div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                        	<br><br>
                            <p style="font-size:30px">Order Details</p>
                            <br><br>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
        
        
        <div class="main">
		<div class="center" align="center">
        <table border="1">
	
		<tr>
						<th>No.</th>
						<th>Item Name</th>
						<th>Quantity</th>						
					</tr>
						
					<c:forEach items="${orderdetails}" var="orders">
						<% bill++;%>
						<tr>
							<td><% out.print(bill);%></td>
							<td><c:out value="${orders.getItemName()}" /></td>
							<td><c:out value="${orders.getItem_OrderQty()}" /></td>
						</tr>
					</c:forEach>

		</table>
		<br>
		
		<div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                        	<br><br>
                            <p style="font-size:30px">Customer Details</p>
                            <br><br>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
		
		<table border="1">
	
		<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Phone Number</th>						
					</tr>
						
						<tr>
							<td><c:out value='${customer.fname} ${customer.lname}' /></td>
							<td><c:out value='${customer.phone}' /></td>
							<td><c:out value='${customer.phone}' /></td>
						</tr>

		</table>
		<br>
			<a href="../ActorRider/indexRider.jsp"><button class="primary-btn" style="border:none">Back</button></a>
		</div>
		</div>
		<br><br>
		
        
        	
		
	</body>
</html>