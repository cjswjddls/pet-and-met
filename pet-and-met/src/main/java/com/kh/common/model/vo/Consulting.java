package com.kh.common.model.vo;

public class Consulting {
	private int consultingNo;
	private int consultingMemberNo;
	
	public Consulting() {}
	
	public Consulting(int consultingNo, int consultingMemberNo) {
		this.consultingNo = consultingNo;
		this.consultingMemberNo = consultingMemberNo;
	}

	public int getConsultingNo() {
		return consultingNo;
	}
	public void setConsultingNo(int consultingNo) {
		this.consultingNo = consultingNo;
	}
	public int getConsultingMemberNo() {
		return consultingMemberNo;
	}
	public void setConsultingMemberNo(int consultingMemberNo) {
		this.consultingMemberNo = consultingMemberNo;
	}

	@Override
	public String toString() {
		return "Consulting [consultingNo=" + consultingNo + ", consultingMemberNo=" + consultingMemberNo + "]";
	}
}