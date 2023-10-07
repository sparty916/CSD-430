//Pj Ellis - Module 12 Redo of Module 8

package ellisMod8redoBean;

import java.sql.*;

public class nationalPark {

	Connection conn = null;
    Statement stmt = null;
    ResultSet resultSet = null;
	
    public ResultSet getResults(String dbName, String dbUser, String dbPass, String SQL) throws ClassNotFoundException{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        	conn = DriverManager.getConnection(dbName, dbUser, dbPass);
            stmt = conn.createStatement();          
        }
        catch(SQLException e){
        }
        
        try{
            resultSet = stmt.executeQuery(SQL);
        }
        catch(SQLException e){
        }
        return resultSet;
    }
	
	public void closeConnection(){
	      try{
	    	  stmt.close();
	    	  conn.close();
	      }
	      catch(SQLException e){
	      }
	}

	public void addPark(String dbName, String dbUser, String dbPass, String parkName, String parkStateAbbr, String parkYear) throws SQLException, ClassNotFoundException {
		try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        	conn = DriverManager.getConnection(dbName, dbUser, dbPass);
            stmt = conn.createStatement();          
        }
        catch(SQLException e){
        }        
        try{
        	String sql = "INSERT INTO Parks(parkName, parkStateAbbr, parkYear) values ('" + parkName + "','" + parkStateAbbr + "','" + parkYear + "')";
    		stmt.executeUpdate(sql);
    		stmt.executeUpdate("COMMIT");
        }
        catch(SQLException e){
        }
	}	
}

