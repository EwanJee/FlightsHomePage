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
<h1>Edit Airport Information</h1>

<body>



	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		String pid = request.getParameter("pid");
		//String hi = request.getParameter("hi");

		

		//Make an insert statement for Login:
		String select = "SELECT * FROM airporthas WHERE pid = ?";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(select);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, pid);
		
		//Run the query against the DB		
		ResultSet result = ps.executeQuery();
		
		//Check if user exists before editing
		
		
		if(result.next()) {
			out.print("Editing Information for: " + pid);
			%>
				<form method="post" action="AirportEditInformationOperation.jsp?pid=<%=pid%>">
				    <table>
				        <tr>
				            <td>LID:</td><td><input type="text" name="lid"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="AirportEditInformationOperation.jsp?pid=<%=pid%>">
				    <table>
				        <tr>
				            <td>Name:</td><td><input type="text" name="name"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="AirportEditInformationOperation.jsp?pid=<%=pid%>">
				    <table>
				        <tr>
				            <td>Location:</td><td><input type="text" name="location"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
			<% 		
		}
		else{
			out.print("Airport with the PID: " + pid +" does not exist!" );
		}

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print(" --:Aircraft does not exist)");
	}
%>

</html>
