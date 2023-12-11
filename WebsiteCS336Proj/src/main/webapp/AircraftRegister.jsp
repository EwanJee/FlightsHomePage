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
		String cNum = request.getParameter("cNumber");
		String pid = request.getParameter("pid");
		String lID = request.getParameter("lid");
		String econ = request.getParameter("economySeat");
		String bus = request.getParameter("businessSeat");
		String first = request.getParameter("firstSeat");
		String name = request.getParameter("name");
		
		String selectLid = "SELECT * FROM airline WHERE lid = ?";
		PreparedStatement psLID = con.prepareStatement(selectLid);
		psLID.setString(1, lID);
		ResultSet resultLid = psLID.executeQuery();
		
		String selectPid = "SELECT * FROM airporthas WHERE pid = ?";
		PreparedStatement fu = con.prepareStatement(selectPid);
		fu.setString(1, pid);
		ResultSet resultPid = fu.executeQuery();
		
		//Check if LID and PID exists before adding
		if(resultLid.next() && resultPid.next()) {	
			
			String selectCraft = "SELECT * FROM aircraftoperates WHERE cNumber = ?";
			PreparedStatement ps2 = con.prepareStatement(selectCraft);
			ps2.setString(1, cNum);
			ResultSet resultCraft = ps2.executeQuery();
			
			//check that the craft doesn't already exist
			if(!resultCraft.next()) {
			
				//Make an insert statement for Airline:
				String insertAircraft = "INSERT INTO aircraftoperates VALUES (?,?,?,?,?,?,?)";
				
				PreparedStatement ps3 = con.prepareStatement(insertAircraft);
				
				ps3.setString(1, cNum);
				ps3.setString(2, pid);
				ps3.setString(3, lID);
				ps3.setString(4, econ);
				ps3.setString(5, bus);
				ps3.setString(6, first);
				ps3.setString(7, name);
				
				ps3.executeUpdate();
	
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				out.print("Aircraft was created with CNUM: " + cNum +", PID: " + pid + ", LID: " + lID + ", econSeat: " + econ + ", businessSeat: " + bus + ", firstSeat: " + first + ", Name: " + name);
			}
			else{
				out.print("Aircraft: " + cNum + " already exists!");
			}
			
		}
		else{
			out.print("Airline with the LID: " + lID +" or airport with PID: " + pid +" does not exist!" );
		}
		con.close();

	} catch (Exception ex) {
		out.print(ex);
	}
%>

</html>
