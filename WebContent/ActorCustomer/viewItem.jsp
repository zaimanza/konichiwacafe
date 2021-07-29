<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int bill=0;
	double totalPriceItems = (double) request.getAttribute("totalPriceItems");
	int CartQty = (int) request.getAttribute("CartQty");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    
	    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
	    <link rel="stylesheet" href="../css/style.css" type="text/css">
    	
    	<style type="text/css">
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
	<input type="hidden" id="totalPriceItems" value="<%=totalPriceItems %>" height="0"/>
	<script>
		var totalPriceItems = document.getElementById("totalPriceItems").value;
		var CartQty = document.getElementById("CartQty").value;
		if(totalPriceItems != 0.0 ) {
			localStorage.setItem("totalPriceItems", totalPriceItems);
			localStorage.setItem("CartQty", CartQty);
			//document.getElementById("p1").innerHTML = jsEmail2;
		}
		function select(){
			document.getElementById("category").submit();
			document.getElementById("filter").style.display = "block";
			document.getElementById("btnAll").style.display = "block";
		}
		
		function myFunction() {
			  var x = document.getElementById("filter");
			  
			  if (x.style.display === "none") {
			    x.style.display = "block";
			    document.getElementById("btnAll").value="View All";
			    
			  } else {
			    x.style.display = "none";
			    window.location.href = "ItemController?action=viewItem"
			  }
			}
	</script>
	<body class="example">
		<div class="breacrumb-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb-text">
	                    	<a href="../index.jsp"><i class="fa fa-home  "></i> Home</a> 
	                        <span>Konichiwa Cafe</span> 
	                        <div class="navv">
	                        	<a href="OrdersController?action=trackOrder&i=<%= session.getAttribute("custid") %>"><i class="fa fa-motorcycle"></i> Track</a>
	                        	<a href="ItemController?action=viewItem"><i class="fa fa-list-alt "></i> Menu</a> 
	                        	<a href="CartController?action=showcart&i=<%= session.getAttribute("custid") %>">
	                        		<i class="fa fa-shopping-cart "></i> Cart 
	                        		<c:if test="${CartQty != 0}">
							 			(<c:out value="<%=CartQty %>" />)
									</c:if>
	                        	</a>
	                        	<a href="CustomerController?action=viewCustomer&i=<%= session.getAttribute("custid") %>"><i class="fa fa-user"></i> Account</a>
	                        	<a href="CustomerController?action=logout&i=<%= session.getAttribute("custid") %>"><i class="fa fa-sign-out "></i> Logout</a>  
	                        </div>                       
	                    </div>
	                </div>
	            </div>
	        </div>
		</div>
		<br>
		<c:if test="${not empty mycart}">
          <div id="close" class="alert success">
 			<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
          	<h6 style="color:white"><c:out value="${mycart}"></c:out></h6>
          </div>
        </c:if>
        <% request.removeAttribute("mycart");%>
        		
		<div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                        	<br><br>
                            <p style="font-size:30px">MENU</p>
                         </div>
                    </div>
                 </div>
                 
                
                 
                 <div id="filter" class="col-lg-6 offset-lg-3" style="display:none">
					<div class="register-form">
					<form name="category" id="category" action="ItemController?action=itemByCategory" method="post" onsubmit="showFilter();">
						<div class="group-input">
							<label for="itemcategory">Filter by :</label>
							<select name="itemcategoryid" onchange="select();">
								<c:forEach items="${category}" var="category">											   									     									
	     								<option value="${category.getItemcategoryid()}"
  											<c:if test="${category.getItemcategoryid() eq selectedModule}">
  												selected="selected"</c:if> 
  											>${category.getCategoryname()}
  										</option>	  									
								</c:forEach>
							</select>
						</div>
					</form>   
					</div>
				</div>
            </div>
        </div>
         
		
		<div class="main">
			<div class="center" align="center">
				<input type="button" id="btnAll" class="primary-btn" style="border:none" onclick="myFunction()" value="Filter">
				<div class="row">
					<c:forEach items="${item}" var="item">
					  <div class="column">
							<div class="content" style="float:left">      		
								<img src="data:image/jpg;base64,${item.image}" width="384" height="181"/><br>                            
							    <h3><c:out value="${item.name}" /></h3><br> 
							    <h4>RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.price}"/></h4><br>                                             
							    <h5><c:out value="${item.description}" /></h5><br><br> 		
							    <c:if test="${item.stock <5}">
							 		<h6><c:out value="Sold Out"/></h6>
								</c:if>
								<c:if test="${item.stock >=5}">
							 		<a onclick='addToCart()' ><button class="primary-btn" style="border:none">Add to cart</button></a>
							 		<br>
							 		<h6><c:out value="${item.stock}" /></h6>
								</c:if>  
								<br><br>
							</div>
						</div>
					</c:forEach> 
				</div>
			</div>
		</div>
		<script>
			function addToCart() {
				if(totalPriceItems <= 150) {
					window.location.replace("CartController?action=addtocart&i=${item.getItemid()}");
				}
				else {
					alert("Cannot Add More items. Order has exceed limit of RM150.");
				}
			}
		</script>
	</body>
</html>