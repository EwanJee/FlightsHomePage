<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Hi Airplane World</title>
	</head>
	
	<body>

		Login  <!-- the usual HTML way -->
		<% out.println("Here:"); %> <!-- output the same thing, but using 
	                                      jsp programming -->
							  
		
	<br>
	
	
	
		<form method="post" action="loginCheck.jsp">
			<table>
				<tr>    
					<td>Username:</td><td><input type="text" name="use"></td>
				</tr>
				<tr>
					<td>Password:</td><td><input type="text" name="pass"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
	
	

</body>
</html>