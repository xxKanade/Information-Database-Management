<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustomerRep1</title>
</head>
<body>
<%
	try {
			
			//Create a connection string
			String url = "jdbc:mysql://cs336project2017summer.cdbdnh5z4lat.us-west-2.rds.amazonaws.com:3306/cs336";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "cs336", "cs336test");
					
			//Create a SQL statement
			Statement stmt = con.createStatement();

			// Check user id
			if(request.getSession().getAttribute("userid") != null){
				String id = (String) request.getSession().getAttribute("userid");
				//Make a SELECT query from the Employee table
				String str = "SELECT * FROM Emp_CustomerRep C WHERE C.ID = '" + id +"'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				//Check the result
				if (!result.next() ) {
					//Employee is a Manager
					response.sendRedirect("Manager.jsp");
					}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			
			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("Problem with Database, please contact help desk. Sorry for the inconvenience.");
			request.getSession().setAttribute("userid", null);
		}
%>


<h1>Reserve a Flight</h1>
	
	<form method="post" action="makeRes1.jsp">
	
	
	<h3>Customer Information</h3>
	<table>
	<tr><td><strong>First Name</strong></td><td><input type="text" name="bfirstName"></td></tr>
	<tr><td><strong>Last Name</strong></td><td><input type="text" name="lastName"></td></tr>
	<tr><td><strong>Address</strong></td><td><input type="text" name="addr"></td></tr>
	<tr><td><strong>City</strong></td><td><input type="text" name="city"></td></tr>
	<tr><td><strong>State</strong></td><td><input type="text" name="state"></td></tr>
	<tr><td><strong>Zip Code</strong></td><td><input type="text" name="zipcode"></td></tr>
	<tr><td><strong>Phone</strong></td><td><input type="text" name="phone"></td></tr>
	<tr><td><strong>E-mail Address</strong></td><td><input type="text" name="email"></td></tr>
	<!-- INSERT ACCOUNT NO. 
		 INSERT ACCOUNT CREATION DATE -->
	</table>
	
	<br>
	<table>
	<tr>    
	<td><strong>Flight ID Number </strong></td><td><input type="text" name="flightID"></td>
	</tr>	
	</table>
	
	
	
	<h3>Customer Accomodations</h3>
	<strong>Seat Preference</strong>
	<select name="seatPreference" size=1>
	<option value="window">Window</option>
	<option value="middle">Middle</option>
	<option value="aisle">Aisle</option>
	<option value="none">No Preference</option>
	</select>&nbsp;

	<strong>Dietary Restrictions</strong>
	<select name="mealPreference" size=1>
	<option value="none">No Restrictions</option>
	<option value="vegetarian">Vegetarian</option>
	<option value="vegan">Vegan</option>
	<option value="gluten">Gluten-free</option>
	</select>&nbsp;<br>
	
	<h3>Method of Payment</h3>
	<table><tr>
	<td><strong>Type</strong><td>
		<select name="ccType" size=1>
		<option value="vs">Visa</option>
		<option value="mc">MasterCard</option>
		<option value="ax">American Express</option>
		<option value="ds">Discover</option>
		</select>&nbsp;</td></tr>
	<tr><td><strong>Credit Card No.</strong></td><td><input type="text" name="ccno"></td></tr>
	<tr><td><strong>Expiration Date</strong></td><td><input type="text" name="expiration"></td></tr>
	<tr><td><strong>First Name</strong></td><td><input type="text" name="ccfirstName"></td></tr>
	<tr><td><strong>Last Name</strong></td><td><input type="text" name="cclastName"></td></tr>
	<tr><td><strong>Billing Address</strong></td><td><input type="text" name="ccbillAddr"></td></tr>
	</table>
	
	
	<br>
	<input type="submit" value="Confirm the reservation">
	
	<br>
	<input type="submit" value="Record reservation">
	</form>
<br>
<br>

</body>
</html>