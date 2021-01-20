<html>
<body>
<form action="signup.jsp" method="post">
<table align=center>
	<tr>
		<th colspan=4 style="padding:15px;">Create New Customer Form</th>
	</tr>
	<tr>
		<td>Name :</td>
		<td><input type="text" name="fname" placeholder="First Name"></td>
		<td><input type="text" name="lname" placeholder="Last Name"></td>
	</tr>
	<tr>
		<td>Email :</td>
		<td colspan=2><input type="email" name="email" placeholder="Email" size="47px"></td>
	</tr>
	<tr>
		<td>Phone No. :</td>
		<td colspan=2><input type="text" name="phone" placeholder="Phone No." size="47px"></td>
	</tr>
	<tr>
		<td>Address :</td>
		<td><input type="textbox" name="addr1" placeholder="Street"></td>
		<td><input type="text" name="addr2" placeholder="City"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="text" name="addr3" placeholder="Postcode"></td>
		<td><input type="text" name="addr4" placeholder="State" ></td>
	</tr>
	<tr>
		<td>Enter Password :</td>
		<td colspan=2><input type="password" name="psw" placeholder="Password" size="47px"></td>
	</tr>
	<tr>
		<td>Confirm Password :</td>
		<td colspan=2><input type="password" name="cpsw" placeholder="Confirm Password" size="47px"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="reset" value="Reset">&nbsp;
		<input type="submit" value="Sign up"></td>
	</tr>
</table>
</form>
</body>
</html>