<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*"%>
<html>
<head>
    <title>ShortList</title>
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
                    if(session.getAttribute("username")==null) {
                        response.sendRedirect("adminlogin.html");
                    }
                %>

        <form name="form1"  method="POST" action="short.jsp">
            <fieldset>
                <legend align=left>Enter Company Criteria</legend>
                <table align="center">
        
                <br><br>
        <tr>    <td><b>Company NAME :</b> </td>  <td><input class="txt" type="text" name="cname" title="Enter name of the company" required><br><br></td></tr>
        <tr>    <td><b>Min 10th Marks Required :</b> </td><td>  <input class="txt" type="number" name="10th" title="Enter your 10th Percentage" required><br><br></td></tr>
        <tr>    <td><b>Min 12th/Diploma Marks Required  :</b> </td><td>  <input class="txt" type="number" name="12th" title="Enter your 12th Percentage" required><br><br></td></tr>
        <tr>    <td><b>Min Degree Marks Required :<br>(Till last semester)</b> </td><td>  <input class="txt" type="number" name="degree" title="Enter your SGPA" required><br><br></td></tr>
        <tr>    <td><b>Max No. of backlogs Allowed :</b></td><td> <input class="txt" type="number" name="backlogs" required><br><br></td></tr>
         

        <tr>
            <td><input class="button" type="reset" value="Clear" required></td>
            <td><input class="button" type="submit" value="Shortlist" required><br></td>
        </tr>     
    
            </table>
            </fieldset>
        </form>
     
    </center>
</body>

</html>