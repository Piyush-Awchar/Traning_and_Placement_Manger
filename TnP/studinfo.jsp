
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

        String uname = request.getParameter("user");
        String pw = request.getParameter("pass");

        
            HttpSession sessionn = request.getSession();
            sessionn.setAttribute("username",uname);
            String uu = (String)sessionn.getAttribute("username");
            

       ResultSet rsu = stmt.executeQuery("select * from logindata where uname='" +uname+ "' and password='" +pw+ "' ");
       // rsp = stmt.executeQuery("select passw from logindata");
        int i=0;
        String fname="";
        String name="";
        while(rsu.next()) {
           fname = rsu.getString(1);
           name = rsu.getString(2);
            i++;
        }
        
        if(i==1) {
                 response.sendRedirect("studinfo2.jsp");   
        }
        else {
            out.print("Account Does Not Exists");
        }
	}
	catch (Exception e) {

		out.print("Error-----"+e);
	}
    %>
    </center>
</body>
</html>