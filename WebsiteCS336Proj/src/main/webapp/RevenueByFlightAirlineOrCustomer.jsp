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
		<h1>Revenue Search</h1>
	<body>
	
		<form method="post" action="RevenueByFlight.jsp">
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
	
		<form method="post" action="RevenueByCID.jsp">
			<table>
			
				<tr>
					<td>CID:</td><td><input type="text" name="cid"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>

			<form method="post" action="RevenueByAirline.jsp">
			<table>
			 
				<tr>
					<td>Airline ID:</td><td><input type="text" name="lid"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
		
</head>


<body>

</body>

</html>