<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	table {
		border-collapse : collapse;
		width : 100%
	}
	th,td {
		border: 1px solid #dddddd;
		text-align: left;
		padding: 8px;
	}
	th{
		background-color: #f2f2f2;
		cursor: pointer;
	}
	.filter-container {
		margin-bottom: 10px;
	}
	.filter-input {
		margin-right: 10px;
	}
</style>
</head>
<body>
<h2> you can filter by at least one criteria ! Don't forget to click "Enter" </h2>
<div class="filter-container">
    <label for="eFilter">Economy-class Price:</label>
    <input type="number" id="epriceFilter" class="filter-input">
    
    <label for="bPriceFilter">Business-class Price:</label>
    <input type="number" id="bpriceFilter" class="filter-input">
    
    <label for="fFilter">First-class Price:</label>
    <input type="number" id="fpriceFilter" class="filter-input">

    <label for="takeoffFilter">Take-off Date:</label>
    <input type="date" id="takeoffFilter" class="filter-input">

    <label for="landingFilter">Landing Date:</label>
    <input type="date" id="landingFilter" class="filter-input">

    <label for="airlineFilter">Airline:</label>
    <input type="text" id="airlineFilter" class="filter-input">
    
    <input type="button" id="filterButton" value="Enter" />
    
</div>
<br>
<h2> click any column of the first row to sort table in ascending or descending order</h2>
<table id="flightTable" data-sort-column="" data-sort-order="">
	<thead>
		<tr>
			<th onclick = "sortTable(0,'string')"> Airline </th>
			<th onclick = "sortTable(1,'numeric')"> EconomyPrice </th>
			<th onclick = "sortTable(2,'numeric')"> BusinessPrice </th>
			<th onclick = "sortTable(3,'numeric')"> FirstPrice </th>
			<th> Take-off Port </th>
			<th onclick = "sortTable(5,'date')"> Take-off Date </th>
			<th> Landing Port </th>
			<th onclick = "sortTable(7,'date')"> Landing Date </th>
			<th onclick = "sortTable(8,'numeric')"> Duration of Flight </th>
		</tr>
	</thead>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		String newBar = request.getParameter("ticketType");

		String depDate = request.getParameter("depDate");

		String destDate = request.getParameter("destDate");
		
		String flex = request.getParameter("flex");
		int realFlex = Integer.parseInt(flex);
		

		//Make an insert statement for the Sells table:
		String insert = "SELECT f.* FROM Flights f WHERE f.ticketType=? AND Date(f.depDate)=? AND f.destDate BETWEEN '" + destDate + "' AND '" + destDate + "' + INTERVAL " + realFlex + " DAY";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newBar);
		ps.setString(2, depDate);
		//Run the query against the DB
		ResultSet result = ps.executeQuery();
		
		//If anything's been returned then there's a pair existing for the login so it should log in
		
		out.println("<tbody>");
		
		while(result.next()) {
			String type = result.getString("ticketType");
			
			String airLine = result.getString("lid");
			
			String ePrice = result.getString("economyPrice");
			String bPrice = result.getString("businessPrice");
			String fPrice = result.getString("firstPrice");
			
    		String depPort = result.getString("depPort");
    		//String depDate1 = result.getString("depDate");
    		Timestamp depTimestamp = result.getTimestamp("depDate");
			String depDate1 = depTimestamp != null ? depTimestamp.toString() : null;
    		String destPort = result.getString("destPort");
    		String destDate1 = result.getString("destDate");
    		
    		String duration = result.getString("duration");
    		
    		out.println("<tr>");
    		
    		out.println("<td>" + airLine + "</td>");
 			
    		out.println("<td>" + ePrice + "</td>");
    		out.println("<td>" + bPrice + "</td>");
    		out.println("<td>" + fPrice + "</td>");
    		
    		out.println("<td>" + depPort + "</td>");
    		out.println("<td>" + depDate1 + "</td>");
    		out.println("<td>" + destPort + "</td>");
    		out.println("<td>" + destDate1 + "</td>");
    		
    		out.println("<td>" + duration + "</td>");
    		
    		out.println("</tr>");
		}
		out.println("</tbody>");
		
		%>
			</table>
			<form method="post" action="HelloWorld.jsp">
				<input type="submit" value="log out" />
			</form>
			<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
			<script type="text/javascript" src = "sortFlights.js"></script>	
		<%


		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	} catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>
