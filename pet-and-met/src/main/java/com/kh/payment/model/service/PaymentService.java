package com.kh.payment.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.payment.model.dao.PaymentDao;

public class PaymentService {
	public int insertPayment(int oid, String tid, int uNo, int sCode) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PaymentDao().insertPayment(conn, oid, tid, uNo, sCode);
		
		if(result > 0) { JDBCTemplate.commit(conn); }
		else { JDBCTemplate.rollback(conn); }
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public String selectPaymentForTID(int oid) {
		Connection conn = JDBCTemplate.getConnection();
		String tid = new PaymentDao().selectPaymentForTID(conn, oid);
		
		JDBCTemplate.close(conn);
		
		return tid;
	}

	public int updatePaymentDone(String tid, String aid, String method, String appTime, int oid, int memberNo, int sCode) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PaymentDao().updatePaymentDone(conn, tid, aid, method, appTime, oid, memberNo, sCode);
		
		if(result > 0) { JDBCTemplate.commit(conn); }
		else { JDBCTemplate.rollback(conn); }
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}