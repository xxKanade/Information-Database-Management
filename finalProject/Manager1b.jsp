<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager1b</title>
</head>
<body>
<div align="left">
<a href="Manager.jsp">Home</a>
</div>
<div>
<a href="EmployeeLogout.jsp">Logout</a>
</div>
<div>
<a href="Manager1.jsp">Back</a>
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
				if (!result.next() ) {
					//Employee is a Customer Rep
					response.sendRedirect("CustomerRep.jsp");
					}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			
			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the Manager1.jsp
			String id = request.getParameter("id");
			String ssn = request.getParameter("ssn");
			String password = request.getParameter("password");
			String rate = request.getParameter("rate");
			String date = request.getParameter("date");
			String first = request.getParameter("first");
			String last = request.getParameter("last");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String phone = request.getParameter("phone");
			
			//Check that ID is numeric and is not empty
			if(!id.matches("((-|\\+)?[0-9]+(\\.[0-9]+)?)+") || id.equals("")) {
				con.close();
				throw new IndexOutOfBoundsException("ERROR: Not a valid Employee ID. Please enter up to 12 numeric characters.");
			}
			//Make a SELECT query from the Employee table
			String str = "SELECT * FROM Employee WHERE ID_No = '" + id + "'";
			//Run the query against the database.
					
			ResultSet result = stmt.executeQuery(str);
				if (!result.next() ) {
					con.close();
					throw new IndexOutOfBoundsException("ERROR: Employee does not exist; enter a valid Employee ID");
				}
				
			if(!ssn.equals("")){
				String update = "UPDATE Employee SET SSN = ? WHERE ID_No = '" + id + "'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, ssn);
				ps.executeUpdate();
			}
			if(!password.equals("")){
				String update = "UPDATE Employee SET password = ? WHERE ID_No = '" + id +"'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, password);
				ps.executeUpdate();
			}
			if(!rate.equals("")){
				String update = "UPDATE Employee SET Hourly_Rate = ? WHERE ID_No = '" + id +"'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, rate);
				ps.executeUpdate();
			}
			if(!date.equals("")){
				String update = "UPDATE Employee SET Start_Date = ? WHERE ID_No = '" + id +"'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, date);
				ps.executeUpdate();
			}
			if(!first.equals("")){
				String update = "UPDATE Person SET First_Name = ? WHERE ID_No = '" + id +"'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, first);
				ps.executeUpdate();
			}
			if(!last.equals("")){
				String update = "UPDATE Person SET Last_Name = ? WHERE ID_No = '" + id +"'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, last);
				ps.executeUpdate();
			}
			if(!address.equals("")){
				String update = "UPDATE Person SET Address = ? WHERE ID_No = '" + id +"'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, address);
				ps.executeUpdate();
			}
			if(!city.equals("")){
				String update = "UPDATE Person SET City = ? WHERE ID_No = '" + id +"'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, city);
				ps.executeUpdate();
			}
			if(!state.equals("")){
				String update = "UPDATE Person SET State = ? WHERE ID_No = '" + id +"'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, state);
				ps.executeUpdate();
			}
			if(!zip.equals("")){
				String update = "UPDATE Person SET Zip_Code = ? WHERE ID_No = '" + id +"'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, zip);
				ps.executeUpdate();
			}
			if(!phone.equals("")){
				String update = "UPDATE Person SET Telephone_No = ? WHERE ID_No = '" + id +"'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, phone);
				ps.executeUpdate();
			}
	
			//Close the connection.
			con.close();
			
			out.print("Edit succeeded!");
		} catch (Exception e) {
			out.print("ERROR: Edit failed");
		}
%>

</body>
</html>