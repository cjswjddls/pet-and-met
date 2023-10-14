package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class
				.getResource("/sql/member/member-mapper.xml").getPath(); 
		try {
			prop.loadFromXML(
					new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 회원가입
	public int registerMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("registerMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setDate(4, (Date)m.getMemberBirth());
			pstmt.setString(5, m.getMemberPhone());
			pstmt.setString(6, m.getMemberEmail());
			pstmt.setString(7, m.getMemberAddress());
			pstmt.setString(8, m.getMemberAddressDetail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public int duplicateCheck(Connection conn, String checkId) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("duplicateCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}
	
	public Member loginMember(Connection conn, Member m) {
		
		Member loginMember = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			
			rset = pstmt.executeQuery();
			
//			MEMBER_NO
//			MEMBER_ID
//			MEMBER_PWD
//			MEMBER_NAME
//			MEMBER_BIRTH
//			MEMBER_PHONE
//			MEMBER_EMAIL
//			MEMBER_ADDRESS
//			MEMBER_ADDRESS_DETAIL
//			MEMBER_DESCRIPTION
//			MEMBER_JOIN
//			MEMBER_LEAVE
//			MEMBER_STATUS
//			MEMBER_LEAVE_REASON
			
			
			if(rset.next()) {
				loginMember = new Member(
				rset.getInt("MEMBER_NO"),
				rset.getString("MEMBER_ID"),
				rset.getString("MEMBER_PWD"),
				rset.getString("MEMBER_NAME"),
				rset.getDate("MEMBER_BIRTH"),
				rset.getString("MEMBER_PHONE"),
				rset.getString("MEMBER_EMAIL"),
				rset.getString("MEMBER_ADDRESS"),
				rset.getString("MEMBER_ADDRESS_DETAIL"),
				rset.getString("MEMBER_DESCRIPTION"),
				rset.getDate("MEMBER_JOIN"),
				rset.getDate("MEMBER_LEAVE"),
				rset.getString("MEMBER_LEAVE_REASON"),
				rset.getInt("MEMBER_STATUS"),
				rset.getInt("MEMBER_ADMIN")
				);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return loginMember;
	}

}
