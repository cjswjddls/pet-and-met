package com.kh.payment.model.vo;

import java.sql.Date;

public class Payment {
	private int paymentNo;
	private String paymentTID;
	private Date paymentDate;
	private Date paymentCancel;
	private int paymentReservationNo;
	
	public Payment() {}

	public Payment(int paymentNo, String paymentTID, Date paymentDate, Date paymentCancel, int paymentReservationNo) {
		this.paymentNo = paymentNo;
		this.paymentTID = paymentTID;
		this.paymentDate = paymentDate;
		this.paymentCancel = paymentCancel;
		this.paymentReservationNo = paymentReservationNo;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getPaymentTID() {
		return paymentTID;
	}

	public void setPaymentTID(String paymentTID) {
		this.paymentTID = paymentTID;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Date getPaymentCancel() {
		return paymentCancel;
	}

	public void setPaymentCancel(Date paymentCancel) {
		this.paymentCancel = paymentCancel;
	}

	public int getPaymentReservationNo() {
		return paymentReservationNo;
	}

	public void setPaymentReservationNo(int paymentReservationNo) {
		this.paymentReservationNo = paymentReservationNo;
	}

	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", paymentTID=" + paymentTID + ", paymentDate=" + paymentDate
				+ ", paymentCancel=" + paymentCancel + ", paymentReservationNo=" + paymentReservationNo + "]";
	}
}