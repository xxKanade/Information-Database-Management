<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ManagerActions</title>
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
			
			//Get the selected radio button from the Manager.jsp
			String taskNum = request.getParameter("command");
		
			
			if(taskNum.equals("1")){
				response.sendRedirect("Manager1.jsp");
				
			}else if(taskNum.equals("2")){
				response.sendRedirect("Manager2.jsp");

			}else if(taskNum.equals("3")){
				response.sendRedirect("Manager3.jsp");
	
			}else if(taskNum.equals("4")){
				response.sendRedirect("Manager4.jsp");

			}else if(taskNum.equals("5")){
				response.sendRedirect("Manager5.jsp");

			}else if(taskNum.equals("6")){
				response.sendRedirect("Manager6.jsp");

			}else if(taskNum.equals("7")){
				response.sendRedirect("Manager7.jsp");

			}else if(taskNum.equals("8")){
				response.sendRedirect("Manager8.jsp");

			}else if(taskNum.equals("9")){
				response.sendRedirect("Manager9.jsp");

			}
		
			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("Problem with Database, please contact help desk. Sorry for the inconvenience.");
		}
%>
	
	
</body>
</html>