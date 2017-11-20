<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file ="globalvariable.jsp" %>
<%@page import="java.text.DateFormat"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar" %>  
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Calendar" %>
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
<title>Making Advanced Reservation</title>
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
		String depDate = request.getParameter("departDate");
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
		
		
		//Retrieve Fare information from Flight table:
		String str = "SELECT Fare FROM Flight WHERE Airline_ID = '"+airID+"' AND Flight_No = '"+flightID+"' AND depDate = '"+ depDate+"'";
		//Run the query against the database.
		ResultSet resultString = stmt.executeQuery(str);
		resultString.next();
		String fare = resultString.getString("Fare");

		

		Double bFee = Double.parseDouble(fare)*0.1;
		String bookFee = Double.toString(bFee);
		//out.println("book fee:" + bookFee);

		//Retrieve Fare_Restriction information from Flight table:
		str = "SELECT Advance_Purchase FROM Flight WHERE Airline_ID = '"+airID+"' AND Flight_No = '"+flightID+"' AND depDate = '"+ depDate+"'";
		//Run the query against the database.
		resultString = stmt.executeQuery(str);
		resultString.next();
		String fareRes = resultString.getString("Advance_Purchase");
		out.println("Advance_Purchase requirment:" + fareRes + " days <br>");
		out.println("your departDate:" + depDate+ "<br>");
		String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		out.println("Today's Date:" + today+ "<br>");
		
		
		String[] today_s = today.split("-");
		int today_y = Integer.parseInt(today_s[0]);
		int today_m = Integer.parseInt(today_s[1]);
		int today_d = Integer.parseInt(today_s[2]);
		
		String[] depart_s = depDate.split("-");
		int depart_y = Integer.parseInt(depart_s[0]);
		int depart_m = Integer.parseInt(depart_s[1]);
		int depart_d = Integer.parseInt(depart_s[2]);
		
		int diff = today_y * 365 + today_m * 30 + today_d - (depart_y*365 + depart_m*30 + depart_d);
	    
	    //out.println("diff:"+diff+"<br>");
	    boolean discount_true = false;
	    if(diff >= Integer.parseInt(fareRes)) {
	    		discount_true = true;
	    }

		/**/
		/* java.util.Date  d1 = new java.util.Date() ;
		java.util.Date  d2 = new java.util.Date(depDate);
		
		int dif = d1.compareTo(d2);
		out.println("days between :" + dif); */
		
		str = "SELECT Fare FROM Flight WHERE Airline_ID = '"+airID+"' AND Flight_No = '"+flightID+"' AND depDate = '"+ depDate+"'";
		//Run the query against the database.
		resultString = stmt.executeQuery(str);
		resultString.next();
		String origianlFee = resultString.getString("Fare");
		out.println("Original Fare:" + origianlFee+ "<br>");
			
		String accNo = (String) request.getSession().getAttribute("accNo");
		
		out.println("your accNo:" + accNo+ "<br>");
		
		//Make an insert statement for the Passenger table:
		String insert = "INSERT INTO Reservation (Res_No, Account_No, CR_ID, Date, Total_Fare, Booking_Fee, Fare_Restrictions)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		
		String CR_ID = "000";	//for web bookings
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, resNo);
		ps.setString(2, accNo);
		ps.setString(3, CR_ID);
		ps.setString(4, depDate);
		ps.setString(5, fare);
		ps.setString(6, bookFee);
		ps.setString(7, fareRes);
		
		//Run the query against the DB
		ps.executeUpdate();
		
		//Make an insert statement for the Passenger table:
		insert = "INSERT INTO Passenger (resNo, firstName, lastName, mealPref, seatPref)"
				+ "VALUES (?, ?, ?, ?, ?)";

		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, resNo);
		ps.setString(2, first);
		ps.setString(3, last);
		ps.setString(4, mealPref);
		ps.setString(5, seatPref);

		//Run the query against the DB
		ps.executeUpdate();

		if(!first2.equals("")){
			//Make an insert statement for the Passenger table:
			insert = "INSERT INTO Passenger (resNo, firstName, lastName, mealPref, seatPref)"
					+ "VALUES (?, ?, ?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert);
			
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, resNo);
			ps.setString(2, first);
			ps.setString(3, last);
			ps.setString(4, mealPref);
			ps.setString(5, seatPref);
			
			//Run the query against the DB
			ps.executeUpdate();
		}

		if(!first3.equals("")){
			//Make an insert statement for the Passenger table:
			insert = "INSERT INTO Passenger (resNo, firstName, lastName, mealPref, seatPref)"
					+ "VALUES (?, ?, ?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, resNo);
			ps.setString(2, first);
			ps.setString(3, last);
			ps.setString(4, mealPref);
			ps.setString(5, seatPref);
			
			//Run the query against the DB
			ps.executeUpdate();
		}

		if(!first4.equals("")){
			//Make an insert statement for the Passenger table:
			insert = "INSERT INTO Passenger (resNo, firstName, lastName, mealPref, seatPref)"
					+ "VALUES (?, ?, ?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, resNo);
			ps.setString(2, first);
			ps.setString(3, last);
			ps.setString(4, mealPref);
			ps.setString(5, seatPref);
			
			//Run the query against the DB
			ps.executeUpdate();
		}
		
		//Make an insert statement for the Passenger table:
		insert = "INSERT INTO Credit_Card (Card_No, Type, Billing_Address, First_Name, Last_Name)"
				+ "VALUES (?, ?, ?, ?, ?)";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, ccn);
		ps.setString(2, ccType);
		ps.setString(3, ccbillAddr);
		ps.setString(4, ccfirstName);
		ps.setString(5, cclastName);
		
		//Run the query against the DB
		ps.executeUpdate();
		
		//Close the connection.
		con.close();
		out.println("Your Confirm number is:"+resNo + "<br>");
		
		Double bkfee = Double.parseDouble(fare)*0.1;
		
		
		//float bkfee = Integer.parseInt(bookFee);
		double ffee = Double.parseDouble(fare);
		double totalf = ffee + bkfee;
		if(discount_true){
			out.println("Your reservation satisfies an advance discount of 15%. <br>");
			out.println("Book fee:" + bkfee + " <br>");
			out.println("Flight fee:" + ffee * 0.85 + " <br>");
			out.println("Discount: 15%" + " <br>");
		}else{
			out.println("Normarl reservation" + "<br>");
			out.println("Book fee:" + bkfee + " <br>");
			out.println("Flight fee:" + ffee + " <br>");
		}
		
		//response.sendRedirect("confirm1.jsp");
	} catch (Exception e){
		out.println("An error has occurred.");
		e.printStackTrace(new java.io.PrintWriter(out));
	}
%>			  
<br>
<form>
Your reservation has been created. Your reservation number is printed above.

<br>
<!-- <input type = "submit" value="Confirmation"> -->
</form>
<br>
</body>
</html>