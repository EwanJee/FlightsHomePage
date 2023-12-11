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
	
	<%		
	String rID = request.getParameter("rid");
	out.print("Logged in as: " + rID);
	%>
	
<h1>Customer Representative</h1>
<p>Reserve Flight</p>
<p>Edit Flight Reservation</p>
<p>Questions</p>
<a href="AircraftEdit.jsp">Aircraft Edit</a>
<p></p>
<a href="AirportEdit.jsp">Airport Edit</a>
<p></p>
<a href="FlightsEdit.jsp">Flight Edit</a>
<p></p>
<p>Passenger Waiting List By Flight</p>
<p>Flights At An Airport</p>
		<p></p>
	<body>
		
</head>
<body>

</body>

</html>
