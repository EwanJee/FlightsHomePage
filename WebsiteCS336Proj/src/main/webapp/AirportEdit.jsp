<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Hi Airplane World</title>
	</head>
		<h1>Airport Add/Edit</h1>
		<p>Add Airport</p>
		<p></p>
	<body>
	
		<form method="post" action="AirportRegister.jsp">
			<table>

				<tr>
					<td>PID:</td><td><input type="text" name="pid"></td>
				</tr>
				<tr>
					<td>LID:</td><td><input type="text" name="lid"></td>
				</tr>
				
				<tr>
					<td>Name:</td><td><input type="text" name="name"></td>
				</tr>	
				<tr>
					<td>Location:</td><td><input type="text" name="location"></td>
				</tr>
				
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
	
			<p>Delete Airport</p>
		<p></p>
	<body>
	
		<form method="post" action="AirportDelete.jsp">
			<table>

				<tr>
					<td>PID:</td><td><input type="text" name="pid"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
	
	
	<p>Edit Airport Information</p>
		<p></p>
	<body>
	
		<form method="post" action="AirportEditInformation.jsp">
			<table>

				<tr>
					<td>PID:</td><td><input type="text" name="pid"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
		
</head>


<body>

</body>

</html>