package com.kh.payment.model.vo;

import java.sql.Date;

public class Payment {
	private int paymentNo;
	private String paymentTID;
	private String paymentAID;
	private String paymentMethod;
	private Date paymentDate;
	private Date paymentCancel;
	private String paymentApproved;
	private int paymentReservationNo;
	private int paymentUserNo;
	private int paymentStatusCode;
	
	public Payment() {}

	public Payment(int paymentNo, String paymentTID, String paymentAID, String paymentMethod, Date paymentDate,
			Date paymentCancel, String paymentApproved, int paymentReservationNo, int paymentUserNo,
			int paymentStatusCode) {
		this.paymentNo = paymentNo;
		this.paymentTID = paymentTID;
		this.paymentAID = paymentAID;
		this.paymentMethod = paymentMethod;
		this.paymentDate = paymentDate;
		this.paymentCancel = paymentCancel;
		this.paymentApproved = paymentApproved;
		this.paymentReservationNo = paymentReservationNo;
		this.paymentUserNo = paymentUserNo;
		this.paymentStatusCode = paymentStatusCode;
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

	public String getPaymentAID() {
		return paymentAID;
	}

	public void setPaymentAID(String paymentAID) {
		this.paymentAID = paymentAID;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
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

	public String getPaymentApproved() {
		return paymentApproved;
	}

	public void setPaymentApproved(String paymentApproved) {
		this.paymentApproved = paymentApproved;
	}

	public int getPaymentReservationNo() {
		return paymentReservationNo;
	}

	public void setPaymentReservationNo(int paymentReservationNo) {
		this.paymentReservationNo = paymentReservationNo;
	}

	public int getPaymentUserNo() {
		return paymentUserNo;
	}

	public void setPaymentUserNo(int paymentUserNo) {
		this.paymentUserNo = paymentUserNo;
	}

	public int getPaymentStatusCode() {
		return paymentStatusCode;
	}

	public void setPaymentStatusCode(int paymentStatusCode) {
		this.paymentStatusCode = paymentStatusCode;
	}

	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", paymentTID=" + paymentTID + ", paymentAID=" + paymentAID
				+ ", paymentMethod=" + paymentMethod + ", paymentDate=" + paymentDate + ", paymentCancel="
				+ paymentCancel + ", paymentApproved=" + paymentApproved + ", paymentReservationNo="
				+ paymentReservationNo + ", paymentUserNo=" + paymentUserNo + ", paymentStatusCode=" + paymentStatusCode
				+ "]";
	}
}