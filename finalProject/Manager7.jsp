<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager7</title>
</head>
<body>
<%
	
	List<String> list = new ArrayList<String>();

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
				//Check the result
					if (!result.next() ) {
					//Employee is a Customer Rep
					out.print("<div align=\"left\">");
					out.print("<a href=\"CustomerRep.jsp\">Home</a>");
					out.print("</div>");
					out.print("<div>");
					out.print("<a href=\"EmployeeLogout.jsp\">Logout</a>");
					out.print("</div>");
					out.print("<div>");
					out.print("<a href=\"CustomerRep.jsp\">Back</a>");
					out.print("</div>");
					out.print("<br>");
				}else{
					out.print("<div align=\"left\">");
					out.print("<a href=\"Manager.jsp\">Home</a>");
					out.print("</div>");
					out.print("<div>");
					out.print("<a href=\"EmployeeLogout.jsp\">Logout</a>");
					out.print("</div>");
					out.print("<div>");
					out.print("<a href=\"Manager.jsp\">Back</a>");
					out.print("</div>");
					out.print("<br>");
				}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			// Get month parameters from Manager2.jsp
			String sort = request.getParameter("sort");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Make a SELECT query for Reservation
			String str = "SELECT Flight_Number, COUNT(*) AS count FROM Leg GROUP BY Flight_Number ORDER BY count DESC;";
			ResultSet result = stmt.executeQuery(str);
			
			out.print("Most Active by Reservation:");
			out.println("<table style= 'text-align:center' cellspacing='15' table border='3' bordercolor='#c86260' rules='all'>");
			
			out.println("<tr>");
			out.println("<td>Flight Number</td>");
			out.println("<td>Number of reservations</td>");
			out.println("</tr>");
			
			while(result.next()){
				out.println("<tr>");
				out.println("<td>"+result.getString("Flight_Number")+"</td>");
				out.println("<td>"+result.getString("count")+"</td>");
				out.println("</tr>");
			}
			
			
			out.println("</table><br><br>");
			
			
			Statement stmtp = con.createStatement();
			String strpass = "SELECT Flight_Number, COUNT(*) AS count FROM ((SELECT Flight_Number FROM Leg, Passenger WHERE Leg.Res_No=Passenger.resNo) UNION ALL (SELECT Flight_Number FROM Leg)) newleg GROUP BY Flight_Number ORDER BY count DESC;";
			ResultSet resultp = stmtp.executeQuery(strpass);
			
			out.print("Most Active by Passenger:");
			out.println("<table style= 'text-align:center' cellspacing='15' table border='3' bordercolor='#c86260' rules='all'>");

			out.println("<tr>");
			out.println("<td>Flight Number</td>");
			out.println("<td>Number of passengers</td>");
			out.println("</tr>");
			
			while(resultp.next()){
				out.println("<tr>");
				out.println("<td>"+resultp.getString("Flight_Number")+"</td>");
				out.println("<td>"+resultp.getString("count")+"</td>");
				out.println("</tr>");
			}

			out.println("</table>");

			//Close the connection.
			con.close();
			
		} catch (Exception e) {
			out.print("search failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}
%>
</body>
</html>