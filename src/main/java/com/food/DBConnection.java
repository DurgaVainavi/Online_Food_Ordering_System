package com.food;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection{
	public static Connection getConnection() {
		Connection con = null;
		try {
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  
			  String url = "jdbc:mysql://localhost:3306/food_db";
			  String username = "root";
			  String password = "Durg@v@in@vi123";
			  
			  con = DriverManager.getConnection(url,username,password);
			  System.out.println("MySQL Connection Successful!");
		} catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
	public static void main(String[] args) {
		Connection con = DBConnection.getConnection();
		if(con!=null) {
			System.out.println("Database connected successfully!");
		}else {
			System.out.println("Database connection failed");
		}
	}
}
