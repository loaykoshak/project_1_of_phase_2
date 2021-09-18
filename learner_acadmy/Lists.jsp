<%@page import="DB.DB_Info"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>List Page</title>
</head>
<body>
<style> <%@ include file="css/Lists.css"%> </style>
<main class="st_viewport">
<form action="list" method="post">
<div>
<input type="submit" name="Get Back" value="Get
Back" />
</div>
</form>
<div id="List">
<div>
<div class="st_wrap_table" data-table_id="0">
<header class="st_table_header">
<form action="list" method="get">
<h2>Teachers</h2>
<div class="st_row">
<div class="st_column
_ID">ID</div>
<div class="st_column
_name">Name</div>
<div class="st_column
_class">Class</div>
<div class="st_column
_Subject">Subject</div>
</div>
</form>
</header>
<div class="st_table">
<%
DB_Info db = new DB_Info(); Connection conn = db.getConnection(); Statement stmt = ResultSet rs;
rs = stmt.executeQuery("SELECT teachers.ID, teachers.Name,teachers.class, "
+ "subject.sub FROM teachers LEFT JOIN subject on teachers.class=subject.class ");
while (rs.next()) {
out.print("<div class='st_row'>");
out.println("<div class='st_column _ID'>" + rs.getInt("ID") + "</div>");
out.println("<div class='st_column _name'>" + rs.getString("NAME") + "</div>");
out.println("<div class='st_column class'>" + rs.getString("class") + "</div>");
out.println("<div class='st_column _Subject'>" + rs.getString("sub") + "</div>");
out.print("</div>");
}
%>
</div>
</div>
</div>
<div>
<div class="st_wrap_table" data-table_id="1">
<header class="st_table_header">
<h2>Students</h2>
<div class="st_row">
<div class="st_column
_ID">ID</div>
<div class="st_column
_name">Name</div>
<div class="st_column
_class">class</div>
<div class="st_column
_Subject">Subject</div>
<div class="st_column
_Time">Time</div> 
</div>
</header>
<div class="st_table">
<%
rs = stmt.executeQuery("Select Students.ID , Students.Name , Students.Class, Students.Time , subject.sub "
+ "FROM Students LEFT JOIN subject on Students.class =subject.class and Students.time = subject.Time"); 
while (rs.next()) {
out.print("<div class='st_row'>"); 
out.println("<div class='st_column _ID'>" + rs.getInt("ID") + "</div>");
out.println("<div class='st_column _name'>" + rs.getString("NAME") + "</div>");
out.println("<div class='st_column class'>" + rs.getInt("class") + "</div>");
out.println("<div class='st_column _Subject'>" + rs.getString("sub") + "</div>");
out.println("<div class='st_column _Time'>" + rs.getInt("Time") + "</div>");
out.print("</div>");
}
%>
</div>
</div>
</div>
<div>
<div class="st_wrap_table" data-table_id="2">
<header class="st_table_header">
<h2>Classes</h2>
<div class="st_row">
<div class="st_column
_ID">class</div>
<div class="st_column
_name">Subject</div>
<div class="st_column
_class">Time</div> 
</div>
</header>
<div class="st_table">
<%
rs = stmt.executeQuery("Select classes.class, subject.sub ,classes.time from classes "
+ " LEFT join subject on classes.class =subject.class and classes.time = subject.Time");
while (rs.next()) {
out.print("<div class='st_row'>");
out.println("<div class='st_column _ID'>" + rs.getString("class") + "</div>");
out.println("<div class='st_column _name'>" + rs.getString("sub") + "</div>");
out.println("<div class='st_column class'>" + rs.getString("Time") + "</div>");
out.print("</div>");
}
%>
</div>
</div>
</div>
<div>
<div class="st_wrap_table" data-table_id="3">
<header class="st_table_header">
<h2>Subjects</h2>
<div class="st_row">
<div class="st_column
_ID">Name</div>
<div class="st_column
_name">Class</div>
<div class="st_column
_class">Time</div> 
</div>
</header>
<div class="st_table">
<%
rs = stmt.executeQuery("Select * from Subject"); 

while (rs.next()) {
out.print("<div class='st_row'>");
out.println("<div class='st_column _ID'>" + rs.getString("sub") + "	</div>");
out.println("<div class='st_column _name'>" + rs.getString("class") + "</div>");
out.println("<div class='st_column _ID'>" + rs.getInt("Time") + "</div>");
out.print("</div>");
}
%>
</div>
</div>
</div>
</div>
</main>
</body>
</html>