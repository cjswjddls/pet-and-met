package com.kh.review.model.vo;

import java.sql.Date;

public class Comments {
	private int commentsNo;
	private String commentsContent;
	private Date commentsInsert;
	private Date commentsUpdate;
	private Date commentsDelete;
	private int commentsReviewNo;
	private int commentsMemberNo;
	private String commentsIp;
	
	public Comments() {}

	public Comments(int commentsNo, String commentsContent, Date commentsInsert, Date commentsUpdate,
			Date commentsDelete, int commentsReviewNo, int commentsMemberNo, String commentsIp) {
		this.commentsNo = commentsNo;
		this.commentsContent = commentsContent;
		this.commentsInsert = commentsInsert;
		this.commentsUpdate = commentsUpdate;
		this.commentsDelete = commentsDelete;
		this.commentsReviewNo = commentsReviewNo;
		this.commentsMemberNo = commentsMemberNo;
		this.commentsIp = commentsIp;
	}

	public int getCommentsNo() {
		return commentsNo;
	}

	public void setCommentsNo(int commentsNo) {
		this.commentsNo = commentsNo;
	}

	public String getCommentsContent() {
		return commentsContent;
	}

	public void setCommentsContent(String commentsContent) {
		this.commentsContent = commentsContent;
	}

	public Date getCommentsInsert() {
		return commentsInsert;
	}

	public void setCommentsInsert(Date commentsInsert) {
		this.commentsInsert = commentsInsert;
	}

	public Date getCommentsUpdate() {
		return commentsUpdate;
	}

	public void setCommentsUpdate(Date commentsUpdate) {
		this.commentsUpdate = commentsUpdate;
	}

	public Date getCommentsDelete() {
		return commentsDelete;
	}

	public void setCommentsDelete(Date commentsDelete) {
		this.commentsDelete = commentsDelete;
	}

	public int getCommentsReviewNo() {
		return commentsReviewNo;
	}

	public void setCommentsReviewNo(int commentsReviewNo) {
		this.commentsReviewNo = commentsReviewNo;
	}

	public int getCommentsMemberNo() {
		return commentsMemberNo;
	}

	public void setCommentsMemberNo(int commentsMemberNo) {
		this.commentsMemberNo = commentsMemberNo;
	}

	public String getCommentsIp() {
		return commentsIp;
	}

	public void setCommentsIp(String commentsIp) {
		this.commentsIp = commentsIp;
	}

	@Override
	public String toString() {
		return "Comments [commentsNo=" + commentsNo + ", commentsContent=" + commentsContent + ", commentsInsert="
				+ commentsInsert + ", commentsUpdate=" + commentsUpdate + ", commentsDelete=" + commentsDelete
				+ ", commentsReviewNo=" + commentsReviewNo + ", commentsMemberNo=" + commentsMemberNo + ", commentsIp="
				+ commentsIp + "]";
	}
}