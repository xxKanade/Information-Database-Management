<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustomerRegister</title>
<style>
body {
background-image: url(https://spirilio.gr/wp-content/uploads/2016/10/travelco-logo-1.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: 75% 100%;
background-position: center center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;
}
</style>
</head>
<body>
<div align="left">
<a href="Home.jsp">Home</a>
</div>
<br>


Enter the following information to create your account:
<br>
<br>
(If you are already a Customer with TravelCo, but would like to make another Account, please enter your Customer ID as well)
<br>
<br>
<form action="CustomerRegistera.jsp" method="post">

User name (required):<input type="text" name="username" /><br/>
Password (required):<input type="password" name="pwd" /><br/>
Customer ID (optional):<input type="text" name="cid" /><br/>
First Name (optional):<input type="text" name="fname" /><br/>
Last Name (optional):<input type="text" name="lname" /><br/>
Address (optional):<input type="text" name="adress" /><br/>
City (optional):<input type="text" name="city" /><br/>
State (optional):<input type="text" name="state" /><br/>
ZipCode (optional):<input type="text" name="zip" /><br/>
Telephone (optional):<input type="text" name="tel" /><br/>

<br/>

<input type="submit" />

</form>


</body>
</html>