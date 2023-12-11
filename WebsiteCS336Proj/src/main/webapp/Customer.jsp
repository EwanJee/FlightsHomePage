<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Hi Airplane World</title>
		<link rel="stylesheet" href="Popup.css">
	</head>
	
 <h1>Airline Customer</h1>
 	
 	<%		
	String cID = request.getParameter("cid");
	out.print("Logged in as: " + cID);
	%>
	
 <!-- I've put all of the options for searching for different flights in this popup -->
<div class="popup" id="popup-1">
	<div class="overlay"> </div>
	<div class="content">
		<div class="close-btn" onclick="togglePopup()">&times;</div>
		
		<!-- Below is the actual block of text/ options for different flights -->
		<h1> Choose your preferred ticket type! </h1>
<br>
		<form method="post" action="Flights.jsp">
			<input type="radio" name="ticketType" value="One-Way">
 			<label for="One-Way"> One-Way Trip</label><br>
  			<input type="radio" name="ticketType" value="Round-Trip">
 			<label for="Round-Trip"> Round Trip</label><br>
			<input type="submit" value="Search">
		</form>
		<!-- ^^^Will need to add more options for different flight types too I believe -->
	<br>
		
</div>
</div>
 <!-- Popup Options End -->
 
 <!-- Javascript for Popup -->
<script type="text/javascript"src="Popup.js"></script>
<button onclick="togglePopup()">Search Flights</button>

    <p>Flexible Flights</p>
    <p>Reserve Flights</p>
    <p>Cancel Flight</p>
    <p>Past Reservations</p>
    <p>Upcoming Reservations</p>
    <p>Questions</p>
    <p>Ask Question</p>
	<body>
		
</head>
<body>



	
</body>

</html>