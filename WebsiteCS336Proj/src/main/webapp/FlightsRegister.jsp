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
		String fNum = request.getParameter("fNumber");
		String cNum = request.getParameter("cNumber");
		String lID = request.getParameter("lid");
		String depPort = request.getParameter("depPort");
		String depDate = request.getParameter("depDate");
		String destPort = request.getParameter("destPort");
		String destDate = request.getParameter("destDate");
		String dur = request.getParameter("duration");
		String dur2 = (String)dur + " hours";
		String days = request.getParameter("days");
		String wList = request.getParameter("waitingList");
		String tType = request.getParameter("ticketType");
		String fType = request.getParameter("flightType");
		String econ = request.getParameter("economyPrice");
		String bus = request.getParameter("businessPrice");
		String first = request.getParameter("firstPrice");
		
		
		
		String selectLid = "SELECT * FROM airline WHERE lid = ?";
		PreparedStatement psLID = con.prepareStatement(selectLid);
		psLID.setString(1, lID);
		ResultSet resultLid = psLID.executeQuery();
		
		
		
		String selectPid = "SELECT * FROM aircraftoperates WHERE cNumber = ?";
		PreparedStatement fu = con.prepareStatement(selectPid);
		fu.setString(1, cNum);
		ResultSet resultPid = fu.executeQuery();
		
		
		
		String selectPort = "SELECT * FROM airporthas WHERE pid = ?";
		PreparedStatement ap1 = con.prepareStatement(selectPort);
		ap1.setString(1, depPort);
		ResultSet resultPort = ap1.executeQuery();
		
		
		
		String selectPort1 = "SELECT * FROM airporthas WHERE pid = ?";
		PreparedStatement ap2 = con.prepareStatement(selectPort1);
		ap2.setString(1, destPort);
		ResultSet resultPort1 = ap2.executeQuery();
		
		boolean a = resultLid.next();
		boolean b = resultPid.next(); 
		boolean c = resultPort.next();
		boolean d = resultPort1.next();
		
		//Check if LID and PID exists before adding
		if(((a && b) && c) && d) {	
			
			
			
			String selectCraft = "SELECT * FROM flights WHERE fNumber = ? AND lid = ?";
			
			
			
			PreparedStatement ps2 = con.prepareStatement(selectCraft);
			ps2.setString(1, fNum);
			ps2.setString(2, lID);
			ResultSet resultCraft = ps2.executeQuery();
			
			
			
			//check that the craft doesn't already exist
			if(!resultCraft.next()) {
			
				//Make an insert statement for Airline:
				String insertFlight = "INSERT INTO flights VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				
				PreparedStatement ps3 = con.prepareStatement(insertFlight);
				
				ps3.setString(1, fNum);
				ps3.setString(2, cNum);
				ps3.setString(3, lID);
				ps3.setString(4, depPort);
				ps3.setString(5, depDate);
				ps3.setString(6, destPort);
				ps3.setString(7, destDate);
				ps3.setString(8, dur2);
				ps3.setString(9, days);
				ps3.setString(10, wList);
				ps3.setString(11, tType);
				ps3.setString(12, fType);
				ps3.setString(13, econ);
				ps3.setString(14, bus);
				ps3.setString(15, first);
				
				ps3.executeUpdate();
	
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				out.print("Flight was created!"); //with CNUM: " + cNum +", PID: " + pid + ", LID: " + lID + ", econSeat: " + econ + ", businessSeat: " + bus + ", firstSeat: " + first + ", Name: " + name);
			}
			else{
				out.print("Flight already exists!");
			}
			
		}
		else{
			out.print("One of  the airline, the aircraft, and/or one of the ports does not exist!" );
			out.print(a);
			out.print(b);
			out.print(c);
			out.print(d);
			
		}
		con.close();

	} catch (Exception ex) {
		out.print(ex);
	}
%>

</html>
