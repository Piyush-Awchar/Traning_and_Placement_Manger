<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*"%>
<html>
<head>
    <title>Admin Login Page</title>
    <script>
        function onc() {
           // alert("");
            window.location = "personalinfo.html";
        }
        function onc1() {
           // alert("");
            window.location = "error.html";
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
            <br><br>

            <%
    
	Connection conn = null;
	Statement stmt = null;
	//ResultSet rsu = null;
    //ResultSet rsp = null;
	
	try {
                /*    if(session.getAttribute("username")==null) {
                        response.sendRedirect("adminlogin.html");
                    }*/
        Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp?serverTimezone=UTC", "root", "");
		stmt = conn.createStatement();

        String uname = request.getParameter("user");
        String pw = request.getParameter("pass");

       ResultSet rsu = stmt.executeQuery("select * from logindata where uname='" +uname+ "' and password='" +pw+ "' ");
       // rsp = stmt.executeQuery("select passw from logindata");
        int i=0;
        out.print(i);
        while(rsu.next()) {
            out.print(i);
            rsu.getString(1);
            i++;
        }

        if(i==1) { %>
                <h1>Welcome ${username}</h1>
        <%
                ResultSet rsu1 = stmt.executeQuery("select info_stat from logindata where uname='" +uname+ "' ");
                String stat="";
                while(rsu1.next()) {
                    stat = rsu1.getString(1);
                }
                if(stat == "n") { %>
                    <input class="button" type="button" value="Update Your info" onclick="onc()" required>
                    <input class="button" type="button" value="Notifications" onclick="onc2()" required><br>
        <%        }
                else if(stat == "y") { %>
                    <h1>You have updated your data</h1><br>
                    <input class="button" type="button" value="see Updateted Your info" onclick="onc1()" required>
                    <input class="button" type="button" value="Notifications" onclick="onc2()" required><br>
        <%        }
        
        }
	}
	catch (Exception e) {
		out.print("Error-----"+e);
	}
    %>

            
    </center>
</body>

</html>