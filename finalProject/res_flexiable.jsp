<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd'});
  } );
  </script>
  <script>
	function onSubmit() {
	    document.getElementById("datepicker").value
	}
	</script>
<title>Search for Flights</title>
</head>
<body>	
<div align="left">
<a href="searchReserve.jsp">Home</a>
</div>
<div>
<a href="CustomerLogout.jsp">Logout</a>
</div>
<div>
<a href="searchReserve.jsp">Back</a>
</div>
<br>		  
<h3>Please enter in the corresponding airport codes.</h3>

	<form method="query" action="makeRes6.jsp">
	
	<table>
	<tr><td><strong>Airline Code </strong></td><td><input type="text" name="airID" maxlength="2"></td></tr>
	<tr><td><strong>Flight ID Number </strong></td><td><input type="text" name="flightID"></td></tr>
	<tr><td><strong>Date:</strong></td><td><input type="text" id="datepicker" name="departDate"></td></tr>
	</table> 
		
	<br>	
	<br>	
	<tr><td><strong>Who is traveling?</strong></td><td>
	
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
	<input type="submit" value="Confirm my reservation">
	</form>
	
<br>
<br>

</body>
</html>