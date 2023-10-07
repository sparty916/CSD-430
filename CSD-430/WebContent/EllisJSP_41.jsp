<!--  Pj Ellis - CSD-420 - Module 4 - Assignment - 6/11/2023 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style type="text/css">
	#container{margin:10pt;}
	#assignment{width: 400px; margin:50pt;border:1px solid black;padding:20px;}
	h1{color: blue; font-size:40pt;}
	table{background-color:grey;}
	tr{background-color:white;}
	th{padding:5pt;color:white; font-size:20pt; font-style:bold;background-color: black;}
</style>

<title>Module 4 Assignment</title>
</head>
<body>
<div id="container">
	<h1>Module 4 Assignment</h1>
	Create a JSP that outputs the requested content, displaying all of
	 the information in a table format.
	<div id="assignment">
	<%
	if(request.getMethod().equals("GET")){
	%>
		<form method='post' action='EllisJSP_41.jsp'>
			Name:
			<input type='text' name='Name' maxlength='20'>
			<br />
    		<br />
    		Birthday:
    		<input type='text' name='birth' maxlength='20'>
    		<br/>
    		<br />
    		<label>
    		Preferred Programming Language:
    		</label>
    		<select name='language'>
    			<option value='None Selected'></option>
    			<option value='Python'>Python</option>
    			<option value='Java'>Java</option>
        		<option value='HTML'>HTML</option>
        		<option value='CSS'>CSS</option>
        		<option value='SQL'>SQL</option>
        		<option value='JavaScript'>JavaScript</option>
        		<option value='JSP'>JSP</option>
    		</select>
    		<br />
    		<br />
    		Favorite Sports Team:
    		<input type='text' name='sport' size='25'>
    		<br />
		    <br />
    		<label>
    		Favorite Color:
    		</label>
    		<br />
    		<label>
    		Red
    		<input name='favColor' type='radio' value='Red'>
    		</label>
    		<br />
    		<label>
    		Green
    		<input name='favColor' type='radio' value='Green'>
    		</label>
    		<br />
    		<label>
    		Blue
    		<input name='favColor' type='radio' value='Blue'>
    		</label>
    		<br />
    		<label>
    		Yellow
    		<input name='favColor' type='radio' value='Yellow'>
    		</label>
    		<br />
    		<label>
    		None of the Above
    		<input name='favColor' type='radio' value='None of the Above'>
    		</label>
    		<br />
    		<br />
    		<input type='hidden' name='hiddenDate' value='<%= new java.util.Date()%>'>
    		<input type='submit' value='Submit'>
    		<input type='reset' value='Clear Entries'>
		</form>
		<%
		}
		%>
		<%
		   String color = request.getParameter("favColor");
		%>
		<%
		   if(request.getMethod().equals("POST")) {
		%>
		<table border="1">
			<tr>
			<th>REQUESTED CONTENT</th><th>INPUT</th></tr>
			<tr><td>Name</td><td><%out.println(request.getParameter("Name"));%></td></tr>
			<tr><td>Birthday</td><td><%out.println(request.getParameter("birth"));%></td></tr>
			<tr><td>Preferred Programming Language</td><td><%out.println(request.getParameter("language"));%></td></tr>
			<tr><td>Favorite Sports Team</td><td><%out.println(request.getParameter("sport")); %></td></tr>
			<tr><td>Favorite Color</td><td><%out.println(request.getParameter("favColor")); %></td></tr>
			<tr><td>Date Submitted</td><td><%out.println(request.getParameter("hiddenDate")); %></td></tr>
		</table>
		<a href="EllisJSP_41.jsp">Try Again</a>
		<%
		}
		%>
	</div>
</div>
<div>
	<br/>
	<a href="index.jsp">Back to Landing Page</a>
</div>
</body>
</html>