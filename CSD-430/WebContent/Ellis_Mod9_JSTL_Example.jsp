<!--  Pj Ellis - CSD430 - Module 9 - 7/8/2023 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
      <title>SELECT Operation</title>
   </head>

   <body>
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/natparks"
         user = "root"  password = "DANcer5627!"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from parks;
      </sql:query>
 
      <table border = "1">
         <tr>
            <th>Park Name</th>
            <th>State</th>
            <th>Year Visited</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.parkName}"/></td>
               <td><c:out value = "${row.parkStateAbbr}"/></td>
               <td><c:out value = "${row.parkYear}"/></td>
            </tr>
         </c:forEach>
      </table>
 
   </body>
</html>