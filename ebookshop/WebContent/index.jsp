<%-- Pj Ellis - Module 5 - 6/22/2023 - index for ebookshop --%>
<%-- index.jsp is the View (V) of MVC --%>

<%@page language="java" contentType="text/html"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page session="true" import="java.util.Vector, ebookshop.Book"%>
<html>
<head>
  <title>Pj's E-bookshop</title>
  <style type="text/css">
    body {background-color:gray; font-size=10pt;}
    H1 {font-size:20pt;}
    table {background-color:white; padding:2;}
    </style>
  </head>
<body>
  <H1>Pj's Online Bookshop</H1>
  <hr/><p/>
<%  // Checks if the list of books to be sold is available, 
	// if it is not, it passes control to the servlet which will initialize the list.  
@SuppressWarnings("unchecked")
  Vector booklist =
      (Vector<ebookshop.Book>)session.getAttribute("ebookshop.list");
  if (booklist == null) {
    response.sendRedirect("/ebookshop/eshop");
    }
  else {
  %>
    <form name="addForm" action="eshop" method="POST">
      <input type="hidden" name="do_this" value="add">
      Book:
      <select name=book>
<%  // If book list exists, it copies it into the select control
        for (int i = 0; i < booklist.size(); i++) {
          out.println("<option>" + (String)booklist.elementAt(i) + "</option>");
          }
  %>
        </select>
      Quantity: <input type="text" name="qty" size="3" value="1">
      <input type="submit" value="Add to Cart">
      </form>
      <!-- Add to Cart button send a request to servlet with hidden parameter do_this set to add -->
    <p/>
<%  // Checks if a shopping cart exists
@SuppressWarnings("unchecked")
    Vector<ebookshop.Book> shoplist =
        (Vector<ebookshop.Book>)session.getAttribute("ebookshop.cart");
    if (shoplist != null  &&  shoplist.size() > 0) {
  %>
      <table border="1">
      <tr>
      <td>TITLE</td>
      <td>PRICE</td>
      <td>QUANTITY</td>
      <td></td>
      </tr>
<%  // Displays the items in the shopping cart
      for (int i = 0; i < shoplist.size(); i++) {
        Book aBook = shoplist.elementAt(i);
  %>
        <tr>
          <form name="removeForm" action="eshop" method="POST">
            <input type="hidden" name="position" value="<%=i%>">
            <input type="hidden" name="do_this" value="remove">
            <td><%=aBook.getTitle()%></td>
            <td align="right">$<%=aBook.getPrice()%></td>
            <td align="right"><%=aBook.getQuantity()%></td>
            <td><input type="submit" value="Remove from Cart"></td>
            <!-- Delete button sends a request to servlet with hidden parameter do_this set to remove -->
            </form>
          </tr>
<%
        } // for (int i..
  %>
      </table>
      <p/>
      <form name="checkoutForm" action="eshop" method="POST">
        <input type="hidden" name="do_this" value="checkout">
        <input type="submit" value="Checkout">
        <!-- CHECKOUT button sends a request to servlet with hidden parameter do_this set to checkout -->
        </form>
<%
      } // if (shoplist..
    } // if (booklist..else..
  %>
  </body>
</html>
