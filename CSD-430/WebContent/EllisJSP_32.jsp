<!--  Pj Ellis - CSD-420 - Module 3 - Assignment 3.2 - 6/11/2023 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style type="text/css">
	#container{margin:10pt;}
	#assignment{width: 350px; margin:50pt;border:1px solid black;padding:20px;}
	h1{color: blue; font-size:40pt;}
	h3{color: green; font-size:20pt;}
</style>

<title>Module 3 Assignment 3.2</title>
</head>
<body>
<div id="container">
	<h1>Module 3 Assignment 3.2</h1>
	<p>Create a JSP that declares and initializes
	a String array. Use a for-each loop to display the array.</p>
	<div id="assignment">
	<h3>My String Array</h3>
	String[] myStrings = {"Hello", "Java", "JSP", "HTML", "Tomcat", "Eclipse", "MySQL", "Bellevue"};
	<h3>For Loop Displaying Array</h3>
	<%
	  String[] myStrings = {"Hello", "Java", "JSP", "HTML", "Tomcat", "Eclipse", "MySQL", "Bellevue"};
   
	  for (int i = 0; i < myStrings.length; i++) {
        out.print(myStrings[i] + "</br>");
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