package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class BoardDao {
	private Properties prop = new Properties();
	public BoardDao() {
		try { prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath())); }
		catch (InvalidPropertiesFormatException e) { e.printStackTrace(); }
		catch (FileNotFoundException e) { e.printStackTrace(); }
		catch (IOException e) { e.printStackTrace(); }
	}
	public ArrayList<Board> selectBoardListAccent(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		String sql = prop.getProperty("selectBoardListAccent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) { list.add(new Board(rset.getInt("BOARD_NO"), rset.getString("BOARD_NAME"), rset.getDate("BOARD_INSERT"), rset.getInt("BOARD_VIEW"))); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return list;
	}
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { listCount = rset.getInt("COUNT"); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return listCount;
	}
	public int selectListCountSearch(Connection conn, String keyword, String method) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "";
		if(method.equals("all")) { sql += prop.getProperty("selectListCountSearchAll"); }
		else if(method.equals("title")) { sql += prop.getProperty("selectListCountSearchTitle"); }
		else { sql += prop.getProperty("selectListCountSearchContent"); }
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(method.equals("all")) { 
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%"); 
			}
			else { pstmt.setString(1, "%" + keyword + "%"); }
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { listCount = rset.getInt("COUNT"); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return listCount;
	}
	public ArrayList<Board> selectListBoard(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, ((pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1) + pi.getBoardLimit() - 1);
			
			rset = pstmt.executeQuery();
			while(rset.next()) { list.add(new Board(rset.getInt("BOARD_NO"), rset.getString("BOARD_NAME"), rset.getDate("BOARD_INSERT"), rset.getInt("BOARD_VIEW"))); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return list;
	}
	public int increaseBoardView(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseBoardView");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}
	public Board selectBoard(Connection conn, int boardNo) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { b = new Board(rset.getInt("BOARD_NO"), rset.getString("BOARD_NAME"), rset.getString("BOARD_CONTENT"), rset.getDate("BOARD_INSERT"), rset.getInt("BOARD_VIEW"), rset.getInt("BOARD_ACCENT")); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset); JDBCTemplate.close(pstmt);
		
		return b;
	}
	public ArrayList<Attachment> selectAttachment(Connection conn, int boardNo) {
		ArrayList<Attachment> at = new ArrayList<Attachment>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) { at.add(new Attachment(rset.getInt("ATTACHMENT_NO"), rset.getString("ATTACHMENT_ORIGIN_NAME"), rset.getString("ATTACHMENT_CHANGE_NAME"), rset.getString("ATTACHMENT_FILE_PATH"))); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset); JDBCTemplate.close(pstmt);
		
		return at;
	}
	public ArrayList<Board> selectBoardAjax(Connection conn, PageInfo pi, String method, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		String sql = "";
		
		if (method.equals("all")) { sql = prop.getProperty("selectBoardAjaxAll"); }
		else if(method.equals("title")) { sql = prop.getProperty("selectBoardAjaxTitle"); }
		else { sql = prop.getProperty("selectBoardAjaxContent"); }
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(method.equals("all")) {
				pstmt.setInt(3, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
				pstmt.setInt(4, ((pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1) + pi.getBoardLimit() - 1);
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
			}
			else {
				pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
				pstmt.setInt(3, ((pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1) + pi.getBoardLimit() - 1);
				pstmt.setString(1, "%" + keyword + "%");
			}
			rset = pstmt.executeQuery();
			while(rset.next()) { list.add(new Board(rset.getInt("BOARD_NO"), rset.getString("BOARD_NAME"), rset.getDate("BOARD_INSERT"), rset.getInt("BOARD_VIEW"))); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return list;
	}
	public int insertBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardName());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardAccent());
			pstmt.setString(4, b.getBoardIp());
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getAttachmentOriginName());
			pstmt.setString(2, at.getAttachmentChangeName());
			pstmt.setString(3, at.getAttachmentFilePath());
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}
	public int deleteBoard(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}
	public void deleteAttachmentAll(Connection conn, int bno) {
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteAttachmentAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
	}
	public int updateBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardName());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardAccent());
			pstmt.setInt(4, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); } 
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}
	public void updateBoardRemoveAttachment(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBoardRemoveAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
	}
	public int updateBoardInsertAttachment(Connection conn, Attachment at, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBoardInsertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			pstmt.setString(2, at.getAttachmentOriginName());
			pstmt.setString(3, at.getAttachmentChangeName());
			pstmt.setString(4, at.getAttachmentFilePath());
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}
}