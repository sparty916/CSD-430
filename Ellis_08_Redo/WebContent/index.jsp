<%-- Pj Ellis - Module 12 Redo of Module 8 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#assignment{margin:10pt;}
	#display{width: 250px; margin:50pt;border:1px solid black;padding:20px;}
	h1{color: blue; font-size:40pt;}
	table{background-color:grey;}
	tr{background-color:white;}
	th{padding:5pt;color:white; font-style:bold;background-color: black;}
</style>

<title>Module 12 Redo of Module 8</title>
</head>
<body>
	<div class="assignment">
	<h1>Module 12 Redo of Module 8</h1>
	<h3>Create Database Table and Insert Data</h3>
	
	<% //Connect to database and create table and insert data
	String dbName = application.getInitParameter("dbName");
	String dbUser = application.getInitParameter("dbUser");
	String dbPass = application.getInitParameter("dbPass");
	Connection conn = DriverManager.getConnection(dbName, dbUser, dbPass);
    Statement stmt = conn.createStatement();
    
    try{
		Class.forName("com.mysql.cj.jdbc.Driver");	
		conn = DriverManager.getConnection(dbName, dbUser, dbPass);
		stmt = conn.createStatement(); 
	}
	catch(Exception e){
        out.println("<p>Error connection to database.</p>");
    }
	
	try{                
        stmt.executeUpdate("DROP TABLE Parks");
        out.println("<p>Parks Dropped</p>");
    }
    catch(SQLException e){                
        out.println("<p>Table Parks does not exist</p>");
    }
    
    try{
        stmt.executeUpdate("CREATE TABLE Parks(parkName CHAR(50) NOT NULL PRIMARY KEY, parkStateAbbr CHAR(2) NOT NULL, parkYear CHAR(4) NOT NULL)");
        out.println("<p>Table Parks Created</p>");
    }
    catch(SQLException e){
        out.println("<p>Table Parks Creation failed</p>");
    }

	try{
        stmt.executeUpdate("INSERT INTO Parks(parkName, parkStateAbbr, parkYear)VALUES('Yosemite', 'CA', 1997)");
        stmt.executeUpdate("INSERT INTO Parks(parkName, parkStateAbbr, parkYear)VALUES('Sequoia', 'CA', 2015)");
        stmt.executeUpdate("INSERT INTO Parks(parkName, parkStateAbbr, parkYear)VALUES('Indiana Dunes', 'IN', 1995)");
        stmt.executeUpdate("INSERT INTO Parks(parkName, parkStateAbbr, parkYear)VALUES('Everglades', 'FL', 2023)");
        stmt.executeUpdate("INSERT INTO Parks(parkName, parkStateAbbr, parkYear)VALUES('Great Smokey Mountains', 'TN', 2016)");         
         
        stmt.executeUpdate("COMMIT");
         
        out.println("<p>Data Inserted</p>");
     }
     catch(SQLException e){
         out.println("<p>Error inserting data</p>");
     }     
     try{
        stmt.close();
        conn.close();
        out.println("<p>Database connections closed</p>");
     }
     catch(SQLException e){
         out.println("<p>Connection close failed</p>");
     }
     %>
</div>
<div>
	<br/>
	<a href="addParks.jsp">Add New Entry and Display the Parks Database</a>
	</div>	
</body>
</html>