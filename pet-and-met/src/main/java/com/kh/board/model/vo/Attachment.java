package com.kh.board.model.vo;

import java.sql.Date;

public class Attachment {
	private int attachmentNo;
	private int attachmentBoardNo;
	private String attachmentOriginName;
	private String attachmentChangeName;
	private String attachmentFilePath;
	private Date attachmentUploadDate;
	private String attachmentStatus;
	
	public Attachment() {}
	
	public Attachment(int attachmentNo, int attachmentBoardNo, String attachmentOriginName, String attachmentChangeName,
			String attachmentFilePath, Date attachmentUploadDate, String attachmentStatus) {
		this.attachmentNo = attachmentNo;
		this.attachmentBoardNo = attachmentBoardNo;
		this.attachmentOriginName = attachmentOriginName;
		this.attachmentChangeName = attachmentChangeName;
		this.attachmentFilePath = attachmentFilePath;
		this.attachmentUploadDate = attachmentUploadDate;
		this.attachmentStatus = attachmentStatus;
	}

	public Attachment(int attachmentNo, String attachmentOriginName, String attachmentChangeName,
			String attachmentFilePath) {
		this.attachmentNo = attachmentNo;
		this.attachmentOriginName = attachmentOriginName;
		this.attachmentChangeName = attachmentChangeName;
		this.attachmentFilePath = attachmentFilePath;
	}

	public int getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public int getAttachmentBoardNo() {
		return attachmentBoardNo;
	}

	public void setAttachmentBoardNo(int attachmentBoardNo) {
		this.attachmentBoardNo = attachmentBoardNo;
	}

	public String getAttachmentOriginName() {
		return attachmentOriginName;
	}

	public void setAttachmentOriginName(String attachmentOriginName) {
		this.attachmentOriginName = attachmentOriginName;
	}

	public String getAttachmentChangeName() {
		return attachmentChangeName;
	}

	public void setAttachmentChangeName(String attachmentChangeName) {
		this.attachmentChangeName = attachmentChangeName;
	}

	public String getAttachmentFilePath() {
		return attachmentFilePath;
	}

	public void setAttachmentFilePath(String attachmentFilePath) {
		this.attachmentFilePath = attachmentFilePath;
	}

	public Date getAttachmentUploadDate() {
		return attachmentUploadDate;
	}

	public void setAttachmentUploadDate(Date attachmentUploadDate) {
		this.attachmentUploadDate = attachmentUploadDate;
	}

	public String getAttachmentStatus() {
		return attachmentStatus;
	}

	public void setAttachmentStatus(String attachmentStatus) {
		this.attachmentStatus = attachmentStatus;
	}

	@Override
	public String toString() {
		return "Attachment [attachmentNo=" + attachmentNo + ", attachmentBoardNo=" + attachmentBoardNo
				+ ", attachmentOriginName=" + attachmentOriginName + ", attachmentChangeName=" + attachmentChangeName
				+ ", attachmentFilePath=" + attachmentFilePath + ", attachmentUploadDate=" + attachmentUploadDate
				+ ", attachmentStatus=" + attachmentStatus + "]";
	}
}