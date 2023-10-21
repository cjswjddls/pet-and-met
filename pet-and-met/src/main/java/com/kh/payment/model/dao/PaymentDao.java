package com.kh.payment.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;

public class PaymentDao {
	private Properties prop = new Properties();
	public PaymentDao() {
		try { prop.loadFromXML(new FileInputStream(PaymentDao.class.getResource("/sql/payment/payment-mapper.xml").getPath())); }
		catch (InvalidPropertiesFormatException e) { e.printStackTrace(); }
		catch (FileNotFoundException e) { e.printStackTrace(); }
		catch (IOException e) { e.printStackTrace(); }
	}
	public int insertPayment(Connection conn, int oid, String tid, int userNo, int sCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tid);
			pstmt.setInt(2, oid);
			pstmt.setInt(3, userNo);
			pstmt.setInt(4, sCode);
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}
	public String selectPaymentForTID(Connection conn, int oid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String tid = "";
		
		String sql = prop.getProperty("selectPaymentForTID");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, oid);
			pstmt.setInt(2, 0);
			
			rset = pstmt.executeQuery();
			if(rset.next()) { tid = rset.getString("PAYMENT_TID"); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return tid;
	}
	public int updatePaymentDone(Connection conn, String tid, String aid, String method, String appTime, int oid, int memberNo, int sCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updatePaymentDone");
		// UPDATE PAYMENT SET PAYMENT_AID = ?, PAYMENT_METHOD = ?, PAYMENT_APPROVED = ?, PAYMENT_STATUS_CODE = ? WHERE PAYMENT_TID = ? 
		// AND PAYMENT_RESERVATION_NO = ? AND PAYMENT_USER_NO = ?
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, aid);
			pstmt.setString(2, method);
			pstmt.setString(3, appTime);
			pstmt.setInt(4, sCode);
			pstmt.setString(5, tid);
			pstmt.setInt(6, oid);
			pstmt.setInt(7, memberNo);
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}
	public int cancelPayment(Connection conn, String tid, String aid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("cancelPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tid);
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}
	public String cancelPaymentPrepare(Connection conn, int rno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = "";
		
		String sql = prop.getProperty("cancelPaymentPrepare");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { result += rset.getString("PAYMENT_TID"); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		return result;
	}
	public int getCurrentRNO(Connection conn, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("getCurrentRNO");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("RESERVATION_NO");
			}
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return result;
	}
}