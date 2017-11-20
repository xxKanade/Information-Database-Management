<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmed Reservation</title>
</head>
<body>
<h2>Success!</h2>
<%
	//Create a connection string
	String url = "jdbc:mysql://cs336project2017summer.cdbdnh5z4lat.us-west-2.rds.amazonaws.com:3306/cs336";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");

	//Create a connection to your DB
	Connection con = DriverManager.getConnection(url, "cs336", "cs336test");
			
	//Create a SQL statement
	Statement stmt = con.createStatement();
		
	String depDate = (String) request.getSession().getAttribute("departDate");
	String origin = (String) request.getSession().getAttribute("origin");
	String destination = (String) request.getSession().getAttribute("destination");
	String airCode = (String) request.getSession().getAttribute("airID");
	String flight = (String) request.getSession().getAttribute("flightID");
	
	//Retrieve departure time information from Flight table:
	String str = "SELECT depTime FROM Flight WHERE Airline_ID = '"+airCode+"' AND Flight_No = '"+flight+"' AND depDate = '"+ depDate+"'";
	//Run the query against the database.
	ResultSet resultString = stmt.executeQuery(str);
	String depTime = resultString.getString("depTime");
	
	//Retrieve arrival time information from Flight table:
	str = "SELECT arrTime FROM Flight WHERE Airline_ID = '"+airCode+"' AND Flight_No = '"+flight+"' AND depDate = '"+ depDate+"'";
	//Run the query against the database.
	resultString = stmt.executeQuery(str);
	resultString.next();
	String arrTime = resultString.getString("arrTime");
	
	//Retrieve arrival date information from Flight table:
	str = "SELECT arrDate FROM Flight WHERE Airline_ID = '"+airCode+"' AND Flight_No = '"+flight+"' AND depDate = '"+ depDate+"'";
	//Run the query against the database.
	resultString = stmt.executeQuery(str);
	resultString.next();
	String arrDate = resultString.getString("arrDate");
	
//	out.println("Reservation Number: "+ resNo);
	out.println("Your flight reservation with "+airCode+flight+" departing from "+origin+" on "+
			depDate+" at "+depTime+" and arriving at "+destination+" on "+arrDate+" at "+arrTime+
			"has been confirmed.");
	
	
%>			  	
<br>
<br>

</body>
</html>