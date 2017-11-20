<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="globalvariable.jsp" %>

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
	
	<form method="post" action="makeRes2.jsp">
	<table>
	<tr><td><strong>Airline Code </strong></td><td><input type="text" name="airID" maxlength="2"></td></tr>
	<tr><td><strong>Flight ID Number </strong></td><td><input type="text" name="flightID" maxlength="4"></td></tr>		
	</table>
	
	<h3>Who is traveling?</h3>
	<table>
	<tr><td><strong>First Name</strong></td><td><input type="text" name="firstName"> &nbsp;&nbsp;
	<strong>Last Name</strong></td><td><input type="text" name="lastName"></td></tr>
	
	<tr><td><strong>First Name</strong></td><td><input type="text" name="firstName2"> &nbsp;&nbsp;
	<strong>Last Name</strong></td><td><input type="text" name="lastName2"></td></tr>
	
	<tr><td><strong>First Name</strong></td><td><input type="text" name="firstName3"> &nbsp;&nbsp;
	<strong>Last Name</strong></td><td><input type="text" name="lastName3"></td></tr>
	
	<tr><td><strong>First Name</strong></td><td><input type="text" name="firstName4"> &nbsp;&nbsp;
	<strong>Last Name</strong></td><td><input type="text" name="lastName4"></td></tr>
	</table>
	
	<h3>How can we accommodate your travels?</h3>
	<td><strong>Seat Preference</strong></td>
	<select name="seatPreference" size=1>
	<option value="window">Window</option>
	<option value="middle">Middle</option>
	<option value="aisle">Aisle</option>
	<option value="none">No Preference</option>
	</select>&nbsp;

	<td><strong>Dietary Restrictions</strong></td>
	<select name="mealPreference" size=1>
	<option value="none">No Restrictions</option>
	<option value="vegetarian">Vegetarian</option>
	<option value="vegan">Vegan</option>
	<option value="gluten">Gluten-free</option>
	</select>&nbsp;<br>
	</table>
	
	<br>
	<input type="submit" value="Reserve Returning Flight">
	</form>
<br>
<br>

</body>
</html>