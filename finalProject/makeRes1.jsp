<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%!
    public String generateRandomNumber(){
		Random rand = new Random();
		int n = rand.nextInt(89999999) + 10000000;
		String x = "" + n;
		return x;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for Flights</title>
</head>
<body>
<div align="left">
<a href="searchReserve.jsp">Home</a>
</div>
<div>
<a href="CustomerLogout.jsp">Logout</a>
</div>
<div>
<a href="searchReserve.jsp">Back</a>
</div>
<br>	
<%
	try{
		//Create a connection string
		String url = "jdbc:mysql://cs336project2017summer.cdbdnh5z4lat.us-west-2.rds.amazonaws.com:3306/cs336";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");

		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "cs336", "cs336test");
				
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		// ADJUST FARE HERE IF ADVANCED PURCHASE //
		String resNo = generateRandomNumber();
		String airID = request.getParameter("airID");
		String flightID = request.getParameter("flightID");
		String first = request.getParameter("firstName");
		String last = request.getParameter("lastName");
		String first2 = request.getParameter("firstName2");
		String last2 = request.getParameter("lastName2");
		String first3 = request.getParameter("firstName3");
		String last3 = request.getParameter("lastName3");
		String first4 = request.getParameter("firstName4");
		String last4 = request.getParameter("lastName4");
		String seatPref = request.getParameter("seatPreference");
		String mealPref = request.getParameter("mealPreference");
		String ccType = request.getParameter("ccType");
		String ccn = request.getParameter("ccno");
		String exp = request.getParameter("expiration");
		String ccfirstName = request.getParameter("ccfirstName");
		String cclastName = request.getParameter("cclastName");
		String ccbillAddr = request.getParameter("ccbillAddr");
		
		
		String airCode = (String) request.getSession().getAttribute("airID");
		String flight = (String) request.getSession().getAttribute("flightID");
		String depDate = (String) request.getSession().getAttribute("departDate");
		
		//Retrieve Fare information from Flight table:
		String str = "SELECT Fare FROM Flight WHERE Airline_ID = '"+airID+"' AND Flight_No = '"+flightID+"' AND depDate = '"+ depDate+"'";

// FARE IS CALCULATED IN THIS REGION =========================				
		//Run the query against the database.
		ResultSet resultString = stmt.executeQuery(str);
		resultString.next();
		String fare = resultString.getString("Fare");

		
		Double bFee = Double.parseDouble(fare)*0.1;
		String bookFee = Double.toString(bFee);
		Double dFare = Double.parseDouble(fare) + Double.parseDouble(bookFee);		
		String tFare = Double.toString(dFare);
		
		//Retrieve Fare_Restriction information from Flight table:
		str = "SELECT Advance_Purchase FROM Flight WHERE Airline_ID = '"+airID+"' AND Flight_No = '"+flightID+"' AND depDate = '"+ depDate+"'";
		//Run the query against the database.
		resultString = stmt.executeQuery(str);
		resultString.next();
		String fareRes = resultString.getString("Advance_Purchase");
// ===========================================================
	
		//Retrieve Departure Place information from Flight table:
		str = "SELECT depAirID FROM Flight WHERE Airline_ID = '"+airID+"' AND Flight_No = '"+flightID+"' AND depDate = '"+ depDate+"'";
		//Run the query against the database.
		resultString = stmt.executeQuery(str);
		resultString.next();
		String depAirID = resultString.getString("depAirID");
		
		//Retrieve Departure Time information from Flight table:
		str = "SELECT depTime FROM Flight WHERE Airline_ID = '"+airID+"' AND Flight_No = '"+flightID+"' AND depDate = '"+ depDate+"'";
		//Run the query against the database.
		resultString = stmt.executeQuery(str);
		resultString.next();
		String depTime = resultString.getString("depTime");
		
		//Retrieve Arrival Place information from Flight table:
		str = "SELECT arrAirID FROM Flight WHERE Airline_ID = '"+airID+"' AND Flight_No = '"+flightID+"' AND depDate = '"+ depDate+"'";
		//Run the query against the database.
		resultString = stmt.executeQuery(str);
		resultString.next();
		String arrAirID = resultString.getString("arrAirID");
		
		//Retrieve Arrival Date information from Flight table:
		str = "SELECT arrDate FROM Flight WHERE Airline_ID = '"+airID+"' AND Flight_No = '"+flightID+"' AND depDate = '"+ depDate+"'";
		//Run the query against the database.
		resultString = stmt.executeQuery(str);
		resultString.next();
		String arrDate = resultString.getString("arrDate");
		
		//Retrieve Arrival Time information from Flight table:
		str = "SELECT arrTime FROM Flight WHERE Airline_ID = '"+airID+"' AND Flight_No = '"+flightID+"' AND depDate = '"+ depDate+"'";
		//Run the query against the database.
		resultString = stmt.executeQuery(str);
		resultString.next();
		String arrTime = resultString.getString("arrTime");

		String accNo = (String) request.getSession().getAttribute("accNo");
		
		//Make an insert statement for the Passenger table:
		String insert = "INSERT INTO Reservation (Res_No, Account_No, CR_ID, Date, Total_Fare, Booking_Fee, Fare_Restrictions)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		System.out.println("83");

		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		
		String CR_ID = "000";	//for web bookings
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, resNo);
		ps.setString(2, accNo);
		ps.setString(3, CR_ID);
		ps.setString(4, depDate);
		ps.setString(5, tFare);
		ps.setString(6, bookFee);
		ps.setString(7, fareRes);
		System.out.println("97");
		
		//Run the query against the DB
		ps.executeUpdate();
		
		System.out.println("65");
		//Make an insert statement for the Passenger table:
		insert = "INSERT INTO Passenger (resNo, firstName, lastName, mealPref, seatPref)"
				+ "VALUES (?, ?, ?, ?, ?)";
		System.out.println("73");

		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		ps = con.prepareStatement(insert);
		System.out.println("77");

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, resNo);
		ps.setString(2, first);
		ps.setString(3, last);
		ps.setString(4, mealPref);
		ps.setString(5, seatPref);
		System.out.println("85");

		//Run the query against the DB
		ps.executeUpdate();
		System.out.println("125");

		if(!first2.equals("")){
			//Make an insert statement for the Passenger table:
			insert = "INSERT INTO Passenger (resNo, firstName, lastName, mealPref, seatPref)"
					+ "VALUES (?, ?, ?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert);
			System.out.println("134");

	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, resNo);
			ps.setString(2, first2);
			ps.setString(3, last2);
			ps.setString(4, mealPref);
			ps.setString(5, seatPref);
			
			//Run the query against the DB
			ps.executeUpdate();
		}
		System.out.println("147");

		if(!first3.equals("")){
			//Make an insert statement for the Passenger table:
			insert = "INSERT INTO Passenger (resNo, firstName, lastName, mealPref, seatPref)"
					+ "VALUES (?, ?, ?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, resNo);
			ps.setString(2, first3);
			ps.setString(3, last3);
			ps.setString(4, mealPref);
			ps.setString(5, seatPref);
			
			//Run the query against the DB
			ps.executeUpdate();
		}
		System.out.println("167");

		if(!first4.equals("")){
			//Make an insert statement for the Passenger table:
			insert = "INSERT INTO Passenger (resNo, firstName, lastName, mealPref, seatPref)"
					+ "VALUES (?, ?, ?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, resNo);
			ps.setString(2, first4);
			ps.setString(3, last4);
			ps.setString(4, mealPref);
			ps.setString(5, seatPref);
			
			//Run the query against the DB
			ps.executeUpdate();
		}
//=============
		//Make an insert statement for the Leg table:
		insert = "INSERT INTO Leg (Departure_Date_Time, Res_No, Airline_ID, Flight_Number, From_Airport_ID, To_Airport_ID)"
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		System.out.println("83");

		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		ps = con.prepareStatement(insert);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, depDate);
		ps.setString(2, resNo);
		ps.setString(3, airID);
		ps.setString(4, flightID);
		ps.setString(5, depAirID);
		ps.setString(6, arrAirID);
		System.out.println("97");
		
		//Run the query against the DB
		ps.executeUpdate();
//=============				
		//Close the connection.
		con.close();
		
		out.println("Reservation created. Reservation Number: \t"+resNo+" | ");
		
		out.println(" Departing from: "+ depAirID+ " at "+depTime+" on "+depDate+" | ");	
		out.println(" Arriving at: "+ arrAirID+ " at "+arrTime+" on "+arrDate+" | ");
		out.println("");
		out.println(" Passengers: ");				
		out.println(first+" "+last+" ");				
		out.println(first2+" "+last2+" ");				
		out.println(first3+" "+last3+" ");				
		out.println(first4+" "+last4+" ");
		out.println(" | Meal Preference: "+ mealPref+" | ");
		out.println(" Seat Preference: "+ seatPref+" | ");
		out.println("Total Charges: "+dFare+" | ");
		
	} catch (Exception e){
		out.print("An error has occurred.");
		e.printStackTrace(new java.io.PrintWriter(out));
	}
%>			  
<p>
Your reservation confirmation details are shown above.
<br>
Press Home to return to the main page.
<br>
</body>
</html>