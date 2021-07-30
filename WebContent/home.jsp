<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import= "java.text.Format" %>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.Date"%>
<% 
	if (session.getAttribute("custid") == null) {
		response.sendRedirect("login.jsp");
	}

	Format dateFormat = new SimpleDateFormat("EEEEE");
	Format dateFormat2 = new SimpleDateFormat("MMMM dd, yyyy");
	
	String day = dateFormat.format(new Date());
	String date = dateFormat2.format(new Date()); 
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
    

    <style type="text/css">
        .center {
          display: block;
          margin-left: auto;
          margin-right: auto;
          width: 50%;
        }
        .navv{
        	float:right;
        }
        .container2{
        	text-align:center;
        	overflow-x: hidden;
	        background-color:#e7ab3c; 
	        padding-top: 30px;
	        padding-bottom: 30px;
        }

        .container2 p {
        	text-align: center;
        	font-size: 36px;
			font-family: "Muli", sans-serif;
			color: white;
			font-weight: 600;
			line-height: 26px;
			margin: 0 0 15px 0;
		}
		.container2 h1 {
        	text-align: center;
        	font-size: 20px;
			font-family: "Muli", sans-serif;
			color: white;
			font-weight: 400;
			line-height: 26px;
			margin: 0 0 15px 0;
		}
		.container2 h2 {
        	text-align: center;
        	font-size: 15px;
			font-family: "Muli", sans-serif;
			color: white;
			font-weight: 400;
			line-height: 26px;
			margin: 0 0 15px 0;
		}
		.container3{
			margin:auto;
			width:60%;
			text-align: justify;
		}
		footer {
		  	text-align: center;
		  	padding: 1px;
		 	background-color: black;
		  	color: white;
		}
		.fa-instagram {
	      color: white;
	    }
	    .fa-facebook {
	      color: white;
	    }
	    
	    footer a{
		  color: white;
		  background-color: transparent;
		  text-decoration: none;
		}
		footer p{
			text-align: center;
        	font-size: 15px;
			font-family: "Muli", sans-serif;
			color: #636363;
			font-weight: 400;	
		}
    </style>
	
<title>Home | Konichiwa Cafe</title>
</head>
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
<section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                            <p><% out.print(day); %> <span>- <% out.print(date); %></span></p>
                            
                            <h2>Hi, <c:out value="${customer.fname} ${customer.lname}" /> !</h2>
                        </div>
                        <!-- From Banner Section Begin -->
                        <div class="banner-section spad">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="single-banner">
                                            <img src="img/ayam.png" alt="">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="single-banner">
                                            <img src="img/pexels1.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="single-banner">
                                            <img src="img/pexels2.jpg" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Banner Section End -->
                </div>
				</div>
            </div>
        </div>
        
        <div class="container2" >
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        
                         <p>About Us</p>
                         <h1>We Are Syariah Compliance Restaurant</h1>
                         <div class="container3">
                         <h2>Konichiwa Cafe is a premier and creative Japanese Restaurant that has been proudly serving the local and tourist beyond since 2016. 
                         Since day one, our mission has been to provide high-quality Asian food for those who seek skillful cooking and an extraordinary dining experience. 
                         Go ahead and make a reservation to find out firsthand why clients keep coming back to our Muslim Japanese Restaurant.</h2>
                       	 </div>
                </div>
				</div>
            </div>
        </div> 
        
    </section>
    
    <footer>
    <br>
     <p><i class="fa fa-fw fa-instagram"></i><a href="https://www.instagram.com/konichiwacafe/?hl=en"> konichiwacafe</a>
     <i class="fa fa-fw fa-facebook"></i><a href="https://www.facebook.com/Konichiwa-Cafe-146233119211261/"> Konichiwa Cafe</a>
	 <p style="padding-left:700px;"><i class="fa fa-fw fa-copyright ">2021Beelab,Inc.AllRightsReserved</i></p>
	</footer>
 
</body>
</html>