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
	    <link rel="stylesheet" href="../css/orderid.css" type="text/css">
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<style>
			.center 
			{
		    	display: block;
		        margin-left: auto;
		        margin-right: auto;
		        width: 85%;
		        padding-bottom:100px;
		   	}
		       
		    .list{
		    	
		    	margin:auto;
		    	margin-top:30px;
		    	margin-bottom:10px;		    	
		    }
				
			.list td
			{
				padding-left:30px;
				padding-right:30px;
				text-align:left;
				border:1px;
				
			}
			
			.list th
			{
				text-align:center;
				background:#e7ab3c;
				padding-top:10px;
				padding-bottom:10px;				
			}
			    
			.removebtn 
			{
				border:none;
				font-size: 14px;
				font-weight: 500;
				color: #ffffff;
				background: #e7ab3c;
				text-transform: uppercase;
			}
			
			.radio{				
				display:inline-block;
				text-align: center; 
				width: 100%;
				margin-top:30px;
												
			}
			
			.radio-label{
				margin-left:30px;
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
		<meta charset="ISO-8859-1">
		<title>Rider | Konichiwa Cafe</title>
	</head>
<body class="example" class="center">
		<script type="text/javascript">
			
		function logoutFunction()
		{
			localStorage.removeItem("adminID");
			window.location.replace("../ActorAdmin/loginStaff.jsp");
		}
		
		function viewCustomer(){
			location.href = "CustomerController?i=all&id=" + localStorage.getItem("adminID") + "";
		}
		function viewCustomerActive(){
			location.href = "CustomerController?i=active&id=" + localStorage.getItem("adminID") + "";
		}
		function viewCustomerInactive(){
			location.href = "CustomerController?i=inactive&id=" + localStorage.getItem("adminID") + "";
		}
		function viewStaff(){
			location.href = "StaffController?action=profile&id=" + localStorage.getItem("adminID") + "";
		}
		function updateStaff(){
			location.href = "StaffController?action=updateProfile&id=" + localStorage.getItem("adminID") + "";
		}
		
		//baru sampai sini Hanis ^
		
		
		function viewRider(){
			location.href = "RiderController?action=adminViewAllRider&id=" + localStorage.getItem("adminID") + "";
		}
		
		function viewCashier(){
			location.href = "StaffController?action=adminViewAllCashier&id=" + localStorage.getItem("adminID") + "";
		}
		function newOrder() {
			location.href = "OrdersController?action=adminViewNewOrder";
		
		}
		function preparingOrder() {
			location.href = "OrdersController?action=adminViewPrepareOrder";
		
		}
		function trackOrder() {
			location.href = "OrdersController?action=adminViewTrackOrder";
		
		}	
		function viewReport(){
			location.href = "ReportController?action=adminViewReport";
		}
		function viewMenu(){
			location.href = "ItemController?action=adminViewItem";
		}
		function addItem(){
			location.href = "ItemController?action=addItem";
		}
		
	</script>
			<!-- Navigation bar -->
			<div class="breacrumb-section">
		        <div class="container">
		            <div class="row">
		                <div class="col-lg-12">
		                    <div class="breadcrumb-text">
		                   		<a href="../ActorAdmin/indexStaff.jsp"><i class="fa fa-home  "></i> Home</a> 
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
	           		<li><a href="#">Manage Menu</a>
		           		<ul class="dropdown">
		                     <li><a href="#" onclick="viewMenu()"><i class=" "></i> View Menu</a></li>
		                     <li><a href="#" onclick="addItem()"><i class=" "></i> Add New Item</a></li>				                                
		                 </ul>
	                 </li>
	             <li><a href="#">Manage Orders</a>
	                 <ul class="dropdown">
	                     <li><a href="#" onclick="newOrder()"><i class=" "></i> New Orders</a></li> <!-- assign rider-->
	                     <li><a href="#" onclick="preparingOrder()"><i class=" "></i> Preparing</a></li> <!-- btn ready-->
	                     <li><a href="#" onclick="trackOrder()"><i class=" "></i> Track Orders</a></li>				                                
	                 </ul>
	             </li>
	             <li><a href="#">Manage Accounts</a>
	                 <ul class="dropdown">
	                     <li><a href="#" onclick="viewCustomer()"><i class="fa fa-user "></i> Customer</a></li>
	                     <li><a href="#" onclick="viewRider()"><i class="fa fa-user "></i> Rider</a></li>
	                     <li><a href="#" onclick="viewCashier()"><i class="fa fa-user "></i> Cashier</a></li>				                                
	                 </ul>
	             </li>
	             <li><a href="#" onclick="viewReport()">View Report</a></li>     
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
        <c:if test="${not empty deleted}"> 
          <div id="close" class="alert success">
 			<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
          	<h6 style="color:white"><c:out value="${deleted}"></c:out></h6>
          </div>
        </c:if>
        <% request.removeAttribute("deleted");%>
	<table class="list">
		<tr>
	        <th>No.</th>
	        <th>Name</th>
	        <th>Rider ID</th>
	        <th>Phone</th>
	        <th>Email</th>
	        <th>Verify Status</th>
	        <th colspan=2>Action</th>
	        
	    </tr>
	        
		<c:forEach items="${riderlist}" var="rider">
        		<%bill++; %>
				<tr>
					<td><% out.print(bill); %></td>  
					<td><c:out value="${rider.getFName()} ${rider.getLName()}"/></td>
					<td><c:out value="${rider.getRiderId()}"/></td>
					<td><c:out value="${rider.getPhone()}"/></td>
					<td><c:out value="${rider.getEmail()}"/></td>
					<c:if test="${ rider.getStat() == 1 }">
						<td><a href="RiderController?action=adminVerifyRider&id=<c:out value='${rider.getRiderId()}'/>" style="color:green;">Verify</a></td>
					</c:if>
					<c:if test="${ rider.getStat() == 2 }">
						<td><a href="RiderController?action=adminUnVerifyRider&id=<c:out value='${rider.getRiderId()}'/>"style="color:red;">Invalidate</a></td>
					</c:if>	
					<td><a href="RiderController?action=adminUpdateRider&id=<c:out value='${rider.getRiderId()}'/>"><button class="updatebtn" style="border:none;">Update</button></a></td>				
					<td><a href="RiderController?action=adminDeleteRider&id=<c:out value='${rider.getRiderId()}'/>"><button class="deletebtn" style="border:none">Delete</button></a></td>
					
				</tr>		
        </c:forEach>
	</table>

</body>
</html>