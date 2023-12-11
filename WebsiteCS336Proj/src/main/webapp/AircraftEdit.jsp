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
		<h1>Aircraft Add/Edit</h1>
		<p>Add Aircraft</p>
		<p></p>
	<body>
	
		<form method="post" action="AircraftRegister.jsp">
			<table>

				<tr>
					<td>CNUM:</td><td><input type="number" name="cNumber"></td>
				</tr>
				<tr>
					<td>PID:</td><td><input type="text" name="pid"></td>
				</tr>
				<tr>
					<td>LID:</td><td><input type="text" name="lid"></td>
				</tr>
				<tr>
					<td>Economy Seat Count:</td><td><input type="number" name="economySeat"></td>
				</tr>
				<tr>
					<td>Business Seat Count:</td><td><input type="number" name="businessSeat"></td>
				</tr>
				<tr>
					<td>First Seat Count:</td><td><input type="number" name="firstSeat"></td>
				</tr>
				<tr>
					<td>Name:</td><td><input type="text" name="name"></td>
				</tr>	
				
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
	
			<p>Delete Aircraft</p>
		<p></p>
	<body>
	
		<form method="post" action="AircraftDelete.jsp">
			<table>

				<tr>
					<td>CNUM:</td><td><input type="number" name="cNumber"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
	
	
	<p>Edit Aircraft Information</p>
		<p></p>
	<body>
	
		<form method="post" action="AircraftEditInformation.jsp">
			<table>

				<tr>
					<td>CNUM:</td><td><input type="number" name="cNumber"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
		
</head>


<body>

</body>

</html>