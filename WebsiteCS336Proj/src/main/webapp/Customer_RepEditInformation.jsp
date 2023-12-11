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
<h1>Edit Customer Representative Information</h1>

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
		

		//Make an insert statement for Login:
		String select = "SELECT * FROM CustReps WHERE rid = ?";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(select);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, rID);
		
		//Run the query against the DB		
		ResultSet result = ps.executeQuery();
		
		//Check if user exists before editing
		if(result.next()) {
			out.print("Editing Information for: " + rID);
			%>
			<form method="post" action="Customer_RepEditInformationOperation.jsp">
    <table>
        <tr>
            <td>Name:</td><td><input type="text" name="name"></td>
            <td><input type="submit" value="Enter"></td>
        </tr>
    </table>
        <input type="hidden" name="rid" value="<%= rID %>">
</form>

<form method="post" action="Customer_RepEditInformationOperation.jsp">
    <table>
        <tr>
            <td>DOB:</td><td><input type="text" name="dob"></td>
            <td><input type="submit" value="Enter"></td>
        </tr>
    </table>
            <input type="hidden" name="rid" value="<%= rID %>">
</form>

<form method="post" action="Customer_RepEditInformationOperation.jsp">
    <table>
        <tr>    
            <td>Username:</td><td><input type="text" name="use"></td>
            <td><input type="submit" value="Enter"></td>
        </tr>
    </table>
    <input type="hidden" name="rid" value="<%= rID %>">
</form>

<form method="post" action="Customer_RepEditInformationOperation.jsp">
    <table>
        <tr>
            <td>Password:</td><td><input type="text" name="pass"></td>
            <td><input type="submit" value="Enter"></td>
        </tr>
    </table>
    <input type="hidden" name="rid" value="<%= rID %>">
</form>
	
			<% 		
		}
		else{
			out.print("Customer Representative with the RID: " + rID +" does not exist!" );
		}

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>

</html>
