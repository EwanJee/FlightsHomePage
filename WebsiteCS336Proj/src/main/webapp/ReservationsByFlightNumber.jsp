<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			String fNumber = request.getParameter("fnumber");
			
			Statement stmt = con.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String select = "SELECT * FROM f_Tickets WHERE fNumber = ?;";

			PreparedStatement ps = con.prepareStatement(select);
			
			ps.setString(1, fNumber);
			
			ResultSet result = ps.executeQuery();

			
			//Make an HTML table to show the results in:
		if(result.next()) {
%>
		<table border="1">
        <tr>
            <th>Ticket</th>
            <th>Flight</th>
            <th>CID</th>
            <th>Name</th>
            <th>Seat Number</th>
            <th>Class</th>
            <th>Fare</th>
            <th>Purchase Date</th>
            <th>Booking Fee</th>
            
        </tr>
    
    <% 
    
    out.println("<tr>");
	
	out.println("<td>" + result.getString(1) + "</td>");
	out.println("<td>" + result.getString(2) + "</td>");
	out.println("<td>" + result.getString(3) + "</td>");
	out.println("<td>" + result.getString(4) + "</td>");
	out.println("<td>" + result.getString(5) + "</td>");
	out.println("<td>" + result.getString(6) + "</td>");
	out.println("<td>" + result.getString(7) + "</td>");
	out.println("<td>" + result.getString(8) + "</td>");
	out.println("<td>" + result.getString(9) + "</td>");
    
    		while(result.next()) {
			String ticket = result.getString(1);
			String flight = result.getString(2);
			String cID = result.getString(3);
			String name = result.getString(4);
			String seatNumber = result.getString(5);
    		String classType = result.getString(6);
    		String fare = result.getString(7);
    		String purchaseDate = result.getString(8);
    		String bookingFee = result.getString(9);

    		
    		out.println("<tr>");
    		
    		out.println("<td>" + ticket + "</td>");
    		out.println("<td>" + flight + "</td>");
    		out.println("<td>" + cID + "</td>");
    		out.println("<td>" + name + "</td>");
    		out.println("<td>" + seatNumber + "</td>");
    		out.println("<td>" + classType + "</td>");
    		out.println("<td>" + fare + "</td>");
    		out.println("<td>" + purchaseDate + "</td>");
    		out.println("<td>" + bookingFee + "</td>");
    		
    		out.println("</tr>");
		}
		out.println("</tbody>");
		out.println("</table>");
		}


		else{
	out.print("Flight with Flight Number: " + fNumber +" does not exist!" );
}
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
</body>
</html>
