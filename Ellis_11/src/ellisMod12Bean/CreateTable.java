//Pj Ellis - Module 11 

package ellisMod12Bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class CreateTable extends TagSupport{
	static final long serialVersionUID = 1L;


	private String dbName = "jdbc:mysql://localhost:3306/userinfo_mod12";
	private String dbUser = "root";
	private String dbPass = "DANcer5627!";
	
	public int doStartTag()throws JspException{
		
		JspWriter out=pageContext.getOut(); 
		
		try{ //Connect to database  
	        Class.forName("com.mysql.cj.jdbc.Driver");  
	        Connection con=DriverManager.getConnection(dbName, dbUser, dbPass);
	        Statement stmt = con.createStatement();
	        
	        //delete table if exists
			stmt.executeUpdate("DROP TABLE UserInfo");
			out.println("<p>UserInfo Dropped</p>");
			
			//Create columns for table
			stmt.executeUpdate("CREATE TABLE UserInfo(Email CHAR(50) NOT NULL PRIMARY KEY, First_Name CHAR(20) NOT NULL,"
			+ "Last_Name CHAR(20) NOT NULL, Phone CHAR(15) NOT NULL, Age CHAR(5) NOT NULL, Eye_Color CHAR(10) NOT NULL,"
			+ "Hair_Color CHAR(10) NOT NULL, Fav_Food CHAR(20) NOT NULL)");
			out.println("<p>Table UserInfo Created</p>");
			
			//Insert date into table
			stmt.executeUpdate("INSERT INTO UserInfo(Email, First_Name, Last_Name, Phone, Age, Eye_Color, Hair_Color, Fav_Food)"
					+ "VALUES('pje2@aol.com', 'PJ', 'Ellis', '(407)432-7996', '44', 'Brown', 'Bald', 'Pasta')");
			stmt.executeUpdate("INSERT INTO UserInfo(Email, First_Name, Last_Name, Phone, Age, Eye_Color, Hair_Color, Fav_Food)"
					+ "VALUES('mark@gmail.com', 'Mark', 'Wagner', '(407)555-1234', '35', 'Brown', 'Grey', 'Mozzerella Sticks')");
			stmt.executeUpdate("INSERT INTO UserInfo(Email, First_Name, Last_Name, Phone, Age, Eye_Color, Hair_Color, Fav_Food)"
					+ "VALUES('courtney@yahoo.com', 'Courtney', 'Porter', '(407)555-4321', '32', 'Blue', 'Blonde', 'Tacos')");
			stmt.executeUpdate("INSERT INTO UserInfo(Email, First_Name, Last_Name, Phone, Age, Eye_Color, Hair_Color, Fav_Food)"
					+ "VALUES('josh@hotmail.com', 'Josh', 'Fraser', '(407)555-7894', '25', 'Green', 'Brown', 'Pizza')");

			stmt.executeUpdate("COMMIT");

			out.println("<p>Data Inserted</p>");
			
			//close connection
			stmt.close();
			con.close();
			out.println("<p>Database Connections Closed</p>");
		}
		
		catch (Exception e) {
		}
		
		return EVAL_PAGE;
	}
}
