/* Pj Ellis - Module 5 - Servlet for ebookshop
 * Controller (C) of MVC
 * when index.jsp passes control to servlet it will perform 
 * these methods before transferring control back to index
 */

package ebookshop;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 
import java.util.Vector; 
import javax.servlet.ServletContext;
import javax.servlet.RequestDispatcher; 

@WebServlet("/eshop")
public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShoppingServlet() {
        super();

    }

	public void init(ServletConfig config) throws ServletException {

	}

	public void destroy() {

	}


	  public void doGet (HttpServletRequest req, HttpServletResponse res)
	      throws ServletException, IOException {
	    doPost(req, res);
	    }

	  public void doPost (HttpServletRequest req, HttpServletResponse res)
	      throws ServletException, IOException {
	    HttpSession session = req.getSession(true);
	    @SuppressWarnings("unchecked")
	    Vector<Book> shoplist =
	      (Vector<Book>)session.getAttribute("ebookshop.cart");
	    String do_this = req.getParameter("do_this");

	    // Initilize the list of books
	    
	    if (do_this == null) {
	      Vector<String> blist = new Vector<String>();
	      blist.addElement("Introducing Algorithms in C: A Step-by-step Guide to Algorithms in C. Luciano Manelli $32.92");
	      blist.addElement("The Definitive Guide to Java Swing. John Zukowski $41.99");
	      blist.addElement("Learn Java with Math: Using Fun Projects and Games. Ron Dai $25.37");	    
	      session.setAttribute("ebookshop.list", blist);
	      ServletContext    sc = req.getSession().getServletContext();
	      RequestDispatcher rd = sc.getRequestDispatcher("/");
	      rd.forward(req, res);
	      }
	    else {

	      // If it is not the first request, it can only be a checkout request
	      // or a request to manipulate the list of books being ordered
	    	
	      if (do_this.equals("checkout"))  {
	        float dollars = 0;
	        int   books = 0;
	        for (Book aBook : shoplist) {
	          float price = aBook.getPrice();
	          int   qty = aBook.getQuantity();
	          dollars += price * qty;
	          books += qty;
	          }
	        req.setAttribute("dollars", dollars+"");
	        req.setAttribute("books", books+"");
	        ServletContext    sc = req.getSession().getServletContext();
	        RequestDispatcher rd = sc.getRequestDispatcher("/Checkout.jsp");
	        rd.forward(req, res);
	        } // if (..checkout..

	      // Not a checkout request - Manipulate the list of books
	      // Remove items from list of books
	      else {
	        if (do_this.equals("remove")) {
	          String pos = req.getParameter("position");
	          shoplist.removeElementAt(Integer.parseInt(pos));
	          }
	        // Add items to list of books
	        else if (do_this.equals("add")) {
	          Book aBook = getBook(req);
	          if (shoplist == null) {  // the shopping cart is empty
	            shoplist = new Vector<Book>();
	            shoplist.addElement(aBook);
	            }
	          else {  // update the #copies if the book is already there
	            boolean found = false;
	            for (int i = 0; i < shoplist.size() && !found; i++) {
	              Book b = (Book)shoplist.elementAt(i);
	              if (b.getTitle().equals(aBook.getTitle())) {
	                b.setQuantity(b.getQuantity() + aBook.getQuantity());
	                shoplist.setElementAt(b, i);
	                found = true;
	                }
	              } // for (i..
	            if (!found) {  // if it is a new book => Add it to the shoplist
	              shoplist.addElement(aBook);
	              }
	            } // if (shoplist == null) .. else ..
	          } // if (..add..

	        // Save the updated list of books and return to the home page
	        session.setAttribute("ebookshop.cart", shoplist);
	        ServletContext sc = req.getSession().getServletContext();
	        RequestDispatcher rd = sc.getRequestDispatcher("/");
	        rd.forward(req, res);
	        } // if (..checkout..else
	      } // if (do_this..
	    } // doPost

	  private Book getBook(HttpServletRequest req) {
	    String myBook = req.getParameter("book");
	    int    n = myBook.indexOf('$');
	    String title = myBook.substring(0, n);
	    String price = myBook.substring(n+1);
	    String qty = req.getParameter("qty");
	    return new Book(title, Float.parseFloat(price), Integer.parseInt(qty));
	    } // getBook

}
