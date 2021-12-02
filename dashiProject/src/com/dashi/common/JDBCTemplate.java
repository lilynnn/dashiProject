package com.dashi.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	// 1. Connection 객체 생성 한 후 해당 Connection객체를 반환시켜주는 getConnection메소드
	public static Connection getConnection() {
		
		Connection conn = null;
		
		Properties prop = new Properties(); // Map계열 컬렉션(key-value)
		
		// 일어들이고고자 하는 classes 폴더내의 driver.properteies파일의 물리적인 경로
		String filePath = JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath();
		
		
		try {
			prop.load(new FileInputStream(filePath));//prop에 driver.properties애들이 키-벨류로 담겨져 있을거임
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		

		try {
			// jdbc driver 등록
			Class.forName(prop.getProperty("driver"));
			
			// 접속하고자 하는 db의 url, 계정명, 비밀번호 제시해서 Connection객체 생성
			conn = DriverManager.getConnection(prop.getProperty("url"),
											   prop.getProperty("username"),
											   prop.getProperty("password")); 
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 2-1. Connection 객체 전달받아서 commit 시켜주는 commit 메소드
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	// 2-2. Connection rollback시켜주는 rollback메소드
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	// 3-1. Connection 객체 전달 받아서 반납시켜주는 close메소드
	public static void close(Connection conn) {
		try {
			if(conn !=null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3-2. Statement 객체 전달받아서 반납시켜주는 close메소드
	public static void  close(Statement stmt) {
		try {
			if(stmt!=null&&!stmt.isClosed()) {
				stmt.isClosed();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// 3-3. ResultSet 객체 전달받아서 반납시켜주는 close메소드
	public static void  close(ResultSet rset) {
		try {
			if(rset!=null&&!rset.isClosed()) {
				rset.isClosed();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
