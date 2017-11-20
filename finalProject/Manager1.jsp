<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager1</title>
</head>
<body>
<div align="left">
<a href="Manager.jsp">Home</a>
</div>
<div>
<a href="EmployeeLogout.jsp">Logout</a>
</div>
<div>
<a href="Manager.jsp">Back</a>
</div>
<br>
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
				String str = "SELECT * FROM Emp_Manager M WHERE M.ID = '" + id +"'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				//Check the result
				if (!result.next() ) {
					//Employee is a Customer Rep
					response.sendRedirect("CustomerRep.jsp");
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

Add Employee:
<br>
	<form method="post" action="Manager1a.jsp">
	<table>
	<tr>    
	<td>(M)anager or (C)ustomer Representative</td><td><input type="text" name="type"></td>
	</tr>
	<tr>    
	<td>ID Number(required)</td><td><input type="text" name="id"></td>
	</tr>
	<tr>    
	<td>Password(optional)</td><td><input type="text" name="password"></td>
	</tr>
	<tr>
	<td>SSN(optional)</td><td><input type="text" name="ssn"></td>
	</tr>
	<tr>
	<td>Hourly Rate(optional)</td><td><input type="text" name="rate"></td>
	</tr>
	<tr>
	<td>Start Date(optional) (YYYY-MM-DD)</td><td><input type="text" name="date"></td>
	</tr>
	<tr>    
	<td>First Name(optional)</td><td><input type="text" name="first"></td>
	</tr>
	<tr>
	<td>Last Name(optional)</td><td><input type="text" name="last"></td>
	</tr>
	<tr>
	<td>Address(optional)</td><td><input type="text" name="address"></td>
	</tr>
	<tr>
	<td>City(optional)</td><td><input type="text" name="city"></td>
	</tr>
	<tr>
	<td>State(optional)</td><td><input type="text" name="state"></td>
	</tr>
	<tr>
	<td>Zip Code(optional)</td><td><input type="text" name="zip"></td>
	</tr>
	<tr>
	<td>Telephone Number(optional)</td><td><input type="text" name="phone"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
<br>

Edit Employee:
<br>
	<form method="post" action="Manager1b.jsp">
	<table>
	<tr>    
	<td>ID Number(required)</td><td><input type="text" name="id"></td>
	</tr>
	<tr>
	<td>SSN(optional)</td><td><input type="text" name="ssn"></td>
	</tr>
	<tr>    
	<td>Password(optional)</td><td><input type="text" name="password"></td>
	</tr>
	<tr>
	<td>Hourly Rate(optional)</td><td><input type="text" name="rate"></td>
	</tr>
	<tr>
	<td>Start Date(optional)</td><td><input type="text" name="date"></td>
	</tr>
	<tr>    
	<td>First Name(optional)</td><td><input type="text" name="first"></td>
	</tr>
	<tr>
	<td>Last Name(optional)</td><td><input type="text" name="last"></td>
	</tr>
	<tr>
	<td>Address(optional)</td><td><input type="text" name="address"></td>
	</tr>
	<tr>
	<td>City(optional)</td><td><input type="text" name="city"></td>
	</tr>
	<tr>
	<td>State(optional)</td><td><input type="text" name="state"></td>
	</tr>
	<tr>
	<td>Zip Code(optional)</td><td><input type="text" name="zip"></td>
	</tr>
	<tr>
	<td>Telephone Number(optional)</td><td><input type="text" name="phone"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
<br>

Delete Employee:
<br>
	<form method="post" action="Manager1c.jsp">
	<table>
	<tr>    
	<td>ID Number(required)</td><td><input type="text" name="id"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
<br>

Add Customer:
<br>
	<form method="post" action="Manager1d.jsp">
	<table>
	<tr>    
	<td>Customer ID Number(required)</td><td><input type="text" name="id"></td>
	</tr>
	<tr>    
	<td>First Name(optional)</td><td><input type="text" name="first"></td>
	</tr>
	<tr>
	<td>Last Name(optional)</td><td><input type="text" name="last"></td>
	</tr>
	<tr>
	<td>Address(optional)</td><td><input type="text" name="address"></td>
	</tr>
	<tr>
	<td>City(optional)</td><td><input type="text" name="city"></td>
	</tr>
	<tr>
	<td>State(optional)</td><td><input type="text" name="state"></td>
	</tr>
	<tr>
	<td>Zip Code(optional)</td><td><input type="text" name="zip"></td>
	</tr>
	<tr>
	<td>Telephone Number(optional)</td><td><input type="text" name="phone"></td>
	</tr>
	<tr>
	<td>Meal Preference(optional)("veg","nonveg","fruit")</td><td><input type="text" name="meal"></td>
	</tr>
	<tr>
	<td>Seating Preference(optional) ("aisle","window","middle")</td><td><input type="text" name="seat"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
<br>

Edit Customer:
<br>
	<form method="post" action="Manager1e.jsp">
	<table>
	<tr>    
	<td>ID Number(required)</td><td><input type="text" name="id"></td>
	</tr>
	<tr>    
	<td>First Name(optional)</td><td><input type="text" name="first"></td>
	</tr>
	<tr>
	<td>Last Name(optional)</td><td><input type="text" name="last"></td>
	</tr>
	<tr>
	<td>Address(optional)</td><td><input type="text" name="address"></td>
	</tr>
	<tr>
	<td>City(optional)</td><td><input type="text" name="city"></td>
	</tr>
	<tr>
	<td>State(optional)</td><td><input type="text" name="state"></td>
	</tr>
	<tr>
	<td>Zip Code(optional)</td><td><input type="text" name="zip"></td>
	</tr>
	<tr>
	<td>Telephone Number(optional)</td><td><input type="text" name="phone"></td>
	</tr>
	<tr>
	<td>Meal Preference(optional)("veg","nonveg","fruit")</td><td><input type="text" name="meal"></td>
	</tr>
	<tr>
	<td>Seating Preference(optional) ("aisle","window","middle")</td><td><input type="text" name="seat"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
<br>

Delete Customer:
<br>
	<form method="post" action="Manager1f.jsp">
	<table>
	<tr>    
	<td>ID Number(required)</td><td><input type="text" name="id"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
<br>


</body>
</html>