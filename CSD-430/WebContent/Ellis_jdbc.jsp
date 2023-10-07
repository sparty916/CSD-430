<%-- Pj Ellis - Module 6 - 6/22/2023 - Database Connecting --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	#assignment{margin:10pt;}
	#display{width: 600px; margin:50pt;border:1px solid black;padding:20px;}
	h1{color: blue; font-size:40pt;}
	table{background-color:grey;}
	tr{background-color:white;}
	th{padding:5pt;color:white; font-style:bold;background-color: black;}
</style>

<title>Module 6 - JDBC test</title>
</head>
<body>
	<% //Connects to database 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "DANcer5627!");
	Statement stmt = conn.createStatement(); //Create an empty statement to query the database
	ResultSet rs = stmt.executeQuery("select * from books"); //Execute the query to list all books and store the results as a local variable
	%>
	<div id="assignment">
		<h1>Module 6</h1>
		<h3>Displaying contents of database 'shop' in a formated table</h3>
		<div id="display">
			<table border="1">
				<% 
					ResultSetMetaData resMetaData = rs.getMetaData(); //Obtain info on the structure of result set
				int nCols = resMetaData.getColumnCount(); //Obtain number of columns of the result set
				%>
				<tr>
					<% //Display the column names
						for (int kCol = 1; kCol <= nCols; kCol++) {
						out.print("<th>" + resMetaData.getColumnName(kCol) + "</th>");
					}
					%>
				</tr>
				<% //List the books one per row
					while (rs.next()) {
				%><tr>
					<%
						for (int kCol = 1; kCol <= nCols; kCol++) {
						out.print("<td>" + rs.getString(kCol) + "</td>");
					}
					%>
				</tr>
				<%
					}
				%>
			</table>
		</div>		
	</div>
	<div>
	<br/>
	<a href="index.jsp">Back to Landing Page</a>
	</div>
	<% //Close the connection
	conn.close();
	%>
</body>
</html>