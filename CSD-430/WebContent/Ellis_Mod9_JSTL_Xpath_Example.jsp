<!-- Pj Ellis - Mod 9 - CSD430 - 7/9/2023 -->

<!-- website i drew inspiration from for this example: -->
<!-- https://www.tutorialspoint.com/how-to-print-xpath-expression-result-in-jsp -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- tags to be used to parse the xlm -->

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>

<html>
   <head>
      <title>JSTL and Xpath Example</title>
   </head>
   <body>
   
   	   <!-- setting tag prefix "c" to set my xml text to be parsed for display -->      
       
       <c:set var = "xmltext">
		<waltdisneyworld>
		    <title>Theme Parks of Walt Disney World</title>
		    <themepark>
		        <parkName>Magic Kingdom</parkName>
		        <parkicon>Cinderlla's Castle</parkicon>
		        <yearopened>1971</yearopened>        
		    </themepark>
		    <themepark>
		        <parkName>EPCOT</parkName>
		        <parkicon>Spaceship Earth</parkicon>
		        <yearopened>1982</yearopened>        
		    </themepark>
		    <themepark>
		        <parkName>Disney's Hollywood Studios</parkName>
		        <parkicon>Chinese Theater</parkicon>
		        <yearopened>1989</yearopened>
		    </themepark>
		    <themepark>
		        <parkName>Disney's Animal Kingdom</parkName>
		        <parkicon>Tree of Life</parkicon>
		        <yearopened>1989</yearopened>
		    </themepark>    
		</waltdisneyworld>
       </c:set>
       
      <!-- setting the tag prefix "x" to parse the xml test and set a variable to use -->
       
      <x:parse xml = "${xmltext}" var = "output"/>
      
      <!--  using Xpath to select data from the xml text -->
      
      <h3><x:out select = "$output/waltdisneyworld/title" /></h3>
      <b>The name of the first park is</b>:
      <x:out select = "$output/waltdisneyworld/themepark[1]/parkName" />
      <br>
      <b>The name of the second park is</b>::
      <x:out select = "$output/waltdisneyworld/themepark[2]/parkName" />
      <br>
      <x:out select = "$output/waltdisneyworld/themepark[3]/parkName" />
      <b>opened third and its Icon is:</b>
      <x:out select = "$output/waltdisneyworld/themepark[3]/parkicon" />
      <br>
      <b>The last park to open was:</b>
      <x:out select = "$output/waltdisneyworld/themepark[4]/parkName" />
      <br>
      <b>and it opened in:</b>
      <x:out select = "$output/waltdisneyworld/themepark[4]/yearopened" />
      <br>
   </body>
</html>