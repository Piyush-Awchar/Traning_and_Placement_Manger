<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.servlet.*"%>
<html>
<head>
    <title>Login Page</title>
    <script>
        function onc() {
           // alert("");
            window.location = "shortlist.jsp";
        }
        function onc2() {
                // alert("");
                window.location = "error.html";
            }
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
        <a href="admincheck2.jsp"><b>Go Back</b></a>
        <script>
        //   var cn = prompt("Enter The Company Name","");
        </script>
        
<%
    
	Connection conn = null;
	Statement stmt = null;
	//ResultSet rsu = null;
    //ResultSet rsp = null;
	
	try {      

        Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp?serverTimezone=UTC", "root", "");
		stmt = conn.createStatement();

        if(session.getAttribute("username")==null) {
                response.sendRedirect("one.html");
            }

            String uu = (String)session.getAttribute("username");
        String cname = request.getParameter("cnc");

        ResultSet rs = stmt.executeQuery("select * from selectedstud where company='"+cname+"'");
        %>       
        <table>
        <h1>The shortlisted Student id's for ${cname} are</h1>
        <tr><th>ID of Student</th><th>Company Name</th></tr>
        <%
        int i=0;
        
        while(rs.next()) {
            i++;
            %>
            <tr><td>
            <%
            out.print(rs.getString(1));
            %>
            </td><td> <%
            out.print(rs.getString(2));
            %>   </td></tr>
            <%

        }
        %>       
        </table>
        <%
        
        
        String path = "F:\\"+cname+".csv";
        out.print(path);
        String q=",";
        ResultSet rs2 = stmt.executeQuery("select * from selectedstud into outfile '"+path+"' fields terminated by '"+q+"'");
        out.print("file has been created");

    }
	catch (Exception e) {
		out.print("Error-----"+e);
	}
    %>
    </center>
</body>
</html>