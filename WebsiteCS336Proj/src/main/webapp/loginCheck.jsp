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
		String newUser = request.getParameter("use");
		String newPass = request.getParameter("pass");
		

		//Make an insert statement for the Sells table:
		String insert = "SELECT username, password, userType, id FROM login WHERE username=? AND password=?";
						
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newUser);
		ps.setString(2, newPass);
		
		//Run the query against the DB
		ResultSet result = ps.executeQuery();
		
		//If anything's been returned then there's a pair existing for the login so it should log in
		if(result.next()) {

		String id = result.getString(4);
	
		
		if(result.getString(3).equals("Admin")){	

			String redirectURL = "Admin.jsp?aid="+id;
		   	response.sendRedirect(redirectURL);
			
		}
		else if(result.getString(3).equals("Customer_Rep")){		
			
			
			String redirectURL = "Customer_Rep.jsp?rid="+id;
		    response.sendRedirect(redirectURL);

		}
		else if(result.getString(3).equals("Customer")){		
			
			
			String redirectURL = "Customer.jsp?cid="+id;
		    response.sendRedirect(redirectURL);

		}

		}
		else {
			out.print("whoops, try again");
		}


		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	} catch (Exception ex) {
		out.print(ex);
		out.print(". Login failed :()");
	}
%>

<h2>Are you looking for a flight?</h2>
<br>
		<form method="post" action="Flights.jsp">
			<fieldset>
			<legend>Select your preferred ticket type</legend>
			<div>	
				<input type='radio' name="ticketType" value="One-Way">
  				<label for="One-Way"> One-Way Trip</label>

  				<input type="radio" name="ticketType" value="Round-Trip">
  				<label for="Round-Trip"> Round Trip</label>
			</div>
			</fieldset>
			<fieldset>
			<legend>Select your preferred depDate</legend>
			<div>
				<label for="depDate">Date :
				<input name ="depDate"
					type="date"
					id = "date"
					max = "2024-12-30"
					min = "2024-01-01"
					value="depDate"
				>
				</label>
			</div>
			</fieldset>
			<fieldset>
			<legend>Select flexible dates </legend>
			<div>
			<label for="flex">Choose a flex:</label>
			<select id = "flex" name="flex">
				<option value="">--Please choose an option--</option>
				<option value='-1'>-1</option>
				<option value='-2'>-2</option>
				<option value='-3'>-3</option>
				<option value='0'>0</option>
				<option value='1'>1</option>
				<option value='2'>2</option>
				<option value='3'>3</option>
			</select>
			</div>
			</fieldset>
			<fieldset>
			<legend>Select your preferred destDate</legend>
			<div>
				<label for="destDate">Date :
				<input
					name="destDate"
					type="date"
					id = "date"
					max = "2024-12-30"
					min = "2024-01-01"
					value="destDate"
				>
				</label>
			</div>
			</fieldset>
			<br>
			<input type="submit" value="Search">
		</form>
	<br>
</body>
</html>
