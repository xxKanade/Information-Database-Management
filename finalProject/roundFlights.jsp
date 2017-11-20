<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
function onSubmit() {
    document.getElementById("theDatePicker").value
}
</script>
<title>Round-Trip Flights</title>
</head>
<body>
<div align="left">
<a href="searchReserve.jsp">Home</a>
</div>
<div>
<a href="CustomerLogout.jsp">Logout</a>
</div>
<div>
<a href="fly2.jsp">Back</a>
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
		//Get parameters from the HTML form at the fly2.jsp
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		String departDate = request.getParameter("date1");
		String returnDate = request.getParameter("date2");
		
		request.getSession().setAttribute("origin", origin);
		request.getSession().setAttribute("destination", destination);
		request.getSession().setAttribute("departDate", departDate);
		request.getSession().setAttribute("returnDate", returnDate);
		
		//Make a SELECT query from the Flights table:
		String str = "SELECT * FROM Flight WHERE depAirID ='" + origin +"' AND arrAirID ='"+destination+"' AND depDate ='"+departDate+"'";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		
		String temp = (String) origin;
		origin = destination;
		destination = temp;
		
		//Create a SQL statement
		Statement stmtR = con.createStatement();
		//Make a SELECT query from the Flights table:
		String strR = "SELECT * FROM Flight WHERE depAirID ='" + origin +"' AND arrAirID ='"+destination+"' AND depDate ='"+returnDate+"'";
		//Run the query against the database.
		ResultSet resultR = stmtR.executeQuery(strR);
			
		out.print("Departing Flights");
		//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("| Airline |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Flight No. |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" From  |");
			out.print("</td>");
			//make a column
			out.print("<td> ");
			out.print("   To   |");
			out.print(" </td>");
			//make a column
			out.print("<td>");
			out.print("Departure Date |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Departure Time |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Arrival Date |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Arrival Time |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Air Fare |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Minimum Days of Stay |");
			out.print("</td>");
			

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current Airline_ID name:
				out.print(result.getString("Airline_ID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current Flight Number:
				out.print(result.getString("Flight_No"));
				out.print("</td>");
				out.print("<td>");
				//Print out departing Airport ID
				out.print(result.getString("depAirID"));
				out.print("</td>");
				out.print("<td>");
				//Print out arriving Airport ID
				out.print(result.getString("arrAirID"));
				out.print("</td>");
				out.print("<td>");
				//Print out departure date
				out.print(result.getString("depDate"));
				out.print("</td>");
				out.print("<td>");
				//Print out departure time
				out.print(result.getString("depTime"));
				out.print("</td>");
				out.print("<td>");
				//Print out arrival date
				out.print(result.getString("arrDate"));
				out.print("</td>");
				out.print("<td>");
				//Print out arrival time
				out.print(result.getString("arrTime"));
				out.print("</td>");
				out.print("<td>");
				//Print out air fare
				out.print(result.getString("Fare"));
				out.print("</td>");
				out.print("<td>");
				//Print out air fare
				out.print(result.getString("Length_of_Stay"));
				out.print("</td>");
			}
			out.print("</table>");
//----- Return Flights Table
			out.print("Returning Flights");
		//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("| Airline |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Flight No. |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" From  |");
			out.print("</td>");
			//make a column
			out.print("<td> ");
			out.print("   To   |");
			out.print(" </td>");
			//make a column
			out.print("<td>");
			out.print("Departure Date |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Departure Time |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Arrival Date |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Arrival Time |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Air Fare |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Minimum Days of Stay |");
			out.print("</td>");

			//parse out the results
			while (resultR.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current Airline_ID name:
				out.print(resultR.getString("Airline_ID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current Flight Number:
				out.print(resultR.getString("Flight_No"));
				out.print("</td>");
				out.print("<td>");
				//Print out departing Airport ID
				out.print(resultR.getString("depAirID"));
				out.print("</td>");
				out.print("<td>");
				//Print out arriving Airport ID
				out.print(resultR.getString("arrAirID"));
				out.print("</td>");
				out.print("<td>");
				//Print out departure date
				out.print(resultR.getString("depDate"));
				out.print("</td>");
				out.print("<td>");
				//Print out departure time
				out.print(resultR.getString("depTime"));
				out.print("</td>");
				out.print("<td>");
				//Print out arrival date
				out.print(resultR.getString("arrDate"));
				out.print("</td>");
				out.print("<td>");
				//Print out arrival time
				out.print(resultR.getString("arrTime"));
				out.print("</td>");
				out.print("<td>");
				//Print out air fare
				out.print(resultR.getString("Fare"));
				out.print("</td>");
				out.print("<td>");
				//Print out air fare
				out.print(resultR.getString("Length_of_Stay"));
				out.print("</td>");
				out.print("<td>");
			}
			out.print("</table>");

			//close the connection.
			con.close();
		} catch (Exception e) {
			out.print("404: Page Not Found.");
		}
%>
<!-- 	<form method="post" action="fly2.jsp">
		<input type="submit" value="Back">
	</form> -->
	<form method="post" action="res2.jsp">
		<input type="submit" value="Reserve">
	</form>