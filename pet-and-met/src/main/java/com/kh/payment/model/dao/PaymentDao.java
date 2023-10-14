package com.kh.payment.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.payment.model.service.PaymentService;

public class PaymentDao {
	private Properties prop = new Properties();
	public PaymentDao() {
		try { prop.loadFromXML(new FileInputStream(PaymentDao.class.getResource("/sql/payment/payment-mapper.xml").getPath())); }
		catch (InvalidPropertiesFormatException e) { e.printStackTrace(); }
		catch (FileNotFoundException e) { e.printStackTrace(); }
		catch (IOException e) { e.printStackTrace(); }
	}
	public int insertPayment(Connection conn, String tid, int paymentNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tid);
			pstmt.setInt(2, paymentNo);
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}
	public int checkPaymentByToday(Connection conn, Date date) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkPaymentByToday");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, date.toString().replace("-", ""));
			
			rset = pstmt.executeQuery();
			
			// while(rset.next()) { }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return 0;
	}
}