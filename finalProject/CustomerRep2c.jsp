<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustomerRep2c</title>
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
					
			// Check user id
			if(request.getSession().getAttribute("userid") != null){
				//Create a SQL statement
				Statement stmt = con.createStatement();
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
			
			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form
			String id = request.getParameter("id");

			//Check that ID is numeric and is not empty
			if(!id.matches("((-|\\+)?[0-9]+(\\.[0-9]+)?)+") || id.equals("")) {
				con.close();
				throw new IndexOutOfBoundsException("Not a valid Customer ID Number");
			}
			//Make a SELECT query from the Customer table
			String str = "SELECT * FROM Customer WHERE ID_No = '" + id + "'";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
				if (!result.next() ) {
					con.close();
					throw new IndexOutOfBoundsException("Customer does not exist; enter a valid Customer ID Number");
				}
			
			// Delete from Employee Table
			str = "DELETE FROM Account WHERE ID_No = '" + id + "'";
			stmt.executeUpdate(str);
			// Delete from Employee Table
			str = "DELETE FROM Customer WHERE ID_No = '" + id + "'";
			stmt.executeUpdate(str);
			// Delete from Person Table
			str = "DELETE FROM Person WHERE ID_No = '" + id + "'";
			stmt.executeUpdate(str);
				
			//Close the connection.
			con.close();
			
			out.print("delete succeeded");
		} catch (Exception e) {
			out.print("delete failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}
%>

</body>
</html>