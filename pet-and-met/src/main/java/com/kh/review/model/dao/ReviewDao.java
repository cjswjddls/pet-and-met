package com.kh.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.review.model.vo.Files;
import com.kh.review.model.vo.Review;

public class ReviewDao {
	
private Properties prop = new Properties();
	
	public ReviewDao() {
		
		String fileName = MemberDao.class
				.getResource("/sql/review/review-mapper.xml").getPath(); 
		try {
			prop.loadFromXML(
					new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int enrollReview(Review rev, Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("enrollReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rev.getReviewName());
			pstmt.setString(2, rev.getReviewContent());
			pstmt.setInt(3, Integer.parseInt(rev.getReviewAuthor()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int enrollFiles(ArrayList<Files> list, Connection conn) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("enrollFiles");
		
		try {
			for(Files files : list) {
				pstmt = conn.prepareStatement(sql);
				// pstmt.setInt(1, files.getFilesReviewNo());
				pstmt.setString(1, files.getFilesOriginName());
				pstmt.setString(2, files.getFilesChangeName());
				pstmt.setString(3, files.getFilesPath());
				
				result *= pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} JDBCTemplate.close(pstmt);
		return result;		
	}
	

}
