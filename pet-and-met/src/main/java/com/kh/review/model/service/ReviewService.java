package com.kh.review.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Files;
import com.kh.review.model.vo.Review;

public class ReviewService {
	
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

}
