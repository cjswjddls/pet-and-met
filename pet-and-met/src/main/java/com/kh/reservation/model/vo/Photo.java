package com.kh.reservation.model.vo;

import java.sql.Date;

public class Photo {
	private int photoNo;
	private String photoType;
	private String photoOrigin;
	private String photoName;
	private String photoPath;
	private Date photoDate;
	
	public Photo() {}

	public Photo(int photoNo, String photoType, String photoOrigin, String photoName, String photoPath,
			Date photoDate) {
		this.photoNo = photoNo;
		this.photoType = photoType;
		this.photoOrigin = photoOrigin;
		this.photoName = photoName;
		this.photoPath = photoPath;
		this.photoDate = photoDate;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public String getPhotoType() {
		return photoType;
	}

	public void setPhotoType(String photoType) {
		this.photoType = photoType;
	}

	public String getPhotoOrigin() {
		return photoOrigin;
	}

	public void setPhotoOrigin(String photoOrigin) {
		this.photoOrigin = photoOrigin;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public Date getPhotoDate() {
		return photoDate;
	}

	public void setPhotoDate(Date photoDate) {
		this.photoDate = photoDate;
	}

	@Override
	public String toString() {
		return "Photo [photoNo=" + photoNo + ", photoType=" + photoType + ", photoOrigin=" + photoOrigin
				+ ", photoName=" + photoName + ", photoPath=" + photoPath + ", photoDate=" + photoDate + "]";
	}
}