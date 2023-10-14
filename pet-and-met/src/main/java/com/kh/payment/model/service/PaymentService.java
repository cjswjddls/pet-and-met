package com.kh.payment.model.service;

import java.sql.Connection;
import java.util.Date;

import com.kh.common.JDBCTemplate;
import com.kh.payment.model.dao.PaymentDao;

public class PaymentService {
	public int insertPayment(String tid, int paymentNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PaymentDao().insertPayment(conn, tid, paymentNo);
		
		if(result > 0) { JDBCTemplate.commit(conn); }
		else { JDBCTemplate.rollback(conn); }
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public void checkPaymentByToday(Date date) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PaymentDao().checkPaymentByToday(conn, date);
		
		if(result > 0) { JDBCTemplate.commit(conn); }
		else { JDBCTemplate.rollback(conn); }
		
		JDBCTemplate.close(conn);
	}
}