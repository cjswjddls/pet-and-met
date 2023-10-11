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
}