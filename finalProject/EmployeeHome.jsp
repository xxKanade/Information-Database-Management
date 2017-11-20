<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Home</title>
<style>
body {
background-image: url(https://spirilio.gr/wp-content/uploads/2016/10/travelco-logo-1.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: 85% 100%;
background-position: center center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;
}
</style>
</head>
<body>
<div align="left">
<a href="Home.jsp">Main Home</a>
</div>

Welcome Travelco Employee!
<br />
Please login with your Employee ID and Password below:

<br />
<br />
<br />
<br>
	<form method="post" action="EmployeeLogin.jsp">
	<table>
	<tr>
	<td>Employee ID Number:</td><td><input type="text" name="id" maxlength="12"></td>
	</tr>
	<tr>
	<td>Password:</td><td><input type="password" name="password" maxlength="20"></td>
	</tr>
	</table>
	<input type="submit" value="Submit">
	</form>
<br>
<br>
<br>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
If you do not have an account set up with Travelco, please contact Customer Service at 1-800-ITRAVEL to set up an account with the database administrator.

<br>

</body>
</html>