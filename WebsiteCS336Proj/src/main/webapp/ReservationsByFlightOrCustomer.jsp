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
		<h1>Reservation Search</h1>
	<body>
	
		<form method="post" action="ReservationsByFlightNumber.jsp">
			<table>
			
				<tr>
					<td>Flight Number:</td><td><input type="text" name="fnumber"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
		<p></p>
	<body>
	
		<form method="post" action="ReservationsByCustomerName.jsp">
			<table>
			
				<tr>
					<td>Customer Name:</td><td><input type="text" name="name"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
		
</head>


<body>

</body>

</html>