package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class BoardService {

	public ArrayList<Board> selectBoardListAccent() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardListAccent(conn);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int selectListCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);

		JDBCTemplate.close(conn);
		return listCount;
	}
	
	public int selectListCountSearch(String keyword, String method) {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new BoardDao().selectListCountSearch(conn, keyword, method);

		JDBCTemplate.close(conn);
		return listCount;
	}

	public ArrayList<Board> selectListBoard(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectListBoard(conn, pi);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int increaseBoardView(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().increaseBoardView(conn, boardNo);
		
		if(result > 0) { JDBCTemplate.commit(conn); }
		else { JDBCTemplate.rollback(conn); }
		
		JDBCTemplate.close(conn);
		return result;
	}

	public Board selectBoard(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		JDBCTemplate.close(conn);
		
		return b;
	}

	public ArrayList<Attachment> selectAttachment(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Attachment> at = new BoardDao().selectAttachment(conn, boardNo);
		
		JDBCTemplate.close(conn);
		
		return at;
	}

	public ArrayList<Board> selectBoardAjax(PageInfo pi, String method, String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardAjax(conn, pi, method, keyword);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int insertBoard(Board b, Attachment at1, Attachment at2) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
		int r1 = 1;
		int r2 = 1;
		
		if(at1 != null) { r1 = new BoardDao().insertAttachment(conn, at1); }
		if(at2 != null) { r2 = new BoardDao().insertAttachment(conn, at2); }
		
		if(result > 0 && r1 > 0 && r2 > 0) { JDBCTemplate.commit(conn); }
		else { JDBCTemplate.rollback(conn); }
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int deleteBoard(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().deleteBoard(conn, bno);
		new BoardDao().deleteAttachmentAll(conn, bno);
		
		if(result > 0) { JDBCTemplate.commit(conn); }
		else { JDBCTemplate.rollback(conn); }
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int updateBoard(int bno, String bname, String bcontent, int baccent) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().updateBoard(conn, bno, bname, bcontent, baccent);
		
		if(result > 0) { JDBCTemplate.commit(conn); }
		else { JDBCTemplate.rollback(conn); }
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}