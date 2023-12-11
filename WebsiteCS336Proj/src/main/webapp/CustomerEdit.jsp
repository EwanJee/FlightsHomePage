<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Hi Airplane World</title>
	</head>
		<h1>Customer Add/Edit</h1>
		<p>Add Customer</p>
		<p></p>
	<body>
	
		<form method="post" action="CustomerRegister.jsp">
			<table>

				<tr>
					<td>CID:</td><td><input type="text" name="cid"></td>
				</tr>
				<tr>
					<td>Name:</td><td><input type="text" name="name"></td>
				</tr>	
				<tr>
					<td>DOB:</td><td><input type="text" name="dob"></td>
				</tr>
				<tr>    
					<td>Username:</td><td><input type="text" name="use"></td>
				</tr>
				<tr>
					<td>Password:</td><td><input type="text" name="pass"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
			<p>Delete Customer</p>
		<p></p>
	<body>
	
		<form method="post" action="CustomerDelete.jsp">
			<table>

				<tr>
					<td>CID:</td><td><input type="text" name="cid"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
	
	<p>Edit Customer Information</p>
		<p></p>
	<body>
	
		<form method="post" action="CustomerEditInformation.jsp">
			<table>

				<tr>
					<td>CID:</td><td><input type="text" name="cid"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
	<br>
		
</head>


<body>

</body>

</html>