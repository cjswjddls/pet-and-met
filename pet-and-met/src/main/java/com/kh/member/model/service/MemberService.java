package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

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

}
