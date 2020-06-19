<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>

</script>
	<link rel="stylesheet" type="text/css" href="css/indexp.css">		
</head>
<body>
<center>
        <div class="back">
            <div class="img">
                <img src="slogo.png">
            </div>
        </div>
		<div class="head">
            <a href="index.html"> <b class="he" id="hp">Home Page</b>
            <a href="aboutus.html"> <b class="he" id="au">About us</b> </a>
            <a href="contactus.html"> <b class="he" id="co">Contact us</b> </a>
            <a href="signup.html"> <b class="he" id="su">Sign up</b> </a>
        </div>
	</center>
<center>
	<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp?serverTimezone=UTC", "root", "");
		stmt = conn.createStatement();
		String f_name = request.getParameter("fname");
		String l_name = request.getParameter("lname"); 
		String e_mail = request.getParameter("mail"); 
		String c_no = request.getParameter("cno"); 
		String uname = request.getParameter("user");
		String pw = request.getParameter("pass");
		//int cn = Integer.parseInt(c_no);
		
		String info = "null";
		int no = stmt.executeUpdate("insert into logindata values("+info+",'"+f_name+"','"+l_name+"','"+e_mail+"','"+c_no+"','"+uname+"','"+pw+"','"+info+"')");
		if(no>0) { %>

			<script> alert("Account has been created Succesfully"); 
			</script>
				<h1 id="popup">Account has been created Succesfully</h1>
				<a href="one.html"><b> Click Here To Login<b> </a>
			<%
			//	out.print("<h1 >Account has been created Succesfully</h1>");
			 }
		else{ %>

			<script> alert("Nothing Happn"); </script>
			<h1 id="popup">Something is Wrongg</h1> <br>
			<h1 id="popup">Try Again</h1>
			<% 
		//	out.print("<h1 >Something is Wrongg try again</h1>");
			}
	}
	/*catch (Exception e) {
		out.print("Error-----"+e);
	}*/
	catch (Exception ex) {
		out.print(ex);
		%>
		<h1 id="popup">The UserName or E-mail may be already taken</h1>
		<a href="signup.html"> <b>Go Back </b></a> 
		<%
	}
	%>
	
	</center>
</body>
</html>