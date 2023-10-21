package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String boardName;
	private String boardContent;
	private int boardAccent;
	private Date boardInsert;
	private Date boardUpdate;
	private Date boardDelete;
	private int boardView;
	private String boardIp;
	
	public Board() {}
	
	public Board(int boardNo, String boardName, String boardContent, int boardAccent, Date boardInsert,
			Date boardUpdate, Date boardDelete, int boardView, String boardIp) {
		this.boardNo = boardNo;
		this.boardName = boardName;
		this.boardContent = boardContent;
		this.boardAccent = boardAccent;
		this.boardInsert = boardInsert;
		this.boardUpdate = boardUpdate;
		this.boardDelete = boardDelete;
		this.boardView = boardView;
		this.boardIp = boardIp;
	}

	public Board(int boardNo, String boardName, Date boardInsert, int boardView) {
		this.boardNo = boardNo;
		this.boardName = boardName;
		this.boardInsert = boardInsert;
		this.boardView = boardView;
	}

	public Board(int boardNo, String boardName, String boardContent, Date boardInsert, int boardView) {
		this.boardNo = boardNo;
		this.boardName = boardName;
		this.boardContent = boardContent;
		this.boardInsert = boardInsert;
		this.boardView = boardView;
	}
	
	public Board(int boardNo, String boardName, String boardContent, Date boardInsert, int boardView, int boardAccent) {
		this.boardNo = boardNo;
		this.boardName = boardName;
		this.boardContent = boardContent;
		this.boardInsert = boardInsert;
		this.boardView = boardView;
		this.boardAccent = boardAccent;
	}

	public Board(String boardName, String boardContent, int boardAccent, String boardIp) {
		this.boardName = boardName;
		this.boardContent = boardContent;
		this.boardAccent = boardAccent;
		this.boardIp = boardIp;
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardAccent() {
		return boardAccent;
	}
	public void setBoardAccent(int boardAccent) {
		this.boardAccent = boardAccent;
	}
	public Date getBoardInsert() {
		return boardInsert;
	}
	public void setBoardInsert(Date boardInsert) {
		this.boardInsert = boardInsert;
	}
	public Date getBoardUpdate() {
		return boardUpdate;
	}
	public void setBoardUpdate(Date boardUpdate) {
		this.boardUpdate = boardUpdate;
	}
	public Date getBoardDelete() {
		return boardDelete;
	}
	public void setBoardDelete(Date boardDelete) {
		this.boardDelete = boardDelete;
	}
	public int getBoardView() {
		return boardView;
	}
	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}
	public String getBoardIp() {
		return boardIp;
	}
	public void setBoardIp(String boardIp) {
		this.boardIp = boardIp;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardName=" + boardName + ", boardContent=" + boardContent
				+ ", boardAccent=" + boardAccent + ", boardInsert=" + boardInsert + ", boardUpdate=" + boardUpdate
				+ ", boardDelete=" + boardDelete + ", boardView=" + boardView + ", boardIp=" + boardIp + "]";
	}
}