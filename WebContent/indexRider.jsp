<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Loading</title>
	</head>
	<body>
		<script type="text/javascript">
			window.onload = function() {
				if(localStorage.getItem("email")!= null){
					if(localStorage.getItem("email") != ""){
						window.location.replace("OrdersController?action=viewRiderOrders&email=" + localStorage.getItem("email") + "");
					}
				} else {

					window.location.replace("loginRider.jsp");
				}
			};
		</script>
		<script type="text/javascript">
			window.reload();
		</script>
	</body> 
</html>