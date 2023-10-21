package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo; // 회원번호
	private String memberId; // 아이디
	private String memberPwd; // 비밀번호
	private String memberName; // 성명
	private Date memberBirth; // 생년월일
	private String memberPhone; // 휴대폰번호
	private String memberEmail; // 이메일
	private String memberAddress; // 주소
	private String memberAddressDetail; // 상세주소
	private String memberDescription; // 회원 소개글
	private Date memberJoin; // 가입일자
	private Date memberLeave; // 탈퇴일자
	private String memberLeaveReason; // 탈퇴사유
	private int memberStatus; // 회원상태
	private int memberAdmin; // 어드민 여부
	// private String userFindQuestion1;
	// private String userFindQuestion2;
	// private String userFindAnswer1;
	// private String userFindAnswer2;
	
	public Member() {}

	public Member(int memberNo, String memberId, String memberPwd, String memberName, Date memberBirth,
			String memberPhone, String memberEmail, String memberAddress, String memberAddressDetail,
			String memberDescription, Date memberJoin, Date memberLeave, String memberLeaveReason, int memberStatus,
			int memberAdmin) {
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberBirth = memberBirth;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberAddress = memberAddress;
		this.memberAddressDetail = memberAddressDetail;
		this.memberDescription = memberDescription;
		this.memberJoin = memberJoin;
		this.memberLeave = memberLeave;
		this.memberLeaveReason = memberLeaveReason;
		this.memberStatus = memberStatus;
		this.memberAdmin = memberAdmin;
	}
	
	public Member(int memberNo, String memberId, String memberPwd, String memberName, Date memberBirth,
			String memberPhone, String memberEmail, String memberAddress, String memberAddressDetail,
			String memberDescription, Date memberJoin, Date memberLeave, String memberLeaveReason, int memberStatus) {
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberBirth = memberBirth;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberAddress = memberAddress;
		this.memberAddressDetail = memberAddressDetail;
		this.memberDescription = memberDescription;
		this.memberJoin = memberJoin;
		this.memberLeave = memberLeave;
		this.memberLeaveReason = memberLeaveReason;
		this.memberStatus = memberStatus;
	}

	// 회원가입 시 생성자
	public Member(String memberId, String memberPwd, String memberName, Date memberBirth, String memberPhone,
			String memberEmail, String memberAddress, String memberAddressDetail) {
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberBirth = memberBirth;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberAddress = memberAddress;
		this.memberAddressDetail = memberAddressDetail;
	}

	// 비번변경용 생성자
	public Member(int memberNo, String memberPwd) {
		this.memberNo = memberNo;
		this.memberPwd = memberPwd;
	}
	
	// 회원리스트 조회용 생성자
	public Member(int memberNo, String memberId, String memberName, String memberPhone, String memberEmail,
			int memberStatus) {
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberStatus = memberStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(Date memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberAddressDetail() {
		return memberAddressDetail;
	}

	public void setMemberAddressDetail(String memberAddressDetail) {
		this.memberAddressDetail = memberAddressDetail;
	}

	public String getMemberDescription() {
		return memberDescription;
	}

	public void setMemberDescription(String memberDescription) {
		this.memberDescription = memberDescription;
	}

	public Date getMemberJoin() {
		return memberJoin;
	}

	public void setMemberJoin(Date memberJoin) {
		this.memberJoin = memberJoin;
	}

	public Date getMemberLeave() {
		return memberLeave;
	}

	public void setMemberLeave(Date memberLeave) {
		this.memberLeave = memberLeave;
	}

	public String getMemberLeaveReason() {
		return memberLeaveReason;
	}

	public void setMemberLeaveReason(String memberLeaveReason) {
		this.memberLeaveReason = memberLeaveReason;
	}

	public int getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus) {
		this.memberStatus = memberStatus;
	}

	public int getMemberAdmin() {
		return memberAdmin;
	}

	public void setMemberAdmin(int memberAdmin) {
		this.memberAdmin = memberAdmin;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", memberBirth=" + memberBirth + ", memberPhone=" + memberPhone + ", memberEmail="
				+ memberEmail + ", memberAddress=" + memberAddress + ", memberAddressDetail=" + memberAddressDetail
				+ ", memberDescription=" + memberDescription + ", memberJoin=" + memberJoin + ", memberLeave="
				+ memberLeave + ", memberLeaveReason=" + memberLeaveReason + ", memberStatus=" + memberStatus
				+ ", memberAdmin=" + memberAdmin + "]";
	}
}