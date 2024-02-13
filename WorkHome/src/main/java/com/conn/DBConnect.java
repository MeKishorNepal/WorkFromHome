package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
private static Connection conn;
	
	public static Connection getCon() {
		
		try {
			
			
			  
      	  String url="jdbc:mysql://localhost:3306/workhome_db";
    		String username="root";
    		String password="Kishor nepal123";
    		
    	// Load the MySQL JDBC driver
    	  Class.forName("com.mysql.cj.jdbc.Driver");
    		
    		 conn=DriverManager.getConnection(url,username,password);
      	 
          
			
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}

}
