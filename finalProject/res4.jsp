<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for Flights</title>
</head>
<body>
<%
	
%>			  
<h3>Reserve a Flight</h3>

	<!--  Action here needs to be changed
	<form method="post" action="show.jsp">
	<table>
	<tr>    
	<td>Origin</td><td><input type="text" name="bar"></td>
	</tr>
	<tr>
	<td>Destination</td><td><input type="text" name="beer"></td>
	</tr>
	<tr>
	
	<td>Departing</td><td><input type="text" name="price"></td> 
	</tr>
	<td>Returning</td><td><input type="text" name="price"></td>
	</tr>
	</table>-->
	
	<form method="post" action="checkout.jsp">
	<tr>    
	<td><strong>Flight ID Number </strong></td><td><input type="text" name="flightID"></td>
	</tr>	
	
	<h3>Who is traveling?</h3>
	<table>
	<tr><td><strong>First Name</strong></td><td><input type="text" name="firstName"></td></tr>
	<tr><td><strong>Last Name</strong></td><td><input type="text" name="lastName"></td></tr>
	<tr><td><strong>Address</strong></td><td><input type="text" name="addr"></td></tr>
	<tr><td><strong>City</strong></td><td><input type="text" name="city"></td></tr>
	<tr><td><strong>State</strong></td><td><input type="text" name="state"></td></tr>
	<tr><td><strong>Zip Code</strong></td><td><input type="text" name="zipcode"></td></tr>
	<tr><td><strong>Phone</strong></td><td><input type="text" name="phone"></td></tr>
	</table>
	
	<br>
	<input type="submit" value="Continue to checkout">
	</form>
<br>
<br>

</body>
</html>