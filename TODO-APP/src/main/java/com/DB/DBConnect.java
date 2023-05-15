package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnect {
	private Connection conn;
	
	public static Connection getConn()
	{
		 Connection conn = null;
	    // Statement stmt = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo1", "root","");
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return conn;
	}
}
