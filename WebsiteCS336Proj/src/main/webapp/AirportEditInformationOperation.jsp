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

		String pid = request.getParameter("pid");
		out.println("Editing Information for: " + pid +"...");
		
		// Most the below values will be null, only one will be changed, cause only one form at a time.
		String lid = request.getParameter("lid");
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		
		if(lid != null){
			String selectLid = "SELECT * FROM airline WHERE lid = ?";
			PreparedStatement psLID = con.prepareStatement(selectLid);
			psLID.setString(1, lid);
			ResultSet resultLid = psLID.executeQuery();
			
			//Check if LID exists before adding
				if(resultLid.next()) {
				String update = "UPDATE airporthas SET lid =? WHERE pid =?";
				PreparedStatement ps = con.prepareStatement(update);
				
				ps.setString(1, lid);
				ps.setString(2, pid);
				
				ps.executeUpdate();
				
				out.println("LID changed to: " + lid);
				}
				else{
					out.print("Airline with the LID: " + lid +" does not exist!" );
				}
		}
		if(name != null){
			String update = "UPDATE airporthas SET name =? WHERE pid =?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, name);
			ps.setString(2, pid);
			
			ps.executeUpdate();
			
			out.println("Name changed to: " + name);
		}
		if(location != null){
			String update = "UPDATE airporthas SET location =? WHERE pid =?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, location);
			ps.setString(2, pid);
			
			ps.executeUpdate();
			
			out.println("Location changed to: " + location);
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>

</html>
