package com.kh.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private int reservationNo;			//	RESERVATION_NO	NUMBER
	private int reservationMemberNo;	//	MEMBER_NO	NUMBER
	private int reservationRoomNo;		//	ROOM_NO	NUMBER
	private String reservationStartDate;	//	RESERVATION_START_DATE	DATE
	private String reservationEndDate;	//	RESERVATION_END_DATE	DATE
	private int reservationStayDate;	//	RESERVATION_STAY_DATE	NUMBER
	private String reservationMemo;		//	RESERVATION_MEMO	VARCHAR2(1000 BYTE)
	private String reservationUserName;	//	RESERVATION_USER_NAME	VARCHAR2(30 BYTE)
	private String reservationUserEmail;// 	RESERVATION_USER_EMAIL
	private String reservationUserPhone;//	RESERVATION_PHONE	VARCHAR2(16 BYTE)
	private String reservationRegistDate; //	RESERVATION_REGIST_DATE	DATE
	private Date reservationCancelDate; //	RESERVATION_CANCLE_DATE	DATE
	private String reservationType;
	private int reservationFee;
	
	
	// private int reservationPaymentStatus;


	// 생성자부
	public Reservation() {}

	public Reservation(int reservationNo, int reservationMemberNo, int reservationRoomNo, String reservationStartDate,
			String reservationEndDate, int reservationStayDate, String reservationMemo, String reservationUserName,
			String reservationUserEmail, String reservationUserPhone, String reservationRegistDate,
			Date reservationCancelDate) {
		this.reservationNo = reservationNo;
		this.reservationMemberNo = reservationMemberNo;
		this.reservationRoomNo = reservationRoomNo;
		this.reservationStartDate = reservationStartDate;
		this.reservationEndDate = reservationEndDate;
		this.reservationStayDate = reservationStayDate;
		this.reservationMemo = reservationMemo;
		this.reservationUserName = reservationUserName;
		this.reservationUserEmail = reservationUserEmail;
		this.reservationUserPhone = reservationUserPhone;
		this.reservationRegistDate = reservationRegistDate;
		this.reservationCancelDate = reservationCancelDate;
	}
	
	// 예약시 입력받은 값 생성자
	public Reservation(int reservationMemberNo, String reservationStartDate, String reservationEndDate,
			int reservationStayDate, String reservationMemo, String reservationUserName, String reservationUserEmail,
			String reservationUserPhone) {
		this.reservationMemberNo = reservationMemberNo;
		this.reservationStartDate = reservationStartDate;
		this.reservationEndDate = reservationEndDate;
		this.reservationStayDate = reservationStayDate;
		this.reservationMemo = reservationMemo;
		this.reservationUserName = reservationUserName;
		this.reservationUserEmail = reservationUserEmail;
		this.reservationUserPhone = reservationUserPhone;
	}
	
	// 예약 리스트 조회
	public Reservation(int reservationNo, String reservationStartDate, String reservationEndDate,
			int reservationStayDate, String reservationMemo, String reservationUserName, String reservationUserEmail,
			String reservationUserPhone, String reservationRegistDate, String reservationType, int reservationFee) {
		super();
		this.reservationNo = reservationNo;
		this.reservationStartDate = reservationStartDate;
		this.reservationEndDate = reservationEndDate;
		this.reservationStayDate = reservationStayDate;
		this.reservationMemo = reservationMemo;
		this.reservationUserName = reservationUserName;
		this.reservationUserEmail = reservationUserEmail;
		this.reservationUserPhone = reservationUserPhone;
		this.reservationRegistDate = reservationRegistDate;
		this.reservationType = reservationType;
		this.reservationFee = reservationFee;
	}
	
	// 예약할 객실의 예약자 정보 조회
	public Reservation(int reservationNo, String reservationUserName, String reservationUserEmail,
			String reservationUserPhone) {
		super();
		this.reservationNo = reservationNo;
		this.reservationUserName = reservationUserName;
		this.reservationUserEmail = reservationUserEmail;
		this.reservationUserPhone = reservationUserPhone;
	}
	
	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public int getReservationMemberNo() {
		return reservationMemberNo;
	}

	public void setReservationMemberNo(int reservationMemberNo) {
		this.reservationMemberNo = reservationMemberNo;
	}

	public int getReservationRoomNo() {
		return reservationRoomNo;
	}

	public void setReservationRoomNo(int reservationRoomNo) {
		this.reservationRoomNo = reservationRoomNo;
	}

	public String getReservationStartDate() {
		return reservationStartDate;
	}

	public void setReservationStartDate(String reservationStartDate) {
		this.reservationStartDate = reservationStartDate;
	}

	public String getReservationEndDate() {
		return reservationEndDate;
	}

	public void setReservationEndDate(String reservationEndDate) {
		this.reservationEndDate = reservationEndDate;
	}

	public int getReservationStayDate() {
		return reservationStayDate;
	}

	public void setReservationStayDate(int reservationStayDate) {
		this.reservationStayDate = reservationStayDate;
	}

	public String getReservationMemo() {
		return reservationMemo;
	}

	public void setReservationMemo(String reservationMemo) {
		this.reservationMemo = reservationMemo;
	}

	public String getReservationUserName() {
		return reservationUserName;
	}

	public void setReservationUserName(String reservationUserName) {
		this.reservationUserName = reservationUserName;
	}

	public String getReservationUserEmail() {
		return reservationUserEmail;
	}

	public void setReservationUserEmail(String reservationUserEmail) {
		this.reservationUserEmail = reservationUserEmail;
	}

	public String getReservationUserPhone() {
		return reservationUserPhone;
	}

	public void setReservationUserPhone(String reservationUserPhone) {
		this.reservationUserPhone = reservationUserPhone;
	}

	public String getReservationRegistDate() {
		return reservationRegistDate;
	}

	public void setReservationRegistDate(String reservationRegistDate) {
		this.reservationRegistDate = reservationRegistDate;
	}

	public Date getReservationCancelDate() {
		return reservationCancelDate;
	}

	public void setReservationCancelDate(Date reservationCancelDate) {
		this.reservationCancelDate = reservationCancelDate;
	}
	
	public String getReservationType() {
		return reservationType;
	}
	
	public void setReservationType(String reservationType) {
		this.reservationType = reservationType;
	}

	public int getReservationFee() {
		return reservationFee;
	}
	
	public void setReservationFee(int reservationFee) {
		this.reservationFee = reservationFee;
	}

	@Override
	public String toString() {
		return "Reservation [reservationNo=" + reservationNo + ", reservationMemberNo=" + reservationMemberNo
				+ ", reservationRoomNo=" + reservationRoomNo + ", reservationStartDate=" + reservationStartDate
				+ ", reservationEndDate=" + reservationEndDate + ", reservationStayDate=" + reservationStayDate
				+ ", reservationMemo=" + reservationMemo + ", reservationUserName=" + reservationUserName
				+ ", reservationUserEmail=" + reservationUserEmail + ", reservationUserPhone=" + reservationUserPhone
				+ ", reservationRegistDate=" + reservationRegistDate + ", reservationCancelDate="
				+ reservationCancelDate + ", reservationType=" + reservationType + ", reservationFee=" + reservationFee
				+ "]";
	}
	
	
}