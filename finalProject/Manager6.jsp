<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager6</title>
</head>
<body>
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

			// Check user id
			if(request.getSession().getAttribute("userid") != null){
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
					out.print("<a href=\"CustomerRep.jsp\">Back</a>");
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
					out.print("<a href=\"Manager.jsp\">Back</a>");
					out.print("</div>");
					out.print("<br>");
				}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			String str ="SELECT m.ID_No, p.First_Name, p.Last_Name, m.Total_Revenue"
					+"			 FROM"
					+"				(SELECT A.ID_No, tf AS Total_Revenue"
					+"				FROM"
					+"					(SELECT Account_No, (SUM(Total_Fare)+SUM(Booking_Fee)) AS tf FROM Reservation GROUP BY Account_No) monies, Customer C, Account A"
					+"					WHERE monies.Account_No=A.Account_No AND A.ID_No=C.ID_No"
					+"					GROUP BY A.ID_No) m, Person p"
					+"			WHERE p.ID_No=m.ID_No AND Total_Revenue =" 
					+"				 (SELECT MAX(m.Total_Revenue)"
					+"				 FROM"
					+"					(SELECT A.ID_No, tf AS Total_Revenue"
					+"					FROM"
					+"						(SELECT Account_No, (SUM(Total_Fare)+SUM(Booking_Fee)) AS tf FROM Reservation GROUP BY Account_No) monies, Customer C, Account A"
					+"						WHERE monies.Account_No=A.Account_No AND A.ID_No=C.ID_No"
					+"						GROUP BY A.ID_No) m);";
						//Run the query against the database.
						ResultSet result = stmt.executeQuery(str);
						result.next();
						out.print("The customer who provides the most revenue is "+result.getString("ID_No")+", whose name is "+result.getString("First_Name")+" "+result.getString("Last_Name")+
								", who brought in $"+result.getString("Total_Revenue")+".");
						

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("ERROR: Search Failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}

%>

</body>
</html>