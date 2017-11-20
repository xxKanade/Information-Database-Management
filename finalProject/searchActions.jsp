<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redirecting</title>
</head>
<body>			  
<div align="left">
<a href="searchReserve.jsp">Home</a>
</div>
<div>
<a href="CustomerLogout.jsp">Logout</a>
</div>
<div>
<a href="fly1.jsp">Back</a>
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
	//Get the selected radio button from the Manager.jsp
	String taskNum = request.getParameter("command");
		
	if(taskNum.equals("one")){
		response.sendRedirect("fly1.jsp");
	}else if(taskNum.equals("round")){
		response.sendRedirect("fly2.jsp");
	}else if(taskNum.equals("multi")){
		response.sendRedirect("fly3.jsp");
	}else if(taskNum.equals("flex")){
		response.sendRedirect("fly4.jsp");
	}else if(taskNum.equals("bestSeller")){
		response.sendRedirect("fly5.jsp");
	}else if(taskNum.equals("Advanced")){
		response.sendRedirect("fly6.jsp");
	}
	//close the connection.
	con.close();
	
}catch (Exception e) {
	out.print("Error 404: Page Not Found");
}

%>

</body>
</html>