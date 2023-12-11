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
		<h1>Flight Add/Edit</h1>
		<p>Add Flight</p>
		<p></p>
	<body>
	
		<form method="post" action="FlightsRegister.jsp">
			<table>
    			<tr>
					<td>Flight Number:</td><td><input type="number" name="fNumber"></td>
				</tr>
				<tr>
					<td>CNUM:</td><td><input type="number" name="cNumber"></td>
				</tr>
				
				<tr>
					<td>LID:</td><td><input type="text" name="lid"></td>
				</tr>
				<tr>
					<td>Departing Port:</td><td><input type="text" name="depPort"></td>
				</tr>
				<tr>
					<td>Departing date:</td><td><input type="datetime-local" name="depDate"></td>
				</tr>
				<tr>
					<td>Destination Port:</td><td><input type="text" name="destPort"></td>
				</tr>
				<tr>
					<td>Destination date:</td><td><input type="date" name="destDate"></td>
				</tr>
				<tr>
					<td>Flight Duration (# hours):</td><td><input type="number" name="duration"></td>
				</tr>
				<tr>
					<td>Days:</td><td><input type="text" name="days"></td>
				</tr>
				<tr>
					<td>Waiting List Size:</td><td><input type="number" name="waitingList"></td>
				</tr>
				
				<tr>
					<td><input type="radio" name="ticketType" value="One-Way">
 					<label for="One-Way"> One-Way Trip</label></td>
 				</tr>
 				
 				<tr>
  					<td><input type="radio" name="ticketType" value="Round-Trip">
 					<label for="Round-Trip"> Round Trip</label></td>
 				</tr>
 				
 				<tr>
					<td><input type="radio" name="flightType" value="Domestic">
 					<label for="Domestic"> Domestic Flight</label></td>
 				</tr>
 				
 				<tr>
  					<td><input type="radio" name="flightType" value="International">
 					<label for="International"> International Flight</label></td>
 				</tr>
				
				<tr>
					<td>Economy Seat Price:</td><td><input type="number" name="economyPrice"></td>
				</tr>
				<tr>
					<td>Business Seat Price:</td><td><input type="number" name="businessPrice"></td>
				</tr>
				<tr>
					<td>First Seat Price:</td><td><input type="number" name="firstPrice"></td>
				</tr>	
				
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
	
			<p>Delete Flight</p>
		<p></p>
	<body>
	
		<form method="post" action="FlightsDelete.jsp">
			<table>

				<tr>
					<td>Flight Number:</td><td><input type="number" name="fNumber"></td>
				</tr>
				<tr>
					<td>LID:</td><td><input type="text" name="lid"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
	
	
	<p>Edit Flight Information</p>
		<p></p>
	<body>
	
		<form method="post" action="FlightsEditInformation.jsp">
			<table>

				<tr>
					<td>Flight Number:</td><td><input type="number" name="fNumber"></td>
				</tr>
				<tr>
					<td>LID:</td><td><input type="text" name="lid"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
		
</head>


<body>

</body>

</html>