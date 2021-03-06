<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager9a</title>
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
					out.print("<a href=\"Manager9.jsp\">Back</a>");
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
					out.print("<a href=\"Manager9.jsp\">Back</a>");
					out.print("</div>");
					out.print("<br>");
				}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			
			// Get parameters
			String airport = request.getParameter("airport");
			if(airport.equals("") || airport.length() != 3){
				out.print("ERROR: Must enter a 3-letter Airport Code");
				con.close();
				return;
			}
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String str = "SELECT * FROM Airport WHERE Airport_ID = '"+airport+"'";
				
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			if (!result.next() ) {
					out.print("ERROR: No such Airport exists in the system. Please enter a valid 3-letter Airport Code");
					con.close();
					return;
			}
			
			str = "SELECT * FROM Flight WHERE (depAirID = '"+airport+"' OR arrAirID = '"+airport+"') ORDER BY depAirID";
			result = stmt.executeQuery(str);
				if (!result.next() ) {
					out.print("There are no Flights currently in the system for Airport "+airport);
				}
				else{
					//Make an HTML table to show the results in:
					out.print("<table style= 'text-align:center' cellspacing='15' table border='3' bordercolor='#c86260' rules='all'");

					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					out.print("<b>Airline ID</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Flight Number</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>From Airport</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>To Airport</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Departure Date</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Departure Time</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Arrival Date</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Arrival Time</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Number of Seats</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Fare</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Advance Purchase</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Length of Stay</b>");
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
						out.print(result.getString("Airline_ID"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Flight_No"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("depAirID"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("arrAirID"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("depDate"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("depTime"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("arrDate"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("arrTime"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Num_Seats"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Fare"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Advance_Purchase"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Length_of_Stay"));
						out.print("</td>");
						out.print("</tr>");
						if(!result.next()){
							break;
						}
					}

					out.print("</table>");
				}

			//Close the connection.
			con.close();
			
		} catch (Exception e) {
			out.print("ERROR: Search Failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}
%>
</body>
</html>