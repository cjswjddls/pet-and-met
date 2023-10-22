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
	
	public ArrayList<Review> selectReviewList(Connection conn) {
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
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
}