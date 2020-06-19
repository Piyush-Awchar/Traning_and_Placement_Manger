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
        <a href="studinfo2.jsp"><b>Go Back</b></a>

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

        
            
        ResultSet rsi = stmt.executeQuery("select id from logindata where uname='"+uu+"'");
        int iidd=0;
        while(rsi.next()) {
            iidd = rsi.getInt(1);
        }

        ResultSet rs2 = stmt.executeQuery("select * from selectedstud where id="+iidd+"");
        //ResultSet rs3 = stmt.executeQuery("select * from selectedstud into outfile "F:\\random.csv" fields terminated by ","");

        ArrayList<Integer> idd = new ArrayList<Integer> ();
        ArrayList<String> cc = new ArrayList<String> ();
        
        int cnt=0;
        while(rs2.next()) {
            idd.add(rs2.getInt(1));
            cc.add(rs2.getString(2));
            cnt++;
        }

        if(cnt>0) {
        %>
        <br><br>
        <h3 class="he"> You Have <% out.print(cnt); %> Notifications </h3>
        <br><br>
        <%
        for(int iid : idd) {
            %>
            <h1> Hey....  <% out.print(uu); %>  having id : <% out.print(iid); %> </h1> 
            <%
            for(String ccn : cc) {
            %>
            <h1> you have been shortlisted for  <% out.print(ccn); %> Company <br> All best.... </h1>
            <%
            break;
            }
        }
        %>
        </table>
        <br><br>
        

         <%
        }
        else {
            out.print("<h1>Currently you are not been shortlisted for any company...... </h1>");
        }

    }
	catch (Exception e) {
		out.print("Error-----"+e);
	}
    %>
    </center>
</body>
</html>