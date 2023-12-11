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

		String cID = request.getParameter("cid");
		out.println("Editing Information for: " + cID +"...");
		
		// Most the below values will be null, only one will be changed, cause only one form at a time.
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String newUser = request.getParameter("use");
		String newPass = request.getParameter("pass");
		
		
		if(name != null){
		String update = "UPDATE Customers SET name =? WHERE cid =?";
		PreparedStatement ps = con.prepareStatement(update);
		
		ps.setString(1, name);
		ps.setString(2, cID);
		
		ps.executeUpdate();
		
		out.println("Name changed to: " + name);
		}
		
		if(dob != null){
		String update = "UPDATE Customers SET dob =? WHERE cid =?";
		PreparedStatement ps = con.prepareStatement(update);
		
		ps.setString(1, dob);
		ps.setString(2, cID);
		
		ps.executeUpdate();
		
		out.println("Date of Birth changed to: " + dob);
		}
		
		

		if(newUser != null){
			//Check if user exists before adding
			String selectUser = "SELECT * FROM Login WHERE username = ?;";
			PreparedStatement psUser = con.prepareStatement(selectUser);
			psUser.setString(1, newUser);
			ResultSet resultUser = psUser.executeQuery();
				if(resultUser.next()){
					out.print("User with the username: " + newUser +" already exists!" );
			}

				else{
		String update = "UPDATE Login SET username =? WHERE id =? and userType='Customer'";
		PreparedStatement ps = con.prepareStatement(update);
		
		ps.setString(1, newUser);
		ps.setString(2, cID);
		
		ps.executeUpdate();
		
		out.println("Username changed to: " + newUser);
				}
				}
		
		if(newPass != null){
		String update = "UPDATE Login SET password =? WHERE id =? and userType='Customer'";
		PreparedStatement ps = con.prepareStatement(update);
		
		ps.setString(1, newPass);
		ps.setString(2, cID);
		
		ps.executeUpdate();
		
		out.println("Pasword changed to: " + newPass);
		}

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>

</html>
