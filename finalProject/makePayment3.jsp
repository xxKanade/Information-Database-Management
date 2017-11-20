<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for Flights</title>
</head>
<body>
<%
	try{
		String id= "";
		//Create a connection string
		String url = "jdbc:mysql://cs336project2017summer.cdbdnh5z4lat.us-west-2.rds.amazonaws.com:3306/cs336";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");
	
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "cs336", "cs336test");
				
		//Create a SQL statement
		Statement stmt = con.createStatement();
	
		// Check user id
		if(request.getSession().getAttribute("ID_No") != null){
			id = (String) request.getSession().getAttribute("ID_No");
			//Make a SELECT query from the Employee table
			String str = "SELECT * FROM Customer C WHERE C.ID_No = '" + id +"'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		}
			
		String ccType = request.getParameter("ccType");
		String ccn = request.getParameter("ccno");
		String exp = request.getParameter("expiration");
		String ccfirstName = request.getParameter("ccfirstName");
		String cclastName = request.getParameter("cclastName");
		String ccbillAddr = request.getParameter("ccbillAddr");
		
		//Make an insert statement for the Passenger table:
		String insert = "INSERT INTO Credit_Card (Card_No, Type, Billing_Address, First_Name, Last_Name)"
				+ "VALUES (?, ?, ?, ?, ?)";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
	
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, ccn);
		ps.setString(2, ccType);
		ps.setString(3, ccbillAddr);
		ps.setString(4, ccfirstName);
		ps.setString(5, cclastName);
		
		//Run the query against the DB
		ps.executeUpdate();
	} catch (Exception e){
		out.print("An error has occurred.");
	}
%>		
			  
<br>
<br>

</body>
</html>