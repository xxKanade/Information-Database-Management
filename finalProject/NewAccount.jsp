<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Account</title>
</head>
<body>
	<%
	try {

		//Create a connection string
		String url = "jdbc:mysql://airlines.cocccx6dxe7u.us-east-1.rds.amazonaws.com:3306/AirlineHome";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");

		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "orion", "administrator");

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Populate SQL statement with an actual query. It returns a single number. The number of accounts in the DB.
		String str = "SELECT COUNT(*) as cnt FROM accounts";

		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);
			
		//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		result.next();
		//Parse out the result of the query
		int countAccounts = result.getInt("cnt");

		//Get parameters from the HTML form at the Airline_Home.jsp
		String newLoginname = request.getParameter("loginname");
		String newPassword = request.getParameter("password");

		//Make an insert statement for the accounts table:
		String insert = "INSERT INTO accounts(loginname, password)"
				+ "VALUES (?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newLoginname);
		ps.setString(2, newPassword);
		//Run the query against the DB
		ps.executeUpdate();

		//Check counts once again (the same as the above)
		str = "SELECT COUNT(*) as cnt FROM accounts";
		result = stmt.executeQuery(str);
		result.next();
		System.out.println("Here");
		int countAccountsN = result.getInt("cnt");
		System.out.println(countAccountsN);

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		//Compare counts of the beers and bars before INSERT on Sells and after to figure out whether there is a bar and a beer stub records inserted by a trigger. 
		int updateAccount = (countAccounts != countAccountsN) ? 1 : 0;
		System.out.println(updateAccount);


		out.print("insert succeeded");
	} catch (Exception ex) {
		out.print("insert failed");
	}
%>
</body>
</html>