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
</style>

<title>Module 11</title>
</head>
<body>

<%@ taglib uri="/WEB-INF/tld/ellistag.tld" prefix="db" %>

	<div class="assignment">
		<h1>Module 11</h1>
		<h3>Create Database Table and Insert Data</h3>

		<%-- Custom Tag to create table and insert initial data --%>
		<db:create />
		
	</div>
	<div>
		<br /> 
		<a href="addUserInfo.jsp">Display the UserInfo Database and Add A New Entry</a>
	</div>
</body>
</html>