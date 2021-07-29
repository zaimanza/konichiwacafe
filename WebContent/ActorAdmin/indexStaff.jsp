<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
</head>
	<body>
		<script type="text/javascript">
			window.onload = function() {
				if(localStorage.getItem("adminID")!= null || localStorage.getItem("cashierID")!= null)
				{
					if(localStorage.getItem("adminID") != "" && (localStorage.getItem("cashierID") == "" || localStorage.getItem("cashierID") == null)){				
						window.location.replace("StaffController?action=home&id="+localStorage.getItem("adminID"));
					}
					
					else if (localStorage.getItem("cashierID") != "")
					{
						window.location.replace("StaffController?action=home&id="+localStorage.getItem("cashierID"));
					}
				}
				
				else
					window.location.replace("../ActorAdmin/loginStaff.jsp");
				 

			};
		</script>
		<script type="text/javascript">
			window.reload();
		</script>
	</body>
</html>