package com.kh.common;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	/**커넥션 객체 생성 및 반환
	 * @return Connection
	 */
	public static Connection getConnection() {
		Properties prop = new Properties();
		Connection conn = null;
		
		try { prop.load(new FileInputStream(JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath())); }
		catch(Exception e) { e.printStackTrace(); }
		
		try { Class.forName(prop.getProperty("driver")); 
			conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("username"), prop.getProperty("password")); } 
		catch (ClassNotFoundException e) { e.printStackTrace(); } 
		catch (SQLException e) { e.printStackTrace(); }
		
		return conn;
	}
	
	/**
	 * @param conn
	 */
	public static void commit(Connection conn) {
		try { if (conn != null && !conn.isClosed()) { conn.commit(); } } 
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	public static void rollback(Connection conn) {
		try { if (conn != null && !conn.isClosed()) { conn.rollback(); } } 
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	public static void close(Connection conn) {
		try { if (conn != null && !conn.isClosed()) { conn.close(); } } 
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	public static void close(Statement stmt) {
		try { if (stmt != null && !stmt.isClosed()) { stmt.close(); } } 
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	public static void close(ResultSet rs) {
		try { if (rs != null && !rs.isClosed()) { rs.close(); } } 
		catch (SQLException e) { e.printStackTrace(); }
	}
}