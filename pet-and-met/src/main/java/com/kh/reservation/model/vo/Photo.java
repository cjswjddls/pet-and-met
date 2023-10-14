package com.kh.reservation.model.vo;

import java.sql.Date;

public class Photo {
	private int photoNo;
	private int photoRoomNo;
	private String photoOriginName;
	private String photoChangeName;
	private String photoPath;
	private Date photoUploadDate;
	private String photoStatus;
	
	public Photo() {}

	public Photo(int photoNo, int photoRoomNo, String photoOriginName, String photoChangeName, String photoPath,
			Date photoUploadDate, String photoStatus) {
		this.photoNo = photoNo;
		this.photoRoomNo = photoRoomNo;
		this.photoOriginName = photoOriginName;
		this.photoChangeName = photoChangeName;
		this.photoPath = photoPath;
		this.photoUploadDate = photoUploadDate;
		this.photoStatus = photoStatus;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public int getPhotoRoomNo() {
		return photoRoomNo;
	}

	public void setPhotoRoomNo(int photoRoomNo) {
		this.photoRoomNo = photoRoomNo;
	}

	public String getPhotoOriginName() {
		return photoOriginName;
	}

	public void setPhotoOriginName(String photoOriginName) {
		this.photoOriginName = photoOriginName;
	}

	public String getPhotoChangeName() {
		return photoChangeName;
	}

	public void setPhotoChangeName(String photoChangeName) {
		this.photoChangeName = photoChangeName;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public Date getPhotoUploadDate() {
		return photoUploadDate;
	}

	public void setPhotoUploadDate(Date photoUploadDate) {
		this.photoUploadDate = photoUploadDate;
	}

	public String getPhotoStatus() {
		return photoStatus;
	}

	public void setPhotoStatus(String photoStatus) {
		this.photoStatus = photoStatus;
	}

	@Override
	public String toString() {
		return "Photo [photoNo=" + photoNo + ", photoRoomNo=" + photoRoomNo + ", photoOriginName=" + photoOriginName
				+ ", photoChangeName=" + photoChangeName + ", photoPath=" + photoPath + ", photoUploadDate="
				+ photoUploadDate + ", photoStatus=" + photoStatus + "]";
	}
}