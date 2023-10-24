package com.kh.review.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Files;
import com.kh.review.model.vo.Review;

public class ReviewService {
	
	// 리뷰 등록
	public int enrollReview(Review rev, ArrayList<Files> list) {
		
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().enrollReview(rev, conn);
		
		int result2 = 1;
		
		if(list != null) {
			result2 = new ReviewDao().enrollFiles(list, conn);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}

	// 게시글 총 개수
	public int showReviewCountAll() {
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().showReviewCountAll(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public int showReviewCountAll(int num) {
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().showReviewCountAll(conn, num);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Review> showReviewList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().showReviewList(pi, conn);
		
		close(conn);
		return list;
		
	}
	
	// 게시글 상세조회
	public Review detailReview(int reviewNo) {
		
		Connection conn = getConnection();
		
		Review rv = new ReviewDao().detailReview(conn, reviewNo);
		
		close(conn);
		return rv;
		
	}
	
	// 파일가져오기
	public ArrayList<Files> getFiles(int reviewNo) {
		
		Connection conn = getConnection();
		ArrayList<Files> list = new ReviewDao().getFiles(conn, reviewNo);
		
		close(conn);
		return list;
	}
	
	// 조회수 증가
	public int increaseView(int reviewNo) {
		
		Connection conn = getConnection();
		int result = new ReviewDao().increaseView(conn, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	// 게시글 삭제
	public int deleteReview(int reviewNo) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReview(conn, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	
}
