<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import= "java.text.Format" %>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.Date"%>
<% 	
	Format dateFormat = new SimpleDateFormat("EEEEE");
	Format dateFormat2 = new SimpleDateFormat("MMMM dd, yyyy");
	
	String day = dateFormat.format(new Date());
	String date = dateFormat2.format(new Date()); 

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
	    <link rel="stylesheet" href="css/style.css" type="text/css">
	    <link rel="stylesheet" href="css/orderid.css" type="text/css">
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    	
    	<style type="text/css">
    	
    		table, th, td { border: 1px solid black; text-align:center; }
    		
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
    
		<title>Menu | Konichiwa Cafe</title>
	</head>
	
	<body class="example">
	
		<script type="text/javascript">
									
			function logoutFunction()
			{
				localStorage.removeItem("cashierID");
				window.location.replace("loginStaff.jsp");
			}
			
			
			function viewStaff(){
				location.href = "StaffController?action=profile&id=" + localStorage.getItem("cashierID") + "";
			}
			//baru sampai sini Hanis ^
			
			function newOrder() {
				location.href = "OrdersController?action=cashierViewNewOrder";
			
			}
			function preparingOrder() {
				location.href = "OrdersController?action=cashierViewPrepareOrder";
			
			}
			function trackOrder() {
				location.href = "OrdersController?action=cashierViewTrackOrder";
			
			}
			//baru sampai sini Aiman ^
			function viewMenu(){
				location.href = "StockController?action=cashierViewItemList";
			}
		</script>
		<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                   		<a href="indexStaff.jsp"><i class="fa fa-home  "></i> Home</a> 
	                      	<span>Konichiwa Cafe</span> 
	                       	      <p style="float:right;"><% out.print(day); %> <span>- <% out.print(date); %></span></p>
	                    </div>
	                </div>
	           </div>
	       </div>
	    </div>
         <div class="nav-item">
           <nav class="nav-menu mobile-menu" style="margin:auto;">
                                   
           	<ul>
           		<li><a href="#" onclick="viewMenu()">Manage Menu</a>
                 </li>
             <li><a href="#">Manage Orders</a>
                 <ul class="dropdown">
                     <li><a href="#" onclick="newOrder()"><i class=" "></i> New Orders</a></li> <!-- assign rider-->
                     <li><a href="#" onclick="preparingOrder()"><i class=" "></i> Preparing</a></li> <!-- btn ready-->
                     <li><a href="#" onclick="trackOrder()"><i class=" "></i> Track Orders</a></li>				                                
                 </ul>
             </li>   
             <li><a href="#" id="staff"></a>
                 <ul class="dropdown">
                 	<li><a href="#" onclick="viewStaff()"><i class="fa fa-user "></i> Profile</a></li>
                     <li><a href="#" onclick="logoutFunction()"><i class="fa fa-sign-out "></i> Logout</a></li>
                     
                 </ul>
             </li>
         </ul>
         				                    
     	</nav>
    </div>
    <script>
    	document.getElementById("staff").innerHTML = "Hi, "+ localStorage.getItem("staffName")+"!";
    </script>
		
		<br><br>
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
        
		<div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                        	<br><br>
                            <p style="font-size:30px">List of Item</p>
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
			<th>Item ID</th>
			<th>Name</th>
			<th>Price (RM)</th>
			<th>Stock</th>
			<th>Description</th>
			<th>Image</th>
			<th>Action</th>
		</tr>
		
		<c:forEach items="${item}" var="item">
			<tr>
				<td style="padding: 30px;"><c:out value="${item.itemid}"/></td>
				<td><c:out value="${item.name}" /></td>
				<td><c:out value="${item.price}" /></td>
				<c:if test="${item.stock >= 1}">
					<td style="padding: 30px;"><c:out value="${item.stock}" /></td>
				</c:if>
				<c:if test="${item.stock < 1}">
					<td style="color:red; padding: 30px;"><c:out value="Out of stock!" /></td>
				</c:if>
				
				<td><c:out value="${item.description}" /></td>
				<td><img src="data:image/jpg;base64,${item.image}" width="250" height="100"/></td>
				
				<td width="20%" align="center"><a href="StockController?action=cashierUpdateStock&id=<c:out value="${item.itemid}" />"><button class="updatebtn" style="border:none;">Update Stock</button></a><br>
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>
	<br><br>
	</body>
</html>