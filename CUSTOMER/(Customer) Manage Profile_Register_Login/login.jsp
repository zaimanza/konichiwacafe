<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Login| Konichiwa Cafe</title>
</head>
<script type="text/javascript">
function showPassword() {
    var x = document.getElementById("psw");
    if (x.type === "password") {
      x.type = "text";
    } else {
      x.type = "password";
    }
  }
</script>
<body>
	<div align="center">
		<h1>Login Form</h1>
		<form action="CustomerController?action=login" method="post">
			<table>
				<tr>
					<td>Email:</td>
					<td><input type="email" name="email" placeholder="Email"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" id="psw"
						placeholder="Password"></td>
				</tr>
			</table>
			<br> <input type="checkbox" onclick="showPassword()">Show
			Password<br> <input type="submit" name="login" value="Log in">
		</form>
		<br> <a href="index.jsp">Cancel</a>
	</div>
</body>
</html>


<!-- <!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.1.1">
<title>Signin Template · Bootstrap</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/sign-in/">

Bootstrap core CSS
<link href="dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<script type="text/javascript">
function showPassword() {
    var x = document.getElementById("psw");
    if (x.type === "password") {
      x.type = "text";
    } else {
      x.type = "password";
    }
  }
</script>
Custom styles for this template
<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">
	<form class="form-signin" action="CustomerController?action=login" method="post">
		<img class="mb-4" src="" alt=""
			width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">Log in Form</h1>
		<label for="inputEmail" class="sr-only">Email</label> <input
			type="email" class="form-control"
			placeholder="Email" name="email" required autofocus> <label
			for="inputPassword" class="sr-only">Password</label> <input
			type="password" id="psw" name="password" class="form-control"
			placeholder="Password" required>
		<div class="checkbox mb-3">
			<label> <input type="checkbox" onclick="showPassword()">
				Show password
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
			in</button>
	</form>
</body>
</html> -->
