package com.kh.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.in.model.dao.AdminCheckDao;
import com.kh.review.model.vo.Review;

public class AdminReviewDao {
	
	private Properties prop = new Properties();
	
	public AdminReviewDao() {
		String fileName = AdminCheckDao.class.getResource("/sql/review/review-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Review> selectReviewList(Connection conn, PageInfo pi) {
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) 
					  * pi.getBoardLimit() + 1;
			int endRow = startRow 
					 + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
		while(rset.next()) {
			list.add(new Review(rset.getInt("REVIEW_NO"),
							rset.getString("REVIEW_NAME"),
							rset.getString("MEMBER_NAME")
							));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Review> selectReviewList(Connection conn, PageInfo pi, int num) {
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewListSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) 
					  * pi.getBoardLimit() + 1;
			int endRow = startRow 
					 + pi.getBoardLimit() - 1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
		while(rset.next()) {
			list.add(new Review(rset.getInt("REVIEW_NO"),
							rset.getString("REVIEW_NAME"),
							rset.getString("MEMBER_NAME")
							));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int deleteCheckBox(Connection conn, String reviews) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			
			for(String s:reviews.split("/")) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(s));
				
				result += pstmt.executeUpdate();
			
			}
			
		
			} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(pstmt);
		}
	
		return result;
	}
}