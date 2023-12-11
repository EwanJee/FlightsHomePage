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
		String lid = request.getParameter("lid");
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		
		String selectLid = "SELECT * FROM airline WHERE lid = ?";
		PreparedStatement psLID = con.prepareStatement(selectLid);
		psLID.setString(1, lid);
		ResultSet resultLid = psLID.executeQuery();
		
		//Check if LID exists before adding
		if(resultLid.next()) {
			String selectCraft = "SELECT * FROM airporthas WHERE pid = ?";
			PreparedStatement ps2 = con.prepareStatement(selectCraft);
			ps2.setString(1, pid);
			ResultSet resultCraft = ps2.executeQuery();
			
			//check that the port doesn't already exist
			if(!resultCraft.next()) {
			
				//Make an insert statement for Airline:
				String insertAircraft = "INSERT INTO airporthas VALUES (?,?,?,?)";
				
				PreparedStatement ps3 = con.prepareStatement(insertAircraft);
				
				ps3.setString(1, pid);
				ps3.setString(2, lid);
				ps3.setString(3, name);
				ps3.setString(4, location);
				
				ps3.executeUpdate();
	
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				out.print("Airport was created with PID: " + pid +", LID: " + lid + ", Name: " + name +", location: " + location);
			}
			else{
				out.print("Airport: " + pid + " already exists!");
			}
			
		}
		else{
			out.print("Airline with the LID: " + lid +" does not exist!" );
		}
		con.close();

	} catch (Exception ex) {
		out.print(ex);
	}
%>

</html>
