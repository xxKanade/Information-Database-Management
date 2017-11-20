<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Login</title>
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

			//Get parameters from the HTML form at the Employee_Home.jsp
			String id = request.getParameter("id");
			String pass = request.getParameter("password");

			//Make a SELECT query from the Employee table
			String str = "SELECT * FROM Employee WHERE Id_No = '" + id + "' AND password = '" + pass +"'";
			//Run the query against the database.
			
			ResultSet result = stmt.executeQuery(str);
			
			if (!result.next() ) {
				out.print("login failed");
				request.getSession().setAttribute("userid", null);
				con.close();
				return;
			} else{
				out.print("Login succeeded: welcome to your employee account");
				//save id number in session
				request.getSession().setAttribute("userid", id);
			}
			
			//Make a SELECT query from the Employee table
			str = "SELECT * FROM Employee E, Emp_Manager M WHERE E.Id_No = '" + id + "' AND M.ID = '" + id +"'";
			//Run the query against the database.
			
			result = stmt.executeQuery(str);
			
			if (!result.next() ) {
				//Employee is a Customer Rep
				response.sendRedirect("CustomerRep.jsp");
			} else{
				//Employee is a Manager
				response.sendRedirect("Manager.jsp");
			}
				
			//close the connection.
			con.close();

		} catch (Exception e) {
			request.getSession().setAttribute("userid", null);
			out.print("<div align=\"left\">");
			out.print("<a href=\"Manager.jsp\">Back to Login</a>");
			out.print("</div><br><br><br>");
			out.print("ERROR: Employee login failed. Please enter a valid Employee ID Number and password");
		}
%>

			
</body>
</html>