<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Most Active Flights</title>
</head>
<body>
List of most Active flights:
<br>
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
		//Make a SELECT query for Reservation
		String str = "SELECT Flight_Number, COUNT(*) AS count FROM Leg GROUP BY Flight_Number ORDER BY count DESC;";
		ResultSet result = stmt.executeQuery(str);
		
		out.println("<table>");
		
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
		
		
		out.println("</table>");
		
		
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>