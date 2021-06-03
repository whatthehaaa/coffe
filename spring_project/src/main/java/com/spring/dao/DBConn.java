package com.spring.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class DBConn {
	//Field
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521";
	String user="coffee";
	String pass="coffee";
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	
	//Constructor : 1,2 �ܰ�
	public DBConn() {
		try {
			//1. ����̹� �ε�
			Class.forName(driver);
			//System.out.println("1�ܰ� ����~");

			//2. Connection ��ü ����
			conn = DriverManager.getConnection(url,user,pass);
			//System.out.println("2�ܰ� Connection ��ü ����~");
	
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}//constructor
	
	//Method
	public void getStatement() {
		try {
			stmt = conn.createStatement();
		}catch(Exception e) { e.printStackTrace();}
	}
	
	
	public void getPreparedStatement(String sql) {
		try {
			pstmt = conn.prepareStatement(sql);
		}catch(Exception e) {e.printStackTrace();}
	}

}













