package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	// 회원가입
	public int registerMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().registerMember(conn, m);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	// 아이디 중복확인
	public int duplicateCheck(String checkId) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().duplicateCheck(conn, checkId);
	
		close(conn);
		
		return count;
	}
	
	// 회원 로그인
	public Member loginMember(Member m) {
		
		Connection conn = getConnection();
		
		Member loginMember = new MemberDao().loginMember(conn, m);
		
		close(conn);
		
		return loginMember;
		
	}
	
	// 아이디 찾기
	public String findMemberId(Member m) {
		
		Connection conn = getConnection();
		
		String resultId = new MemberDao().findMemberId(conn, m);
		
		close(conn);
		
		return resultId;
	}
	
	// 비번찾기
	public Member findMemberPwd(Member m) {
		
		Connection conn = getConnection();
		
		Member member = new MemberDao().findMemberPwd(conn, m);
		
		close(conn);
		
		return member;
		
	}
	
	// 비밀번호 변경
	public int updatePwd(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 회원 탈퇴
	public int withdrawMember(Member loginUser) {
		
		Connection conn = getConnection();
		int result = new MemberDao().withdrawMember(conn, loginUser);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	// 프로필 정보 변경
	public int updateProfile(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateProfile(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	// 관리자 전용 - 전체 회원 수(어드민계정 제외) 추출
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new MemberDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	// 관리자 전용 - 회원 전체 리스트조회
	public ArrayList<Member> selectAllMember(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectAllMember(conn, pi);
		
		close(conn);
		
		return list;
		
	}
	
	// 관리자 - 조건검색한 회원 수
	public int selectByListCount(String con, String search) {
		
		Connection conn = getConnection();
		int listCount = new MemberDao().selectByListCount(conn, con, search);
		
		close(conn);
		
		return listCount;
	}
	
	// 관리자 - 회원 리스트 조건검색
	public ArrayList<Member> selectBy(String con, String search, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectBy(conn, con, search, pi);
		
		close(conn);
		
		return list;
		
	}
	
	// 관리자 - 회원 상세조회
	public Member memberDetailView(int memberNo) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().memberDetailView(conn, memberNo);
		
		close(conn);
		
		return m;	
	}
	
	// 관리자 - 상세조회 - 회원상태 변경
	public int changeMemberStatus(int memberNo, int status) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().changeMemberStatus(conn, memberNo, status);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
