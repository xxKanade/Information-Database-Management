<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmed Reservation</title>
</head>
<body>
<%
	String depDate = (String) request.getSession().getAttribute("departDate");
	
%>			  
<h3>Confirmed Reservation</h3>
	<form method="post" action="home.jsp"> 
	
	Success! Your flight reservation for (insert Flight ID number here) departing (departure date)
	(and if returning) and returning (return date) has been confirmed. Please print this page for your records.
<br>
<br>

</body>
</html>