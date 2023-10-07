<!-- Pj Ellis - CSD430/Module 02 - 6/1/2023 -->
<!-- Using Eclipse, create a JSP file, starting with the "Hello World" example in our text. 
Add several items expanding on this example having a minimum of 3 scriplet sections in your code. -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ellis Module 2</title>
</head>
<body>
<h1>Hello World!</h1>

<% out.print("<h2>Welcome To Pj's Test Page</h2>"); %>

<%
String userAgent = request.getHeader("user-agent");
out.println("<br/>User-agent: " + userAgent + "<br/>");
%>

<p>Current Day, Date and Time: <%= new java.util.Date() %></p>

<h4>Math Equations:</h4>

<% 
int var1 = 10;
int var2 = 23;
out.println("var1 = " + var1 + "<br/>");
out.println("var2 = " + var2 + "<br/>");
out.println("var1 + var2 = " + (var1 + var2) + "<br/>");
%>

<%!   
int cube(int n){
	return n * n * n;
	}
%>

<%=
"Cube of " + var1 + " is: "+ cube(var1) + "<br/>" + "Cube of " + var2 + " is: "+ cube(var2) + "<br/>"
%>

</body>
</html>