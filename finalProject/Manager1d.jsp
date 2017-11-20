<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager1d</title>
</head>
<body>
<div align="left">
<a href="Manager.jsp">Home</a>
</div>
<div>
<a href="EmployeeLogout.jsp">Logout</a>
</div>
<div>
<a href="Manager1.jsp">Back</a>
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
					
			// Check user id
			if(request.getSession().getAttribute("userid") != null){
				//Create a SQL statement
				Statement stmt = con.createStatement();
				// Get userid
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

			//Get parameters from the HTML form at the Manager1.jsp
			String id = request.getParameter("id");
			String first = request.getParameter("first");
			String last = request.getParameter("last");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String phone = request.getParameter("phone");
			String meal = request.getParameter("meal");
			String seat = request.getParameter("seat");

			if(!id.matches("((-|\\+)?[0-9]+(\\.[0-9]+)?)+") || id.equals("")) {
				con.close();
				throw new IndexOutOfBoundsException("ERROR: Not a valid Customer ID number");
			}

			//Make an insert statement for the Person table:
			String insert = "INSERT INTO Person (ID_No, First_Name, Last_Name, Address, City, State, Zip_Code, Telephone_No)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, id);
			ps.setString(2, first);
			ps.setString(3, last);
			ps.setString(4, address);
			ps.setString(5, city);
			ps.setString(6, state);
			ps.setString(7, zip);
			ps.setString(8, phone);

			//Run the query against the DB
			ps.executeUpdate();

			//Make an insert statement for the Employee table:
			insert = "INSERT INTO Customer (ID_No, Meal_Preference, Seating_Preference)"
					+ "VALUES (?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, id);
			ps.setString(2, meal);
			ps.setString(3, seat);

			//Run the query against the DB
			ps.executeUpdate();

			//Close the connection.
			con.close();
			
			out.print("Insert succeeded!");
		} catch (Exception e) {
			out.print("ERROR: Insert failed");
		}
%>
</body>
</html>