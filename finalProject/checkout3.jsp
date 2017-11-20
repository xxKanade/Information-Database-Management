<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm your Order</title>
</head>
<body>
<%
		// CALCULATE FARE HERE

%>
	<h3>Method of Payment</h3>
	We accept the following credit card types: Visa, MasterCard, American Express, Discover.<p>
	<table>
	<td><strong>Type</strong><td>
		<select name="ccType" size=1>
		<option value="vs">Visa</option>
		<option value="mc">MasterCard</option>
		<option value="ax">American Express</option>
		<option value="ds">Discover</option>
		</select>&nbsp;<br>
	<tr><td><strong>Credit Card No.</strong></td><td><input type="text" name="ccno" maxlength="16"></td></tr>
	<tr><td><strong>Expiration Date</strong></td><td><input type="text" name="expiration" maxlength="5"></td></tr>
	<tr><td><strong>First Name</strong></td><td><input type="text" name="ccfirstName"></td></tr>
	<tr><td><strong>Last Name</strong></td><td><input type="text" name="cclastName"></td></tr>
	<tr><td><strong>Billing Address</strong></td><td><input type="text" name="ccbillAddr"></td></tr>
	</table>
	
	
	<br>
	<input type="submit" value="Confirm my reservations">

</body>
</html>