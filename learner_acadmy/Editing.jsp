<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="Web.Edit"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DB.DB_Info"%>
<%@page import="bean.Information"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<style><%@ include file="css/Lists.css"%>
body {font-family: Arial;}
/* Style the tab */
.tab {
overflow: hidden; 
border: 1px solid #ccc;
background-color: #f1f1f1;
}
label{
font-style:italic;
font-size: 14px;
}
h2{
font-size: 21px;
}
.lebel_list{
font-size: 21px;
}
/* Style the buttons inside the tab */
.tab button {
background-color: 
inherit; 
float: left;
border: none; 
outline: none; 
cursor: pointer; 
padding: 14px 16px; 
transition: 0.3s; 
font-size: 17px;
}
/* Change background color of buttons on hover */
.tab button:hover { background-color: #ddd;
}
/* Create an active/current tablink class */
.tab button.active { background-color: #ccc;
}
/* Style the tab content */ 
.tabcontent { 
display: none; 
padding: 6px 12px;
border: 1px solid #ccc; 
border-top: none;
}
</style>
<title>Editing</title>
</head>
<body>
<h2>Tabs</h2>
<p>Click on the buttons inside the tabbed menu:</p>
<form action="edit" method="post">
<button type= "submit" name="GetBack">Get Back</button>
</form>
<div class="tab">
<button class="tablinks" onclick="openBar(event, 'class')">Assign classes</button>
<button class="tablinks" onclick="openBar(event, 'teacher')">Assign Teachers</button>
</div>
<div id="class" class="tabcontent">
<h3>Enter Data </h3>
<form action="edit" method="post">
<label for="SubjectName">Subject Name:</label><br><br>
<input type = "text" id = "SubjectName" name ="SubjectName"><br><br>
<label for="classNum">Class Number:</label><br><br>
<input type = "text" id = "classNum" name ="classNum"><br><br>
<label for="ClassTime">Class Time: (without any latters)</label><br><br>
<input type = "text" id = "classTime" name ="classTime"><br><br>
<button type= "submit" name="assign" >Assign</button>
</form>
<br><br><br>
<h2>Subject Not Assigned</h2>	<br><br>
<%
DB_Info db = new DB_Info(); Connection conn = db.getConnection();
Statement stmt = conn.createStatement(); ResultSet rs;
rs = stmt.executeQuery("SELECT subject.sub
from "+
"subject where class is NULL and time is NULL");
while (rs.next()) {
out.print("<div class='st_row'>");
out.println("<div class='st_column
_ID'>" + rs.getString("sub") + "</div>");
out.print("</div>");
} 
rs.close();
%>
<br><br><br>
<h2>Classes Availabel</h2>	<br><br>
<%
rs = stmt.executeQuery("Select classes.class
from classes where time is null");
while (rs.next()) {
out.print("<div class='st_row'>");
out.println("<div class='st_column
_ID'>" + rs.getInt("class") + "</div>");
out.print("</div>");
}
rs.close();
%>
</div>
<div id="teacher" class="tabcontent">
<h3>Enter Data </h3>
<form action="edit" method="post">
<label for="TeacherID">Teacher ID:</label><br><br>
<input type = "text" id = "TeacherID" name ="TeacherID"><br><br>
<label for="TeacherName">Teacher Name:</label><br><br>
<input type = "text" id = "TeacherName" name ="TeacherName"><br><br>
<label for="classNumber">Class Number:</label><br><br>
<input type = "text" id = "classNumber" name ="classNumber"><br><br>
<label for="classTime">Class Time:</label><br><br>
<input type = "text" id = "classTime" name ="classTime"><br><br>
<button type= "submit" id="assign" name="assignNTeacher" >Assign</button>
</form>
<br><br><br>
<h2>Teachers Not Assigned</h2>	<br><br>
<%
rs = stmt.executeQuery("SELECT teachers.ID , teachers.Name from teachers WHERE class is null and time is NULL ");
while (rs.next()) {
out.print("<div class='st_row'>");
out.println("<div class='st_column
_ID'>" + rs.getInt("ID") + "</div>");
out.println("<div class='st_column
_ID'>" + rs.getString("Name") + "</div>");
out.print("</div>");
}
rs.close();
%>
</div>
<script >
function openBar(evt, barName) { 
var i, tabcontent, tablinks;
tabcontent = document.getElementsByClassName("tabcontent"); 
for (i = 0; i < tabcontent.length; i++) {
tabcontent[i].style.display = "none";
}
tablinks = document.getElementsByClassName("tablinks"); 
for (i = 0; i < tablinks.length; i++) {
tablinks[i].className = tablinks[i].className.replace(" active", "");
}
document.getElementById(barName).style.display = "block"; 
evt.currentTarget.className += " active";
}
</script>
</body>
</html>