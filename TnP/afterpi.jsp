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
            <a href="logout.jsp"> <b class="he" id="lo">Logout</b> </a>
        </div>
		<a href="studinfo2.jsp"><b>Go Back</b></a>
	</center>
<center>
	<%

	if(session.getAttribute("username")==null) {
                        response.sendRedirect("one.html");
        }

	String uu = (String)session.getAttribute("username");	
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp?serverTimezone=UTC", "root", "");
		stmt = conn.createStatement();

		String f_name = request.getParameter("fname");
		String l_name = request.getParameter("lname"); 
        String b_name = request.getParameter("branch");
        String c_year = request.getParameter("year");
        String roll = request.getParameter("rno");
        String addr = request.getParameter("address");
		String e_mail = request.getParameter("mail"); 
		String c_no = request.getParameter("cno"); 
        String tenth = request.getParameter("10th"); 
		String tmarks = request.getParameter("12th");
        String amarks = request.getParameter("degree");
        String nback = request.getParameter("backlogs");
        String addinfo = request.getParameter("addin");
		int ro = Integer.parseInt(roll);
		//int cn = Integer.parseInt(c_no);
		int tm = Integer.parseInt(tenth);
		int ttm = Integer.parseInt(tmarks);
		int am = Integer.parseInt(amarks);
		int nb = Integer.parseInt(nback);

			String fn = "";
            String ln = "";
            String em = "abc";
            String mn = "";	
		
		ResultSet rs2 = stmt.executeQuery("select id,fname,lname,e_mail,mob_no from logindata where uname='"+uu+"'");
		int id = 0,in=0;
		//out.print("user is "+uu);
		while(rs2.next()) {
			String i = rs2.getString(1);
			id = Integer.parseInt(i);
			fn = rs2.getString(2);
            ln = rs2.getString(3);
            em = rs2.getString(4);
            mn = rs2.getString(5);
			in++;
		}

		
		ResultSet rs1 = stmt.executeQuery("select info_stat from logindata where id="+id+"");
		String is = "";

		while(rs1.next()) {
			is = rs1.getString(1);
		}
		
	if(!(is.equals("y")) ) {
		int no = stmt.executeUpdate("insert into studdata values("+id+",'"+fn+"','"+ln+"','"+b_name+"','"+c_year+"',"+ro+",'"+addr+"','"+em+"','"+mn+"',"+tm+","+ttm+","+am+","+nb+",'"+addinfo+"')");
		if(no>0) { %>

			<script> alert("Account details has been updated"); 
			</script>
				<h1 id="popup">Account details has been updated</h1>
				<a href="studinfo2.jsp"><b> Click Here To back<b> </a>
			<%
			String stat="y";
			int no1 = stmt.executeUpdate("update logindata set info_stat='" +stat+ "' where e_mail='" +em+ "'");
			
			 }
		else{ %>

			<script> alert("Nothing Happn"); </script>
			<h1 id="popup">Something is Wrongg</h1> <br>
			<h1 id="popup">Try Again</h1>
			<% 
		//	out.print("<h1 >Something is Wrongg try again</h1>");
			}
	}
	else {
		
		int no = stmt.executeUpdate("update studdata set bname='"+b_name+"',cyear='"+c_year+"', roll="+ro+", address='"+addr+"', tenth="+tm+", twelth="+tm+", avg_marks="+am+", nback="+nb+", addinfo='"+addinfo+"' where id="+id+"  ");
		if(no>0) { %>

			<script> alert("Account details has been updated"); 
			</script>
				<h1 id="popup">Account details has been updated</h1>
				<a href="studinfo2.jsp"><b> Click Here To back<b> </a>
			<%
			String stat="updated";
			int no1 = stmt.executeUpdate("update logindata set info_stat='" +stat+ "' where id='" +id+ "'");
			
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
		SQLIntegrityConstraintViolationException
	}*/
	}
	
	catch (Exception ex) {
		out.print(ex);
		out.print("<h1>Your e-mail and mob_no should be same as that you have given while sign up</h1>");
		%>
		<h1 id="popup">Something is Wrongg</h1>
		<a href="studinfo2.jsp"> <b>Go Back </b></a> 
		<%
	}
	%>
	
	</center>
</body>
</html>