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
		String rID = request.getParameter("rid");
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String newUser = request.getParameter("use");
		String newPass = request.getParameter("pass");
		
		String selectRid = "SELECT * FROM CustReps WHERE rid = ?";
		PreparedStatement psRID = con.prepareStatement(selectRid);
		psRID.setString(1, rID);
		ResultSet resultRid = psRID.executeQuery();
		
		//Check if CID exists before adding
		if(!resultRid.next()) {
			String selectUser = "SELECT * FROM Login WHERE username = ?";
			PreparedStatement psUser = con.prepareStatement(selectUser);
			psUser.setString(1, newUser);
			ResultSet resultUser = psUser.executeQuery();
			
			//Check if user exists before adding
			if(!resultUser.next()){
					//Make an insert statement for Login:
					String insertLogin = "INSERT INTO `Login` VALUES (?,?,?,'Customer_Rep')";
									
					PreparedStatement ps2 = con.prepareStatement(insertLogin);

					ps2.setString(1, rID);
					ps2.setString(2, newUser);
					ps2.setString(3, newPass);
					
					ps2.executeUpdate();
					
					//Make an insert statement for Customers:
					String insertCustomerRep = "INSERT INTO `CustReps` VALUES (?,?,?)";
					
					PreparedStatement ps3 = con.prepareStatement(insertCustomerRep);
					
					ps3.setString(1, rID);
					ps3.setString(2, name);
					ps3.setString(3, dob);
					
					ps3.executeUpdate();

					//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
					out.print("Customer Representative was created with RID: " + rID +", Name: " + name + ", DOB: " + dob +", Username: " + newUser +", and Password: " + newPass );
						}
			else{
				out.print("Customer Representative with the username: " + newUser +" already exists!" );
			}
				}
		else{
			out.print("Customer Representative with the RID: " + rID +" already exists!" );
		}
		con.close();

	} catch (Exception ex) {
		out.print(ex);
	}
%>

</html>
