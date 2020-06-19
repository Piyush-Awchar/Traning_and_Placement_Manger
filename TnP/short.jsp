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

        String cname = request.getParameter("cname");
        String tenth = request.getParameter("10th");
        String twelth = request.getParameter("12th");
        String degree = request.getParameter("degree");
        String backlogs = request.getParameter("backlogs");

        if(session.getAttribute("username")==null) {
                response.sendRedirect("one.html");
            }

            String uu = (String)session.getAttribute("username");

        ResultSet rs = stmt.executeQuery("select id from studdata where tenth >='"+tenth+"' and twelth >='"+twelth+"' and avg_marks >='"+degree+"' and  nback <='"+backlogs+"'");
        String y="y";
        ArrayList<Integer> roll = new ArrayList<Integer> (); 
        while(rs.next()) {
            roll.add(rs.getInt(1));
            
        }   
        int n=0;
        for(int ro : roll) {
         n = stmt.executeUpdate("insert into selectedstud values("+ro+",'"+cname+"')");
        }
        if(n>=1)
            out.print("<h1>Data Added </h1>");

        ResultSet rs2 = stmt.executeQuery("select * from selectedstud where company='"+cname+"'");
        //ResultSet rs3 = stmt.executeQuery("select * from selectedstud into outfile "F:\\random.csv" fields terminated by ","");

        ArrayList<Integer> idd = new ArrayList<Integer> ();
        ArrayList<String> cc = new ArrayList<String> ();
        while(rs2.next()) {
            idd.add(rs2.getInt(1));
            cc.add(rs2.getString(2));
        }
        %>
        <div id="printdiv">
        <link rel="stylesheet" type="text/css" href="css/indexp.css">
        <h1> The Selected Students Are :</h1><br><br>
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
            break;
            }
        }
        %>
        </table>
        <br><br>
        
        </div>
       <!-- <b>Want to create a csv file click on below button</b> <br>
        <input type="Button" class="button" value="Create csv" onclick="cxl()"> -->
        <input type="Button" class="button" value="Print table" onclick="p()">
        
        <script>
            function cxl() {
                var ccname = "<%=cname %>";
                alert("comapny is :"+ccname);
                window.location.replace("xl.jsp?cnc="+ccname);
        }

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