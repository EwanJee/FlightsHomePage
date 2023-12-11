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
		String newBar = request.getParameter("use");
		String newBeer = request.getParameter("pass");
		

		//Make an insert statement for the Sells table:
		String insert = "SELECT username, password, userType FROM login WHERE username=? AND password=?";
						
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newBar);
		ps.setString(2, newBeer);
		
		//Run the query against the DB
		ResultSet result = ps.executeQuery();
		
		//If anything's been returned then there's a pair existing for the login so it should log in
		if(result.next()) {
		out.print(result.getString(1));
		out.print(" " + result.getString(2));
		out.print(" " + result.getString(3));
	
		
		if(result.getString(3).equals("Admin")){	
			
			String redirectURL = "Admin.jsp";
		    response.sendRedirect(redirectURL);
			
		}
		else if(result.getString(3).equals("Customer_Rep")){		
			
			String redirectURL = "Customer_Rep.jsp";
		    response.sendRedirect(redirectURL);

		}
		else if(result.getString(3).equals("Customer")){		
		
			String redirectURL = "Customer.jsp";
		    response.sendRedirect(redirectURL);

		}

		}
		else {
			out.print("whoops, try again");
			out.print(newBar + newBeer + ps);
		}

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	} catch (Exception ex) {
		out.print(ex);
		out.print(". Login failed :()");
	}
%>
</body>
</html>