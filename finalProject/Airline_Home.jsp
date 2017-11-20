<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Air Travel</title>
</head>
<body>
Welcome to Project 336: Your Air Travel Platform
<br />
<br />
<br />

Already have an Account? Login here:
<br>
	<form method="post" action="Login.jsp">
	<table>
	<tr>
	<td>Login-Name:</td><td><input type="text" name="loginname"></td>
	</tr>
	<tr>
	<td>Password:</td><td><input type="text" name="password"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
<br>
<br>

Alternatively, you can make an Account below:
<br>
	<form method="post" action="NewAccount.jsp">
	<table>
	<tr>
	<td>New Login-Name:</td><td><input type="text" name="loginname"></td>
	</tr>
	<tr>
	<td>New Password:</td><td><input type="text" name="password"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>

</body>
</html>