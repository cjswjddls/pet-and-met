package com.kh.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.review.model.dao.AdminReviewDao;
import com.kh.review.model.vo.Review;

public class AdminReviewService {

	public ArrayList<Review> selectReviewList(){
		
			// 1) Connection 객체 생성
			Connection conn = JDBCTemplate.getConnection();
					
			// 2) Conneciton 객체와 전달값을 넘기면서
			// DAO 로 요청 후 결과 받기
			ArrayList<Review> list = new AdminReviewDao().selectReviewList(conn);
			
			// 3) 트랜잭션 처리 (select 문이므로 패스)
			
			// 4) Connection 객체 반납
			JDBCTemplate.close(conn);
			
			// 5) Controller 단으로 결과 반환
			return list;
		
	}
	
}
