package com.test.db;

import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;

public class DBConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/task_db";
	private static final String USER = "root";
	private static final String PASS = "EiffeLtower1234#";
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		return DriverManager.getConnection(URL, USER, PASS);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Error connecting to the Database!");
		}
	}
}
