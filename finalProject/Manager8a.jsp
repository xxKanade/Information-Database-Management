<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager8a</title>
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
					out.print("<a href=\"Manager8.jsp\">Back</a>");
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
					out.print("<a href=\"Manager8.jsp\">Back</a>");
					out.print("</div>");
					out.print("<br>");
				}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			
			// Get parameters
			String airline = request.getParameter("airline");
			String fno = request.getParameter("fno");
			String date = request.getParameter("date");
			
			if(airline.equals("") || fno.equals("") || date.equals("")){
				out.print("ERROR: Invalid Input. Input left blank. Please enter a valid airline code, flight number, and flight departure date.");
				con.close();
				return;
			}
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String str = "SELECT * FROM Flight WHERE Airline_ID = '"+airline+"' AND Flight_No = '"+fno+"' AND depDate = '"+date+"'";
				
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			if (!result.next() ) {
					out.print("ERROR: No such Flight exists in the system. Please enter a valid Airline Code, Flight Number, Departure Date");
					con.close();
					return;
			}
			System.out.println("79");

			str = "SELECT * FROM Passenger Pa, Leg L, Reservation R, Flight F, Customer C, Account A, Person P WHERE Pa.resNo = R.Res_No AND C.ID_No = A.ID_No AND C.ID_No = P.ID_No AND R.Account_No = A.Account_No AND L.Res_No = R.Res_No AND L.Airline_ID = '"+ airline + "' AND L.Flight_Number = '"+fno+"' AND L.Departure_Date_Time LIKE	 '" + date + "%'";						
			System.out.println("81");
			result = stmt.executeQuery(str);
				if (!result.next() ) {
					out.print("There are no Customers currently in the system for this Flight "+airline+" "+fno+" on "+date+".");
				}
				else{
					
					out.print("Customers for: <br>");
					out.print("Airline: "+airline+"<br>");
					out.print("Flight Number: "+fno+"<br>");
					out.print("Date: "+date+"<br><br>");
					
					//Make an HTML table to show the results in:
					out.print("<table style= 'text-align:center' cellspacing='15' table border='3' bordercolor='#c86260' rules='all'");

					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					out.print("<b>Customer ID</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>First Name</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Last Name</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>From Airport</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>To Airport</b>");
					out.print("</td>");
					//end row
					out.print("</tr>");

					//parse out the results
					while (true) {
						//make a row
						out.print("<tr>");
						//make a column
						out.print("<td>");
						out.print(result.getString("depAirID"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("arrAirID"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("ID_No"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("First_Name"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Last_Name"));
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
			out.print("search failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}
%>






</body>
</html>