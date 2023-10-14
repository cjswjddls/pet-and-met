package com.kh.review.model.vo;

import java.sql.Date;

public class Files {
	private int filesNo;
	private int filesReviewNo;
	private String filesOriginName;
	private String filesChangeName;
	private String filesPath;
	private Date filesUploadDate;
	private int filesStatus;
	
	public Files() {}

	public Files(int filesNo, int filesReviewNo, String filesOriginName, String filesChangeName, String filesPath,
			Date filesUploadDate, int filesStatus) {
		this.filesNo = filesNo;
		this.filesReviewNo = filesReviewNo;
		this.filesOriginName = filesOriginName;
		this.filesChangeName = filesChangeName;
		this.filesPath = filesPath;
		this.filesUploadDate = filesUploadDate;
		this.filesStatus = filesStatus;
	}

	public int getFilesNo() {
		return filesNo;
	}

	public void setFilesNo(int filesNo) {
		this.filesNo = filesNo;
	}

	public int getFilesReviewNo() {
		return filesReviewNo;
	}

	public void setFilesReviewNo(int filesReviewNo) {
		this.filesReviewNo = filesReviewNo;
	}

	public String getFilesOriginName() {
		return filesOriginName;
	}

	public void setFilesOriginName(String filesOriginName) {
		this.filesOriginName = filesOriginName;
	}

	public String getFilesChangeName() {
		return filesChangeName;
	}

	public void setFilesChangeName(String filesChangeName) {
		this.filesChangeName = filesChangeName;
	}

	public String getFilesPath() {
		return filesPath;
	}

	public void setFilesPath(String filesPath) {
		this.filesPath = filesPath;
	}

	public Date getFilesUploadDate() {
		return filesUploadDate;
	}

	public void setFilesUploadDate(Date filesUploadDate) {
		this.filesUploadDate = filesUploadDate;
	}

	public int getFilesStatus() {
		return filesStatus;
	}

	public void setFilesStatus(int filesStatus) {
		this.filesStatus = filesStatus;
	}

	@Override
	public String toString() {
		return "Files [filesNo=" + filesNo + ", filesReviewNo=" + filesReviewNo + ", filesOriginName=" + filesOriginName
				+ ", filesChangeName=" + filesChangeName + ", filesPath=" + filesPath + ", filesUploadDate="
				+ filesUploadDate + ", filesStatus=" + filesStatus + "]";
	}
}