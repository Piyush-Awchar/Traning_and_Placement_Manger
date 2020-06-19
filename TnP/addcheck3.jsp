<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*"%>
<%@ page import = "java.servlet.*"%>
<html>
<head>
    <title>Login Page</title>
    <script>
        function onc() {
           // alert("");
            window.location = "addcheck4.jsp";
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

<%
    
	Connection conn = null;
	Statement stmt = null;
	//ResultSet rsu = null;
    //ResultSet rsp = null;
	
	try {
		
         if(session.getAttribute("username")==null) {
                response.sendRedirect("index.html");
            }

        String uu = (String)session.getAttribute("username");
 
           
            out.print("<h1> Welcome "+uu+" </h1> "); 
             
            %>
            <input class="button" type="button" value="all students data" onclick="onc()" required>
            <!--<input class="button" type="button" value="" onclick="onc2()" required><br>-->
        <%
        
	}
	catch (Exception e) {
		out.print("Error-----"+e);
	}
    %>
    </center>
</body>
</html>