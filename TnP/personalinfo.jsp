<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*"%>
<%@ page import = "java.servlet.*"%>
<html>
<head>
    <title>Personal Info</title>
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
            String fn = "";
            String ln = "";
            String em = "";
            String mn = "";
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

            rs = stmt.executeQuery("select fname,lname,e_mail,mob_no from logindata where uname='"+uu+"' ");
            
            while (rs.next()) {
                fn = rs.getString(1);
                ln = rs.getString(2);
                em = rs.getString(3);
                mn = rs.getString(4);
            }
            %>
            <script>
            //  document.getElementsByName("fname").value = <% %>;
            </script>

<%            }
            catch (Exception e) {
                out.print("Error----"+e);
            }
%>
        <form name="form1"  method="POST" action="afterpi.jsp">
            <fieldset>
                <legend align=left>Enter Personal Details</legend>
                <table align="center">
        
                <br><br>
        <tr>    <td><b>First NAME :</b> </td>  <td><input class="txt" type="text" id="fname" name="fname" title="Enter your First Name" value="<%=fn%>" disabled required><br><br></td></tr>
        <tr>    <td><b>Last NAME  :</b></td><td>   <input class="txt" type="text" name="lname" title="Enter your Last Name" value="<%=ln%>" disabled required><br><br></td></tr>
        <tr>    <td><b>BRANCH  :</b></td><td>   <select name="branch" required><option value="comp">COMP</option><option value="it">IT</option><option value="mech">MECH</option><option value="civil">CIVIL</option><option value="etc">E&TC</option></select><br><br></td></tr>
        <tr>    <td><b>Current Year of Study  :</b></td><td>   <select name="year" required><option value="te">TE</option><option value="be">BE</option></select><br><br></td></tr>
        <tr>
            <td><b>Roll No :</b> </td>
            <td><input class="txt" type="number" name="rno" title="Enter your Roll number" required><br><br></td>
        </tr>
        <tr>    <td><b>ADDRESS  :</b></td><td>   <input class="txt" type="text" name="address" title="Enter your Address" required><br><br></td></tr>

        <tr>    <td><b>E-mail     :</b> </td>  <td><input class="txt" type="email" name="mail" title="Enter your E-mail" value="<%=em%>" disabled required><br><br></td></tr>
        <tr>    <td><b>Mob No     :</b> </td>  <td><input class="txt" type="number" name="cno" title="Enter your Contact number" value="<%=mn%>" disabled required><br><br></td></tr>
        <tr>    <td><b>10th Marks   :</b> </td><td>  <input class="txt" type="number" name="10th" title="Enter your 10th Percentage" required><br><br></td></tr>
        <tr>    <td><b>12th/Diploma Marks   :</b> </td><td>  <input class="txt" type="number" name="12th" title="Enter your 12th Percentage" required><br><br></td></tr>
         <tr>   <td><b>Average Degree Marks <br>(Till last semester)  :</b> </td><td>  <input class="txt" type="number" name="degree" title="Enter your SGPA" required><br><br></td></tr>
          <tr>  <td><b>No. of backlogs  :</b></td><td> <input class="txt" type="number" name="backlogs" required><br><br></td></tr>
          <tr>  <td><b>Additional Achievements :</b></td><td> <textarea name="addin" rows ="4" cols="30"></textarea></td></tr>

        <tr>
            <td><input class="button" type="reset" value="Clear" required></td>
            <td><input class="button" type="submit" value="Submit" required><br></td>
        </tr>     
    
            </table>
            </fieldset>
        </form>
     
    </center>
</body>

</html>