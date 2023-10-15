package com.kh.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private int reservationNo;
	private int reservationUserNo;
	private String reservationUserName;
	private String reservationUserPhone;
	private int reservationRoomNo;
	private Date reservationStartDate;
	private Date reservationEndDate;
	private String reservationMemo;
	private Date reservationRegistDate;
	private Date reservationCancelDate;
	private int reservationPaymentStatus;
	
	public Reservation() {}

	public Reservation(int reservationNo, int reservationUserNo, String reservationUserName,
			String reservationUserPhone, int reservationRoomNo, Date reservationStartDate, Date reservationEndDate,
			String reservationMemo, Date reservationRegistDate, Date reservationCancelDate,
			int reservationPaymentStatus) {
		this.reservationNo = reservationNo;
		this.reservationUserNo = reservationUserNo;
		this.reservationUserName = reservationUserName;
		this.reservationUserPhone = reservationUserPhone;
		this.reservationRoomNo = reservationRoomNo;
		this.reservationStartDate = reservationStartDate;
		this.reservationEndDate = reservationEndDate;
		this.reservationMemo = reservationMemo;
		this.reservationRegistDate = reservationRegistDate;
		this.reservationCancelDate = reservationCancelDate;
		this.reservationPaymentStatus = reservationPaymentStatus;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public int getReservationUserNo() {
		return reservationUserNo;
	}

	public void setReservationUserNo(int reservationUserNo) {
		this.reservationUserNo = reservationUserNo;
	}

	public String getReservationUserName() {
		return reservationUserName;
	}

	public void setReservationUserName(String reservationUserName) {
		this.reservationUserName = reservationUserName;
	}

	public String getReservationUserPhone() {
		return reservationUserPhone;
	}

	public void setReservationUserPhone(String reservationUserPhone) {
		this.reservationUserPhone = reservationUserPhone;
	}

	public int getReservationRoomNo() {
		return reservationRoomNo;
	}

	public void setReservationRoomNo(int reservationRoomNo) {
		this.reservationRoomNo = reservationRoomNo;
	}

	public Date getReservationStartDate() {
		return reservationStartDate;
	}

	public void setReservationStartDate(Date reservationStartDate) {
		this.reservationStartDate = reservationStartDate;
	}

	public Date getReservationEndDate() {
		return reservationEndDate;
	}

	public void setReservationEndDate(Date reservationEndDate) {
		this.reservationEndDate = reservationEndDate;
	}

	public String getReservationMemo() {
		return reservationMemo;
	}

	public void setReservationMemo(String reservationMemo) {
		this.reservationMemo = reservationMemo;
	}

	public Date getReservationRegistDate() {
		return reservationRegistDate;
	}

	public void setReservationRegistDate(Date reservationRegistDate) {
		this.reservationRegistDate = reservationRegistDate;
	}

	public Date getReservationCancelDate() {
		return reservationCancelDate;
	}

	public void setReservationCancelDate(Date reservationCancelDate) {
		this.reservationCancelDate = reservationCancelDate;
	}

	public int getReservationPaymentStatus() {
		return reservationPaymentStatus;
	}

	public void setReservationPaymentStatus(int reservationPaymentStatus) {
		this.reservationPaymentStatus = reservationPaymentStatus;
	}

	@Override
	public String toString() {
		return "Reservation [reservationNo=" + reservationNo + ", reservationUserNo=" + reservationUserNo
				+ ", reservationUserName=" + reservationUserName + ", reservationUserPhone=" + reservationUserPhone
				+ ", reservationRoomNo=" + reservationRoomNo + ", reservationStartDate=" + reservationStartDate
				+ ", reservationEndDate=" + reservationEndDate + ", reservationMemo=" + reservationMemo
				+ ", reservationRegistDate=" + reservationRegistDate + ", reservationCancelDate="
				+ reservationCancelDate + ", reservationPaymentStatus=" + reservationPaymentStatus + "]";
	}
}