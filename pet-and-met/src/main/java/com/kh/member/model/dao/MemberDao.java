package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class
				.getResource("/sql/member/member-mapper.xml").getPath(); 
		try {
			prop.loadFromXML(new FileInputStream(fileName));
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
	
	// 아이디찾기
	public String findMemberId(Connection conn, Member m) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String resultId = null;
		
		String sql = prop.getProperty("findMemberId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getMemberEmail());
			pstmt.setString(3, m.getMemberPhone());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				resultId = rset.getString("MEMBER_ID");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
	
		return resultId;
	}
	
	// 비번찾기
	public Member findMemberPwd(Connection conn, Member m) {
		
		Member member = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findMemberPwd");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3, m.getMemberEmail());
			pstmt.setString(4, m.getMemberPhone());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(rset.getInt("MEMBER_NO"),
														  rset.getString("MEMBER_PWD"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return member;
		
	}
	
	// 비밀번호 변경
	public int updatePwd(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberPwd());
			pstmt.setInt(2, m.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 회원탈퇴(상태변경)
	public int withdrawMember(Connection conn, Member loginUser) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("withdrawMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginUser.getMemberLeaveReason());
			pstmt.setInt(2, loginUser.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}	
		
		return result;
	}
	
	// 프로필 정보 변경
	public int updateProfile(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberPhone());
			pstmt.setString(2, m.getMemberEmail());
			pstmt.setString(3, m.getMemberAddress());
			pstmt.setString(4, m.getMemberAddressDetail());
			pstmt.setString(5, m.getMemberDescription());
			pstmt.setInt(6, m.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	// 관리자 전용 - 전체 회원 수 조회
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}
	
	
	// 관리자 전용 - 회원 전체 리스트조회
	public ArrayList<Member> selectAllMember(Connection conn, PageInfo pi){
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) 
					  * pi.getBoardLimit() + 1;
			int endRow = startRow 
					 + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(
						rset.getInt("MEMBER_NO"),
						rset.getString("MEMBER_ID"),
						rset.getString("MEMBER_NAME"),
						rset.getString("MEMBER_PHONE"),
						rset.getString("MEMBER_EMAIL"),
						rset.getInt("MEMBER_STATUS")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	// 관리자 전용 - 조건검색된 회원 수
	public int selectByListCount(Connection conn, String con, String search) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		if(con.equals("id")) { // 아이디로 검색했다면
			sql = prop.getProperty("selectByIdCount");
		} else { // 이름으로 검색했다면
			sql = prop.getProperty("selectByNameCount");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + search + "%");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}
	
	// 관리자 전용 - 회원 조건검색
	public ArrayList<Member> selectBy(Connection conn, String con, String search, PageInfo pi) {
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		if(con.equals("id")) { // 아이디 검색을 선택했다면
			sql = prop.getProperty("selectById");
		} else { // 이름 검색을 선택했다면
			sql = prop.getProperty("selectByName");
		}
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) 
					  * pi.getBoardLimit() + 1;
			int endRow = startRow 
					 + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Member(
						rset.getInt("MEMBER_NO"),
						rset.getString("MEMBER_ID"),
						rset.getString("MEMBER_NAME"),
						rset.getString("MEMBER_PHONE"),
						rset.getString("MEMBER_EMAIL"),
						rset.getInt("MEMBER_STATUS")
						));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;		
	}
	
	// 관리자 - 회원 상세조회
	public Member memberDetailView(Connection conn, int memberNo) {
		
		Member m = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("memberDetailView");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				m.setMemberNo(memberNo);
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setMemberPhone(rset.getString("MEMBER_PHONE"));
				m.setMemberAddress(rset.getString("MEMBER_ADDRESS") + " | " + rset.getString("MEMBER_ADDRESS_DETAIL"));
				m.setMemberEmail(rset.getString("MEMBER_EMAIL"));
				m.setMemberJoin(rset.getDate("MEMBER_JOIN"));
				m.setMemberStatus(rset.getInt("MEMBER_STATUS"));
				m.setMemberLeave(rset.getDate("MEMBER_LEAVE"));
				m.setMemberLeaveReason(rset.getString("MEMBER_LEAVE_REASON"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;		
	}
	
	// 관리자 - 상세조회 - 회원상태변경
	public int changeMemberStatus(Connection conn, int memberNo, int status) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changeMemberStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}