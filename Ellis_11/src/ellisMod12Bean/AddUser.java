//Pj Ellis - Module 11 

package ellisMod12Bean;

import javax.servlet.jsp.JspException;   
import javax.servlet.jsp.tagext.TagSupport;  
import java.sql.*; 

public class AddUser extends TagSupport{
	static final long serialVersionUID = 1L;
	
	private String dbName = "jdbc:mysql://localhost:3306/userinfo_mod12";
	private String dbUser = "root";
	private String dbPass = "DANcer5627!"; 
	
	private String userEmail;
	private String firstName;
	private String lastName;
	private String userPhone;
	private String userAge;
	private String userEye;
	private String userHair;
	private String userFavFood;
	
	//setters to take user input and add to sql statement below
	public void setUserEmail(String userEmail) {  
	    this.userEmail = userEmail;  
	}
	
	public void setFirstName(String firstName) {  
	    this.firstName = firstName;  
	}
	
	public void setLastName(String lastName) {  
	    this.lastName = lastName;  
	}
	
	public void setUserPhone(String userPhone) {  
	    this.userPhone = userPhone;  
	}
	
	public void setUserAge(String userAge) {  
	    this.userAge = userAge;  
	}
	
	public void setUserEye(String userEye) {  
	    this.userEye = userEye;  
	}
	
	public void setUserHair(String userHair) {  
	    this.userHair = userHair;  
	}
	
	public void setUserFavFood(String userFavFood) {  
	    this.userFavFood = userFavFood;  
	}
	
	
	public int doStartTag()throws JspException{    
	    try{   //Connect to database
	        Class.forName("com.mysql.cj.jdbc.Driver");  
	        Connection con=DriverManager.getConnection(dbName, dbUser, dbPass);
	        Statement stmt = con.createStatement();
	        
        	//Insert new data into table
	        String sql = "INSERT INTO UserInfo(Email, First_Name, Last_Name, Phone, Age, Eye_Color, Hair_Color, Fav_Food)" + 
        				"VALUES('" + userEmail + "','" + firstName + "','" + lastName + "','" + userPhone + "','" + userAge + 
        				"','" + userEye + "','" + userHair + "','" + userFavFood + "')";
        	
    		stmt.executeUpdate(sql);
    		
    		stmt.executeUpdate("COMMIT");
        }
	    
	    catch(Exception e){
	    	System.out.println(e);
        }
	    
	    return EVAL_PAGE;
	}
}
