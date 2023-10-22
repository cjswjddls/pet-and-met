package com.kh.review.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private String reviewName;
	private String reviewContent;
	private String reviewAuthor;
	private Date reviewInsert;
	private Date reviewUpdate;
	private Date reviewDelete;
	private int reviewView;
	private String reviewIp;
	
	public Review() {}

	public Review(int reviewNo, String reviewName, String reviewContent, String reviewAuthor, Date reviewInsert,
			Date reviewUpdate, Date reviewDelete, int reviewView, String reviewIp) {
		this.reviewNo = reviewNo;
		this.reviewName = reviewName;
		this.reviewContent = reviewContent;
		this.reviewAuthor = reviewAuthor;
		this.reviewInsert = reviewInsert;
		this.reviewUpdate = reviewUpdate;
		this.reviewDelete = reviewDelete;
		this.reviewView = reviewView;
		this.reviewIp = reviewIp;
	}

	// 관리자 페이지에서 조회용 생성자
	public Review(int reviewNo, String reviewName, String reviewAuthor) {
		this.reviewNo = reviewNo;
		this.reviewName = reviewName;
		this.reviewAuthor = reviewAuthor;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewName() {
		return reviewName;
	}

	public void setReviewName(String reviewName) {
		this.reviewName = reviewName;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewAuthor() {
		return reviewAuthor;
	}

	public void setReviewAuthor(String reviewAuthor) {
		this.reviewAuthor = reviewAuthor;
	}

	public Date getReviewInsert() {
		return reviewInsert;
	}

	public void setReviewInsert(Date reviewInsert) {
		this.reviewInsert = reviewInsert;
	}

	public Date getReviewUpdate() {
		return reviewUpdate;
	}

	public void setReviewUpdate(Date reviewUpdate) {
		this.reviewUpdate = reviewUpdate;
	}

	public Date getReviewDelete() {
		return reviewDelete;
	}

	public void setReviewDelete(Date reviewDelete) {
		this.reviewDelete = reviewDelete;
	}

	public int getReviewView() {
		return reviewView;
	}

	public void setReviewView(int reviewView) {
		this.reviewView = reviewView;
	}

	public String getReviewIp() {
		return reviewIp;
	}

	public void setReviewIp(String reviewIp) {
		this.reviewIp = reviewIp;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewName=" + reviewName + ", reviewContent=" + reviewContent
				+ ", reviewAuthor=" + reviewAuthor + ", reviewInsert=" + reviewInsert + ", reviewUpdate=" + reviewUpdate
				+ ", reviewDelete=" + reviewDelete + ", reviewView=" + reviewView + ", reviewIp=" + reviewIp + "]";
	}
}