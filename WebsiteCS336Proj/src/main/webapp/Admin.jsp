<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<title>Hi Airplane World</title>
	</head>
	
	<%		
	String aID = request.getParameter("aid");
	out.print("Logged in as: " + aID);
	%>
		<h1>Airline Admin</h1>
		<a href="CustomerEdit.jsp">Customer Add/Edit</a>
		<p></p>
		<a href="Customer_RepEdit.jsp">Customer Representative Add/Edit</a>
		<p></p>
		<a href="SalesReportByMonth.jsp">Sales Report by Month</a>
		<p></p>
		<a href="ReservationsByFlightOrCustomer.jsp">Reservations by Flight Number/Customer</a>
		<p></p>
		<a href="RevenueByFlightAirlineOrCustomer.jsp">Revenue by Flight, Airline, or Customer</a>	
		<p></p>
		<a href="CustomerWithMostRevenue.jsp">Customer with most revenue</a>		
		<p></p>
		<a href="FlightsByTicketsSold.jsp">Flights by Most Tickets Sold</a>		
		<p></p>
		<p></p>
		
	<body>

</head>
<body>

</body>

</html>