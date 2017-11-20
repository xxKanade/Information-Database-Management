<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>   
<div align="left">
<a href="searchReserve.jsp">Home</a>
</div>
<br>
	<%
	try {
			
			//Create a connection string
			String url = "jdbc:mysql://cs336project2017summer.cdbdnh5z4lat.us-west-2.rds.amazonaws.com:3306/cs336";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			java.sql.Connection con = DriverManager.getConnection(url,"cs336","cs336test");//("jdbc:mysql://localhost:3306/test","root","root"); 

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the Airline_Home.jsp
			String login = request.getParameter("usr");
			String pass = request.getParameter("pwd");
			//Make a SELECT query from the accounts table
			String str = "SELECT * FROM Account WHERE userName = '" + login + "' AND pass = '" + pass +"'";
			//Run the query against the database.
			
			//out.print("query string: " + str);
			//rout.print("login name: " + login + " pass: " + pass);
			
			ResultSet result = stmt.executeQuery(str);
			
			if (!result.next() ) {
				out.print("login failed, please check your user name and password");
			} else{
				
				result = stmt.executeQuery("select Account_No from Account where userName='"+login+"'"); 
				if(result.next()) 
				{ 
					String accNo = result.getString("Account_No");
					request.getSession().setAttribute("accNo", accNo);
				}
				
				out.print("login succeeded: welcome to your account, " + login);
			}
			
			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("login failed, connection error");
		}
%>
</body>
</html>