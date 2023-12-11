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
 <h1>Airline Customer</h1>
    <p>One-Way Flights</p>
    <p>Round-Trip Flights</p>
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



<div class="popup" id="popup-1">
	<div class="overlay"> </div>
	<div class="content">
		<div class="close-btn" onclick="togglePopup()">&times;</div>
		<h1> Choose your preferred ticket type ! </h1>
<br>
		<form method="post" action="Flights.jsp">
			<input type="radio" name="ticketType" value="One-Way">
 			<label for="One-Way"> One-Way Trip</label><br>
  			<input type="radio" name="ticketType" value="Round-Trip">
 			<label for="Round-Trip"> Round Trip</label><br>
			<input type="submit" value="Search">
		</form>
	<br>
		
</div>
</div>

<button onclick="togglePopup()">Search Flights</button>

<script type="text/javascript"src="Popup.js"></script>
	
	<a href='#' onclick='javascript:window.open("http://myurl", "_blank", "scrollbars=1,resizable=1,height=300,width=450");' title='Pop Up'>Pop Up</a>
	
</body>

</html>