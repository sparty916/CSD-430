//Pj Ellis - Module 11 

package ellisMod12Bean;

import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*; 

public class DisplayTable extends TagSupport{
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
	        
	        //get data from table
	        ResultSet rs= stmt.executeQuery("select * from UserInfo");   
	        
	        //getting column names, and table contents and formatting the display
	        ResultSetMetaData rsmd=rs.getMetaData();  
	        int totalcols=rsmd.getColumnCount(); 
	        
	        out.write("<table border='1'>");
	        out.write("<tr>");  
	        for(int i=1;i<=totalcols;i++){  
	            out.write("<th>"+rsmd.getColumnName(i)+"</th>");  
	        }  
	        out.write("</tr>"); 	
	        	while(rs.next()) {	        		   
	            out.write("<tr>");  
	            for(int i = 1; i<=totalcols; i++){  
	                out.write("<td>"+rs.getString(i)+"</td>");  
	            }  
	            out.write("</tr>");	                  
	        }  
	        out.write("</table>");	          
	         
	        stmt.close();
	        con.close();
	    }	
	    catch(Exception e){
		    System.out.println(e);
		}	      
	    return EVAL_PAGE;  
	}  
}

