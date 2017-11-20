<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Logina</title>
</head>
<body>
<div align="left">
<a href="Home.jsp">Home</a>
</div>
<div align="left">
<a href="CustomerLogin.jsp">Back to Login</a>
</div>
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
			
			String userName = request.getParameter("usr"); 
			String pwd = request.getParameter("pwd"); 
			
			ResultSet result = stmt.executeQuery("select * from Account where userName='"+userName+"'"); 
			if(result.next()) 
			{ 
				String pass = result.getString("pass");
				String accNo = result.getString("Account_No");
				if(pass.equals(pwd)) 
				{ 
					out.println("Welcome, "+userName + "!");
					request.getSession().setAttribute("accNo", accNo);
					response.sendRedirect("searchReserve.jsp");
				} 
				else 
				{ 
					out.println("ERROR: Invalid password, please try again");
					request.getSession().setAttribute("accNo", null); 
				} 
			} 
			else {
				out.println("ERROR: Invalid password, please try again");
			}
			
			//Close the connection.
			con.close();
			
	} catch (Exception e) {
		out.print("ERROR: Login Failed");
	}

%>
</body>
</html>