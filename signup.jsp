<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>

<%
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String addr1=request.getParameter("addr1");
String addr2=request.getParameter("addr2");
String addr3=request.getParameter("addr3");
String addr4=request.getParameter("addr4");
String psw=request.getParameter("psw");
String cpsw=request.getParameter("cpsw");

if(psw.equals(cpsw)){	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","konichiwa","cafe");
		String sql="INSERT INTO CUSTOMER(custfname,custlname,custphone,custemail,custpassword) VALUES(?,?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,fname);
		ps.setString(2,lname);
		ps.setString(3,phone);
		ps.setString(4,email);
		ps.setString(5,psw);
		int x=ps.executeUpdate();
		
		String sql2="INSERT INTO ADDRESS(addressstreet,addresscity,addresspostcode,addressstate,custid) VALUES(?,?,?,?,(SELECT MAX(custid) FROM CUSTOMER))";
		PreparedStatement ps2=conn.prepareStatement(sql2);
		ps2.setString(1,addr1);
		ps2.setString(2,addr2);
		ps2.setString(3,addr3);
		ps2.setString(4,addr4);
		int x2=ps2.executeUpdate();
		
		if(x!=0){
			out.print("Sign up successfully!");
		}else{
			out.print("Sign up unsuccessful!");
		}
	}
	catch(Exception e){out.print(e);}
}
else{
	out.print("Password not match!");
}
%>