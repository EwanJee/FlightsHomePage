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

		String fNum = request.getParameter("fNumber");
		String lid = request.getParameter("lid");
		out.println("Editing Information for: " + fNum +" " + lid + "...");
		
		// Most the below values will be null, only one will be changed, cause only one form at a time.
		
		String cNum = request.getParameter("cNumber");		
		String depPort = request.getParameter("depPort");
		String depDate = request.getParameter("depDate");
		String destPort = request.getParameter("destPort");
		String destDate = request.getParameter("destDate");
		String dur = request.getParameter("duration");
		//String dur2 = (String)dur + " hours";
		String days = request.getParameter("days");
		String wList = request.getParameter("waitingList");
		String tType = request.getParameter("ticketType");
		String fType = request.getParameter("flightType");
		String econ = request.getParameter("economyPrice");
		String bus = request.getParameter("businessPrice");
		String first = request.getParameter("firstPrice");
		
		if(cNum != null){
			String selectLid = "SELECT * FROM aircraftoperates WHERE cNumber = ?";
			PreparedStatement psLID = con.prepareStatement(selectLid);
			psLID.setString(1, cNum);
			ResultSet resultLid = psLID.executeQuery();
			
			//Check if LID exists before adding
				if(resultLid.next()) {
				String update = "UPDATE flights SET cNumber =? WHERE fNumber =? AND lid=?";
				PreparedStatement ps = con.prepareStatement(update);
				
				ps.setString(1, cNum);
				ps.setString(2, fNum);
				ps.setString(3, lid);
				
				ps.executeUpdate();
				
				out.println("CNUM changed to: " + cNum);
				}
				else{
					out.print("Aircraft with the CNUM: " + cNum +" does not exist!" );
				}
		}
		if(depPort != null){
			String selectLid = "SELECT * FROM airporthas WHERE pid = ?";
			PreparedStatement psLID = con.prepareStatement(selectLid);
			psLID.setString(1, depPort);
			ResultSet resultLid = psLID.executeQuery();
			
			//Check if LID exists before adding
				if(resultLid.next()) {
				String update = "UPDATE flights SET depPort =? WHERE fNumber =? AND lid=?";
				PreparedStatement ps = con.prepareStatement(update);
				
				ps.setString(1, depPort);
				ps.setString(2, fNum);
				ps.setString(3, lid);
				
				ps.executeUpdate();
				
				out.println("depPort changed to: " + depPort);
				}
				else{
					out.print("Airport with the PID: " + depPort +" does not exist!" );
				}
		}
		if(destPort != null){
			String selectLid = "SELECT * FROM airporthas WHERE pid = ?";
			PreparedStatement psLID = con.prepareStatement(selectLid);
			psLID.setString(1, destPort);
			ResultSet resultLid = psLID.executeQuery();
			
			//Check if LID exists before adding
				if(resultLid.next()) {
				String update = "UPDATE flights SET destPort =? WHERE fNumber =? AND lid=?";
				PreparedStatement ps = con.prepareStatement(update);
				
				ps.setString(1, destPort);
				ps.setString(2, fNum);
				ps.setString(3, lid);
				
				ps.executeUpdate();
				
				out.println("depPort changed to: " + depPort);
				}
				else{
					out.print("Airport with the PID: " + depPort +" does not exist!" );
				}
		}
		if(depDate != null){
			String update = "UPDATE flights SET depDate =? WHERE fNumber =? AND lid=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, depDate);
			ps.setString(2, fNum);
			ps.setString(3, lid);
			
			ps.executeUpdate();
			
			out.println("Departure Date changed to: " + depDate);
		}
		if(destDate != null){
			String update = "UPDATE flights SET destDate =? WHERE fNumber =? AND lid=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, destDate);
			ps.setString(2, fNum);
			ps.setString(3, lid);
			
			ps.executeUpdate();
			
			out.println("Destination Date changed to: " + destDate);
		}
		if(dur != null){
			String dur2 = (String)dur + " hours";
			String update = "UPDATE flights SET duration =? WHERE fNumber =? AND lid=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, dur2);
			ps.setString(2, fNum);
			ps.setString(3, lid);
			
			ps.executeUpdate();
			
			out.println("Duration changed to: " + dur2);
		}
		if(days != null){
			String update = "UPDATE flights SET days =? WHERE fNumber =? AND lid=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, days);
			ps.setString(2, fNum);
			ps.setString(3, lid);
			
			ps.executeUpdate();
			
			out.println("Days changed to: " + days);
		}	
		if(wList != null){
			String update = "UPDATE flights SET waitingList =? WHERE fNumber =? AND lid=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, wList);
			ps.setString(2, fNum);
			ps.setString(3, lid);
			
			ps.executeUpdate();
			
			out.println("Waiting List changed to: " + wList);
		}	
		if(tType != null){
			String update = "UPDATE flights SET ticketType =? WHERE fNumber =? AND lid=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, tType);
			ps.setString(2, fNum);
			ps.setString(3, lid);
			
			ps.executeUpdate();
			
			out.println("Ticket Type changed to: " + tType);
		}
		if(fType != null){
			String update = "UPDATE flights SET flightType =? WHERE fNumber =? AND lid=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, fType);
			ps.setString(2, fNum);
			ps.setString(3, lid);
			
			ps.executeUpdate();
			
			out.println("Flight Type changed to: " + fType);
		}
		if(econ != null){
			String update = "UPDATE flights SET economyPrice =? WHERE fNumber =? AND lid=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, econ);
			ps.setString(2, fNum);
			ps.setString(3, lid);
			
			ps.executeUpdate();
			
			out.println("Economy Ticket Price changed to: " + econ);
		}
		if(bus != null){
			String update = "UPDATE flights SET businessPrice =? WHERE fNumber =? AND lid=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, bus);
			ps.setString(2, fNum);
			ps.setString(3, lid);
			
			ps.executeUpdate();
			
			out.println("Business Ticket Price changed to: " + bus);
		}
		if(first != null){
			String update = "UPDATE flights SET firstPrice =? WHERE fNumber =? AND lid=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setString(1, first);
			ps.setString(2, fNum);
			ps.setString(3, lid);
			
			ps.executeUpdate();
			
			out.println("First Ticket Price changed to: " + first);
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>

</html>
