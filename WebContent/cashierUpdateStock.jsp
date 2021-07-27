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
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    	
    	<style type="text/css">
    		.btnenable{
	       	border: none;        
		  	background-color: green;
       		}
    		 
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
			h4  {
				
				font-size: 17px;
				font-weight: 500;
				color: black;
				align: center;
				display: inline-block;
			}
			h5{
				font-size: 14px;
				font-weight: 400;
				color: 	#686868;
				align: center;
				display: inline-block;
				margin-left: 13px;
			}
			h6{
				font-size: 19px;
				font-weight: 700;
				color: 	red;
				align: center;
				display: inline-block;
				margin-left: 13px;
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
		<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
                            <h2>Update Stock</h2>
                            <form name="form1" method="post" id="ff" action="StockController?action=update">
                            	<input type="hidden" name="id" id="id" value="<c:out value="${item.getItemid()}"/>" />
                            	<div class="group-input">
									<label for="itemname">Item Name</label>
									<c:out value="${item.name}" />
								</div>
								
								<div class="group-input">
									<label for="itemprice">Item Price (RM)</label>
									<c:out value="${item.price}"/>
								</div>
								
								<div class="group-input">
									<label for="itemstock">Item Stock <i style="font-size:12px;">(Set '0' if this item is unavailable)</i></label>
									<c:choose>
									<c:when test="${item.stock >= 0}">
										<input type="number" name="stock" min=0 value="${item.stock}">
									</c:when>
									<c:otherwise>
										<input type="number" name="stock" min=0 placeholder="Enter quantity of stock">
									</c:otherwise>
									</c:choose>									
								</div>
								
								<div class="group-input">
									<label for="itemdesc">Item Description</label>
									<c:out value="${item.description}"/>
								</div>
								<input type="submit" name="updateStock" class="btnenable primary-btn" value="Submit"> &nbsp;								
                            </form>
                            	<a href="StockController?action=cashierViewItemList"><button class="primary-btn" style="border:none; float:right;">Back</button></a>
                    </div>
                </div>
             </div>
        </div>
        </div>

</body>
</html>