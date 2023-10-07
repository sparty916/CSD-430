<!--  Pj Ellis - CSD-420 - Module 3 - Assignment 3.1 - 6/11/2023 -->

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

<title>Module 3 Assignment 3.1</title>
</head>
<body>
<div id="container">
	<h1>Module 3 Assignment 3.1</h1>
	<p>Create a JSP that declares and initializes an int array. Then, using loop 
	iteration and selection, go through the array displaying each element along 
	with identifying even and odd values.</p>
	<div id="assignment">
		<h3>My int Array</h3>
		int[] myArray = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		<h3>Loop Iteration and Selection</h3>
		<%
		  int[] myArray = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

		  for(int i = 0; i < myArray.length; i+=1) {
	  		if (myArray[i] % 2 == 0)
		  		out.println(myArray[i] + " is even.<br/>");
	  		else
		  		out.println(myArray[i] + " is odd.<br/>");
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