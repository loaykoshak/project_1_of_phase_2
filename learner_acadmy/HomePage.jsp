<%@page import="java.io.PrintWriter"%>
<%@page import="DB.DB_Info"%>
<%@page import="bean.Information"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple- line-icons/2.4.1/css/simple-line-icons.css" />
<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=sw ap" rel="stylesheet" />
<style> <%@ include file="css/HomePage.css"%> </style>
<form action="home" method = "post">
<div id = "buttons">
<button type ="submit" class="fi" name="Lists">Show Lists</button>
</div>
<div id = "buttons">
<button type ="submit" class="fill" name="Edit Lists">Edit List</button>
</div>
<button type ="submit" class="filles" name="Sign Out" >Sign Out</button>
</form>
</body>
</html>
<%


%>
