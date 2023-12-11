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
<h1>Edit Flights Information</h1>

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
		String lid = request.getParameter("lid");
		//String hi = request.getParameter("hi");

		

		//Make an insert statement for Login:
		String select = "SELECT * FROM flights WHERE fNumber = ? AND lid=?";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(select);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, fNum);
		ps.setString(2, lid);
		
		//Run the query against the DB		
		ResultSet result = ps.executeQuery();
		
		//Check if user exists before editing
		
		
		if(result.next()) {
			out.print("Editing Information for: " + fNum + " " + lid);
			%>
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>CNUM:</td><td><input type="number" name="cNumber"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>Departing Port:</td><td><input type="text" name="depPort"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>Departing Date:</td><td><input type="datetime-local" name="depDate"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>Destination Port:</td><td><input type="text" name="destPort"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>Destination Date:</td><td><input type="date" name="destDate"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>Duration (# hours):</td><td><input type="number" name="dur"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>Days:</td><td><input type="text" name="days"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>Waiting List Size:</td><td><input type="number" name="waitingList"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td><input type="radio" name="ticketType" value="One-Way">
 							<label for="One-Way"> One-Way Trip</label></td>
 						</tr>
 				
 						<tr>
  							<td><input type="radio" name="ticketType" value="Round-Trip">
 							<label for="Round-Trip"> Round Trip</label></td>
 							<td><input type="submit" value="Enter"></td>
 						</tr>
				    </table>
				</form>
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
							<td><input type="radio" name="flightType" value="Domestic">
		 					<label for="Domestic"> Domestic Flight</label></td>
		 				</tr>
		 				
		 				<tr>
		  					<td><input type="radio" name="flightType" value="International">
		 					<label for="International"> International Flight</label></td>
		 					<td><input type="submit" value="Enter"></td>
		 				</tr>
				    </table>
				</form>
				
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>Economy Seat Price:</td><td><input type="number" name="economyPrice"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>Business Seat Price:</td><td><input type="number" name="businessPrice"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				<form method="post" action="FlightsEditInformationOperation.jsp?fNumber=<%=fNum%>&lid=<%=lid%>">
				    <table>
				        <tr>
				            <td>First Seat Price:</td><td><input type="number" name="firstPrice"></td>
				            <td><input type="submit" value="Enter"></td>
				        </tr>
				    </table>
				</form>
				
				
			<% 		
		}
		else{
			out.print("Flight with the FNUM/LID pair: " + fNum +" " + lid +" does not exist!" );
		}

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print(" --:Flights does not exist)");
	}
%>

</html>
