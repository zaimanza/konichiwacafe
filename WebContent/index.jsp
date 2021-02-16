<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("custid") != null) {
		response.sendRedirect("CustomerController?action=home&i=" + session.getAttribute("custid"));
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="css/style.css">
	<title>Konichiwa Cafe</title>
</head>
<body class="example">
	<section class="hero-section">
		<div class="hero-items owl-carousel">
			<div class="single-hero-items set-bg" data-setbg="img/index.jpg">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<span>Welcome to</span>
							<h1>Konichiwa Cafe</h1>
							<p>
								1st Japanese Muslim Restaurant<br> in Malaysia
							</p>
							<a href="signupcust.jsp" class="primary-btn">New Customer?</a> <a
								href="login.jsp" class="primary-btn">Login</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dd.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
