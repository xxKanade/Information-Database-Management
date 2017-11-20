<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustomerLogin</title>
<style>
body {
background-image: url(https://spirilio.gr/wp-content/uploads/2016/10/travelco-logo-1.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: center center !important;
background-repeat: no repeat !important;
background-attachment: fixed;
}
</style>
</head>
<body>
<div align="left">
<a href="Home.jsp">Home</a>
</div>
Welcome Travelco Customer!
<br />
Please login with your User Name and Password below:

<br />
<br>
<br>
<br>

<form action="CustomerLogina.jsp" method="post">
	<table>
	<tr>
	<td>User Name:</td><td><input type="text" name="usr" /></td>
	</tr>
	<tr>
	<td>Password:</td><td><input type="password" name="pwd" /></td>
	</tr>
	</table>
<input type="submit" value="Login"/>

</form>
</body>
</html>