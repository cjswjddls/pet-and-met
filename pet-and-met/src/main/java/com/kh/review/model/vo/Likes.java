package com.kh.review.model.vo;

public class Likes {
	private int likesNo;
	private int likesMemberNo;
	private int likesReviewNo;
	private int likesStatus;
	
	public Likes() {}

	public Likes(int likesNo, int likesMemberNo, int likesReviewNo, int likesStatus) {
		this.likesNo = likesNo;
		this.likesMemberNo = likesMemberNo;
		this.likesReviewNo = likesReviewNo;
		this.likesStatus = likesStatus;
	}

	public int getLikesNo() {
		return likesNo;
	}

	public void setLikesNo(int likesNo) {
		this.likesNo = likesNo;
	}

	public int getLikesMemberNo() {
		return likesMemberNo;
	}

	public void setLikesMemberNo(int likesMemberNo) {
		this.likesMemberNo = likesMemberNo;
	}

	public int getLikesReviewNo() {
		return likesReviewNo;
	}

	public void setLikesReviewNo(int likesReviewNo) {
		this.likesReviewNo = likesReviewNo;
	}

	public int getLikesStatus() {
		return likesStatus;
	}

	public void setLikesStatus(int likesStatus) {
		this.likesStatus = likesStatus;
	}

	@Override
	public String toString() {
		return "Likes [likesNo=" + likesNo + ", likesMemberNo=" + likesMemberNo + ", likesReviewNo=" + likesReviewNo
				+ ", likesStatus=" + likesStatus + "]";
	}
}