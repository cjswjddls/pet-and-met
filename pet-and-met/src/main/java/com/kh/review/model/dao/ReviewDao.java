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
	
	// 리뷰게시판 글 개수
	public int showReviewCountAll(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("showReviewCountAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}
	
	public int showReviewCountAll(Connection conn, int num) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("showReviewCountAllSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Review> showReviewList(PageInfo pi, Connection conn){
		
		ArrayList<Review> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("showReviewList");

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
				
				list.add(new Review(
						rset.getInt("REVIEW_NO"),
						rset.getString("REVIEW_NAME"),
						rset.getString("REVIEW_CONTENT"),
						rset.getString("MEMBER_ID"),
						rset.getDate("REVIEW_INSERT"),
						rset.getDate("REVIEW_UPDATE"),
						rset.getDate("REVIEW_DELETE"),
						rset.getInt("REVIEW_VIEW"),
						rset.getString("REVIEW_IP")
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
	
	// 게시글 상세조회
	public Review detailReview(Connection conn, int reviewNo) {
		
		Review rv = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("detailReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new Review(
						rset.getInt("REVIEW_NO"),
						rset.getString("REVIEW_NAME"),
						rset.getString("REVIEW_CONTENT"),
						rset.getString("MEMBER_ID"),
						rset.getDate("REVIEW_INSERT"),
						rset.getDate("REVIEW_UPDATE"),
						rset.getDate("REVIEW_DELETE"),
						rset.getInt("REVIEW_VIEW"),
						rset.getString("REVIEW_IP")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rv;
	}
	
	// 파일 불러오기
	public ArrayList<Files> getFiles(Connection conn, int reviewNo) {
		
		ArrayList<Files> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getFiles");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Files(
						rset.getInt("FILES_REVIEW_NO"),
						rset.getString("FILES_ORIGIN_NAME"),
						rset.getString("FILES_CHANGE_NAME"),
						rset.getString("FILES_PATH")
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
	
	// 조회수 증가
	public int increaseView(Connection conn, int reviewNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("increaseView");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	// 게시글 삭제(첨부파일도 같이 삭제)
	public int deleteReview(Connection conn, int reviewNo) {
		
		int result1 = 0; // 글삭제
		int result2 = 1; // 파일삭제(없을수도 있으므로 1)
		PreparedStatement pstmt = null;
		String sql1 = prop.getProperty("deleteReview");
		String sql2 = prop.getProperty("deleteFiles");
		
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, reviewNo);
			result1 = pstmt.executeUpdate();
			
			JDBCTemplate.close(pstmt);
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, reviewNo);
			pstmt.executeUpdate();
			
			JDBCTemplate.close(pstmt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result1 * result2;
	}

}
