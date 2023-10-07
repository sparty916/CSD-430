<%-- Pj Ellis - Module 11 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	#assignment{margin:10pt;}
	h1{color: blue; font-size:40pt;}
	h3{color: black; font-size:20pt;}
	table{background-color:grey;}
	tr{background-color:white;}
	th{padding:5pt;color:white; font-style:bold;background-color: black;}
</style>

<title>Module 11</title>
</head>
<body>

<%@ taglib uri="/WEB-INF/tld/ellistag.tld" prefix="db" %>

<div class="assignment">
	<h1>Module 11</h1>
	<h3>Display the UserInfo Database and Add A New Entry</h3>

	
	<%
	if(request.getMethod().equals("POST")){
		out.println("<h2>Updated Display</h2>");
    %>

    <% //getting user input in order to add to custom tag
    String email = request.getParameter("Email");
    String first = request.getParameter("First_Name");
    String last = request.getParameter("Last_Name");
    String phone = request.getParameter("Phone");
    String age = request.getParameter("Age");
    String eye = request.getParameter("Eye_Color");
    String hair = request.getParameter("Hair_Color");
    String food = request.getParameter("Fav_Food");    
    %>
    
    <%-- Custom Tag to add user input into table --%>
    <db:addUser userEmail="<%= email %>" firstName="<%= first %>" lastName="<%= last %>"
    userPhone="<%= phone %>" userAge="<%= age %>" userEye="<%= eye %>"
    userHair="<%= hair %>" userFavFood="<%= food %>" /> 
	
	<%-- Custom Tag to display table --%>
	<db:display />
            
    <h3>Add Another User</h3>

    <%-- Form to get information to be added to table --%>
    <form method='post' action='addUserInfo.jsp'>
    Email: <input type='text' name='Email' size='50' maxlength='50'><br>
    First Name: <input type='text' name='First_Name' size='20' maxlength='20'><br>
    Last Name: <input type='text' name='Last_Name' size='20' maxlength='20'><br>
    Phone Number: <input type='text' name='Phone' size='15' maxlength='15'><br>
    Age: <input type='text' name='Age' size='5' maxlength='5'><br>
    Eye Color: <input type='text' name='Eye_Color' size='10' maxlength='10'><br>
    Hair Color: <input type='text' name='Hair_Color' size='10' maxlength='10'><br>
    Favorite Food: <input type='text' name='Fav_Food' size='20' maxlength='20'><br>
    <input type='submit' />
    </form>
	<%
	}
	%>

	<%
	if(request.getMethod().equals("GET")){
	%>
	
	<%-- Custom Tag to display table --%>
	<db:display />
            
    <h3>Add Another User</h3>

    <%-- Form to get information to be added to table --%>
    <form method='post' action='addUserInfo.jsp'>
    Email: <input type='text' name='Email' size='50' maxlength='50'><br>
    First Name: <input type='text' name='First_Name' size='20' maxlength='20'><br>
    Last Name: <input type='text' name='Last_Name' size='20' maxlength='20'><br>
    Phone Number: <input type='text' name='Phone' size='15' maxlength='15'><br>
    Age: <input type='text' name='Age' size='5' maxlength='5'><br>
    Eye Color: <input type='text' name='Eye_Color' size='10' maxlength='10'><br>
    Hair Color: <input type='text' name='Hair_Color' size='10' maxlength='10'><br>
    Favorite Food: <input type='text' name='Fav_Food' size='20' maxlength='20'><br>
    <input type='submit' />
    </form>
    
	<%
	}
	%>
	
</div>
</body>
</html>