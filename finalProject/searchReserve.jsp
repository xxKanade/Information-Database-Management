<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search and Reserve a Flight</title>
<style>
body {
background-image: url(https://spirilio.gr/wp-content/uploads/2016/10/travelco-logo-1.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: 70% 100%;;
background-position: center center;
background-repeat: no-repeat;
background-attachment: fixed;
}
</style>
</head>
<body>
<%
if(request.getSession().getAttribute("accNo") == null){
	response.sendRedirect("Home.jsp");
}
	
%>
<div align="left">
<a href="CustomerLogout.jsp">Logout</a>
</div>
<div align="left">
<a href="CustomerResPort.jsp">Reservation Portal</a>
</div>
<br>
<br>


<strong>Search for Available Flights:</strong>					  
<form method="get" action="searchActions.jsp" enctype=text/plain>
    <!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
  <input type="radio" name="command" value="one"/> One-way
  <br>
  <input type="radio" name="command" value="round"/> Round-trip
  <br>
  <input type="radio" name="command" value="multi"/> Multi-city
  <br>
  <input type="radio" name="command" value="flex"/> Flexible Date/Time
  <br>
  <input type="radio" name="command" value="bestSeller"/> Best Seller
  <br>
  <input type="radio" name="command" value="Advanced"/> Advanced (up to 15% off)
  <br>
  <input type="submit" value="Search for Available Flights" />
</form>

<br>


<strong>Once you have found a Flight...<br> Make a Reservation:</strong>								  
<form method="get" action="reserveActions.jsp" enctype=text/plain>
  <input type="radio" name="command" value="one"/> One-way
  <br>
  <input type="radio" name="command" value="round"/> Round-trip
  <br>
  <input type="radio" name="command" value="multi"/> Multi-city
  <!-- <br>
  <input type="radio" name="command" value="flex"/> Flexible Date/Time -->
  <br>
  <input type="submit" value="Make a Reservation" />
</form>
</body>
</html>