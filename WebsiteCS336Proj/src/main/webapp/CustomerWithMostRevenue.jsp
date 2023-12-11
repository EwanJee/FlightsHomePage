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
			
			Statement stmt = con.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String select = "SELECT CID, sum(fare + bookingFee) as TotalRevenue FROM f_Tickets Group By CID LIMIT 1;";

			PreparedStatement ps = con.prepareStatement(select);
			
			ResultSet result = ps.executeQuery();
			//Move Result to first row, so it produces values from result.getString, otherwise it wont.
			result.next();
			
			//Make an HTML table to show the results in:

%>
		<table border="1">
    <thead>
        <tr>
            <th>CID</th>
            <th>Total Revenue</th>
        </tr>
    </thead>
    <tbody>

        <tr>
            <td><%= result.getString(1)%></td>
            <td><%= result.getString(2)%></td>
        </tr>
    </tbody>
</table>
<% 
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
</body>
</html>
