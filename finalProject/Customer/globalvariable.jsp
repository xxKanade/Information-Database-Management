<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    
<%@ page import="java.util.*"%> 
<%@page import="java.text.SimpleDateFormat" %>     


<%! String userName_global = ""; %>
<%! String cid_global = ""; %>
<%! String airlineCode_global = ""; %>
<%! String flightNo_global = ""; %>
<%! String departDate_global ="";  %>
<%! String origin_global ="";  %>
<%! String destination_global = ""; %>
<%! String resNo_global =""; %>
<%! double fare_global = 0.0; %>

<%!

    public void logout(){
		userName_global = null;
		cid_global = null;
    }
	public void setUserName(String userName){
		userName_global = userName;
	}
%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>



<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<br/><br/>

</body>
</html>