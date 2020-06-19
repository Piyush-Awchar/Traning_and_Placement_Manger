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

        
            

        ResultSet rs2 = stmt.executeQuery("select * from selectedstud");
        //ResultSet rs3 = stmt.executeQuery("select * from selectedstud into outfile "F:\\random.csv" fields terminated by ","");

int cnt=0;
     /*   ArrayList<Integer> idd = new ArrayList<Integer> ();
        ArrayList<String> cc = new ArrayList<String> ();
        while(rs2.next()) {
            idd.add(rs2.getInt("id"));
            cc.add(rs2.getString("company"));
            cnt++;
        }
        %>
        <h3 class="he"> <% out.print(cnt); %> Students are selected </h3>
        <h1> The All Selected Students Are :</h1><br><br>
        <div id="printdiv">
        <link rel="stylesheet" type="text/css" href="css/indexp.css">
        <table id="studdata">
        <tr id="studdata1"><th id="studdata3"> ID </th> <th id="studdata3"> CName </th></tr>
        <%
        for(int iid : idd) {
            %>
            <tr id="studdata1"><td id="studdata2"> <% out.print(iid); %> </td>
            <%
            for(String ccn : cc) {
            %>
            <td id="studdata2"> <% out.print(ccn); %> </td> </tr>
            <%
            //break;
            }
  
  
  
  
        }*/


        while(rs2.next())
        {
            cnt++;   
         }


%>

<h3 class="he"> <% out.print(cnt); %> Students are selected </h3>
        <h1> The All Selected Students Are :</h1><br><br>
        <div id="printdiv">
        <link rel="stylesheet" type="text/css" href="css/indexp.css">
        <table id="studdata">
        <tr id="studdata1"><th id="studdata3"> ID </th> <th id="studdata3"> CName </th></tr>
<%
rs2 = stmt.executeQuery("select * from selectedstud");

        while(rs2.next())
        {
            
            int iid = rs2.getInt("id");
            String ccn = rs2.getString("company");

            %>

            <tr id="studdata1"><td id="studdata2"> <% out.print(iid); %> </td>
            <td id="studdata2"> <% out.print(ccn); %> </td> </tr>
          
          
            <%
            //break;
        }



        %>
        </table>
        <br><br>
        </div>
        <input type="Button" class="button" value="Print table" onclick="p()">
        <script>
            

            function p() {
                //window.frames["print_frame"].document.body.innerHTNL = document.getElementById("printdiv").innerHTNL;
                //window.frames["print_frame"].window.focus();
                //window.frames["print_frame"].window.print();
                var di = document.getElementById("printdiv");
                newWin = window.open("");
                newWin.document.write(di.outerHTML);
                newWin.print();
                newWin.close();

            }
        </script>
         <%
    }
	catch (Exception e) {
		out.print("Error-----"+e);
	}
    %>
    </center>
</body>
</html>