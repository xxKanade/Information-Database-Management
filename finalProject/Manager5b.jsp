<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager5b</title>
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
					out.print("<a href=\"Manager5.jsp\">Back</a>");
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
					out.print("<a href=\"Manager5.jsp\">Back</a>");
					out.print("</div>");
					out.print("<br>");
				}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}

			String airport = request.getParameter("airport");

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String str = "SELECT * FROM Airport WHERE Airport_ID = '" + airport + "'";
			ResultSet result = stmt.executeQuery(str);
			if (!result.next() ) {
					out.print("ERROR: This Airport does not exist in the system. Please enter a valid Airport Code.");
					con.close();
					return;
			}
			
			str = "SELECT * FROM Leg L, Reservation R WHERE R.Res_No = L.Res_No AND To_Airport_ID = '" + airport + "'";

			//Run the query against the database.
			result = stmt.executeQuery(str);
				if (!result.next() ) {
 					out.print("There are no reservations with this Flight so it is generating NO REVENUE");
				}
				else{
					// Get Total Revenue
					String rev = "SELECT SUM(Booking_Fee) FROM Leg L, Reservation R WHERE R.Res_No = L.Res_No AND To_Airport_ID = '" + airport + "'";
					ResultSet rresult = stmt.executeQuery(rev);
					rresult.next();
					rev = rresult.getString("SUM(Booking_Fee)");
					str = "SELECT * FROM Leg L, Reservation R WHERE R.Res_No = L.Res_No AND To_Airport_ID = '" + airport + "'";
					result = stmt.executeQuery(str);
					result.next();
					
					//Make an HTML table to show the results in:
					out.print("<table style= 'text-align:center' cellspacing='15' table border='3' bordercolor='#c86260' rules='all'");

					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					out.print("<b>Reservation Number</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Date</b>");
					out.print("</td>");
					out.print("<td>");
					out.print("<b>Booking Fee</b>");
					out.print("</td>");
					//end row
					out.print("</tr>");

					//parse out the results
					while (true) {
						//make a row
						out.print("<tr>");
						//make a column
						out.print("<td>");
						//Print out column value
						out.print(result.getString("Res_No"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Date"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Booking_Fee"));
						out.print("</td>");
						out.print("</tr>");
						if(!result.next()){
							break;
						}
					}
					//make a row
						out.print("<tr>");
						//make a column
						out.print("<td>");
						//Print out column value
/* 						out.print(result.getString("Res_No"));
 */						out.print("</td>");
						out.print("<td>");
/* 						out.print(result.getString("Date"));
 */						out.print("</td>");
						out.print("<td>");
						out.print("<b>"+rev+"</b>");
						out.print("</td>");
						out.print("</tr>");
					out.print("</table>");
				}

			//Close the connection.
			con.close();
			
		} catch (Exception e) {
			out.print("ERROR: Search failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}
%>
</body>
</html>