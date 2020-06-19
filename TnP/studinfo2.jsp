
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
            window.location = "personalinfo.jsp";
        }
        function onc1() {
           // alert("");
            window.location = "personalinfo.jsp";
        }
        function onc2() {
                // alert("");
                window.location = "notifi.jsp";
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
		
        Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp?serverTimezone=UTC", "root", "");
		stmt = conn.createStatement();   

        if(session.getAttribute("username")==null) {
                response.sendRedirect("one.html");
            }

        String uu = (String)session.getAttribute("username");
 
 
         %>
                <h1>Welcome <% out.print(uu);  %>  </h1>
        <%      
                ResultSet rsu1 = stmt.executeQuery("select info_stat from logindata where uname='" +uu+ "' ");
               // out.print("heyyyyy");
                String stat="";
                
                while(rsu1.next()) {
                    stat = rsu1.getString(1);
                }
                
                if(stat.equals("null")) { %>
                    <input class="button" type="button" value="Update Your info" onclick="onc()" required>
                    <input class="button" type="button" value="Notifications" onclick="onc2()" required><br>
        <%        }
                else  { %>
                    <h1>You have updated your data</h1><br>
                    <input class="button" type="button" value="see Updateted Your info" onclick="onc1()" required>
                    <input class="button" type="button" value="Notifications" onclick="onc2()" required><br>
        <%        }

	}
	catch (Exception e) {

		out.print("Error-----"+e);
	}
    %>
    </center>
</body>
</html>