<%-- Pj Ellis - Module 12 Redo of Module 8 - --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	#assignment{margin:10pt;}
	#display{width: 375px; margin:50pt;border:1px solid black;padding:20px;}
	h1{color: blue; font-size:40pt;}
	table{background-color:grey;}
	tr{background-color:white;}
	th{padding:5pt;color:white; font-style:bold;background-color: black;}
</style>

<title>Module 12 Redo of Module 8</title>
</head>
<body>

<%-- tag to usebean to handle methods --%>
<jsp:useBean id='myDB' scope="application" class='ellisMod8redoBean.nationalPark' />

<div class="assignment">

	<h1>Module 12 Redo of Module 8</h1>
	<h3>Add new entry to table and display new Table</h3>
	
	<%
	if(request.getMethod().equals("POST")){

	out.println("<h2>Updated Display</h2>");
	
	String dbName = application.getInitParameter("dbName");
	String dbUser = application.getInitParameter("dbUser");
	String dbPass = application.getInitParameter("dbPass");
	
	String parkName = request.getParameter("parkName");
	String parkStateAbbr = request.getParameter("parkStateAbbr");
	String parkYear = request.getParameter("parkYear");
	
	//useBean to add user input to table
	myDB.addPark(dbName, dbUser, dbPass, parkName, parkStateAbbr, parkYear);
	
	//useBean to get get results and assign to resultSet
	ResultSet resultSet = myDB.getResults(dbName, dbUser, dbPass, "SELECT * FROM parks");
	
	try{ //displaying the updated table
		ResultSetMetaData rsmd=resultSet.getMetaData();  
        int totalcols=rsmd.getColumnCount();
        out.println("<table border='1'>");
        out.write("<tr>");  
        for(int i=1;i<=totalcols;i++){  
            out.write("<th>"+rsmd.getColumnName(i)+"</th>");  
        }  
        out.write("</tr>");
        
        while(resultSet.next()){
            out.println("<tr>");
            
            for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                out.println("<td>");
                out.print((resultSet.getString(i)).trim());
                out.println("</td>");
            }
            
            out.println("</tr>");
        }
        
        out.println("</table>");
    }
    catch(Exception e){
        out.println("<b>Print of results failed.</b><br />");
    }
    
	//usebean to close connection
    myDB.closeConnection();
    %>
        
    <h2>Would you like to add another park?</h2>
    
    <%-- Form to get information to be added to table --%>
    <form method='post' action='addParks.jsp'>
    National Park: <input type='text' name='parkName' size='50' maxlength='50'><br>
    State: <input type='text' name='parkStateAbbr' size='2' maxlength='2'><br>
    Year Visited: <input type='text' name='parkYear' size='4' maxlength='4'><br>
    <input type='submit' />
    </form>    
    <%
    }
    %>
    
    <%
	if(request.getMethod().equals("GET")){
		
	out.println("<h2>Current Display</h2>");
	String dbName = application.getInitParameter("dbName");
	String dbUser = application.getInitParameter("dbUser");
	String dbPass = application.getInitParameter("dbPass");
	
	//useBean to get get results and assign to resultSet
	ResultSet resultSet = myDB.getResults(dbName, dbUser, dbPass, "SELECT * FROM parks");
	
	try{//displaying the table
		ResultSetMetaData rsmd=resultSet.getMetaData();  
        int totalcols=rsmd.getColumnCount();
        out.println("<table border='1'>");
        out.write("<tr>");  
        for(int i=1;i<=totalcols;i++){  
            out.write("<th>"+rsmd.getColumnName(i)+"</th>");  
        }  
        out.write("</tr>");
        
        while(resultSet.next()){
            out.println("<tr>");
            
            for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                out.println("<td>");
                out.print((resultSet.getString(i)).trim());
                out.println("</td>");
            }
            
            out.println("</tr>");
        }
        
        out.println("</table>");
    }
    catch(Exception e){
        out.println("<b>Print of results failed.</b><br />");
    }
    
	//usebean to close connection
    myDB.closeConnection();
    %>
            
    <h2>Add Another Park</h2>

    <%-- Form to get information to be added to table --%>
    <form method='post' action='addParks.jsp'>
    National Park: <input type='text' name='parkName' size='50' maxlength='50'><br>
    State: <input type='text' name='parkStateAbbr' size='2' maxlength='2'><br>
    Year Visited: <input type='text' name='parkYear' size='4' maxlength='4'><br>
    <input type='submit' />
    </form>
	<%
	}
	%>
</div>
</body>
</html>