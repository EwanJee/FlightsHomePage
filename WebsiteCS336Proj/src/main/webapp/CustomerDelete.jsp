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
</head>

<h1>Edit Customer Information</h1>

<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		String cID = request.getParameter("cid");	
		
		String select = "SELECT * FROM Customers WHERE cid = ?";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(select);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, cID);
		
		//Run the query against the DB		
		ResultSet result = ps.executeQuery();
		
		//Check if user exists before deleting
		if(result.next()) {
		
		//Make an insert statement for Login:
		String deleteCustomer = "DELETE FROM Customers WHERE cid=?";
		String deleteLogin = "DELETE FROM Login WHERE id=?";		
		
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps2 = con.prepareStatement(deleteCustomer);
		PreparedStatement ps3 = con.prepareStatement(deleteLogin);
		
		
		ps2.setString(1, cID);
		ps2.executeUpdate();
		
		ps3.setString(1, cID);
		ps3.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		out.print("Customer with the CID: " + cID +" was successfully deleted." );
		}
		else{
			out.print("Customer with the CID: " + cID +" does not exist!" );
		}
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>

</html>
