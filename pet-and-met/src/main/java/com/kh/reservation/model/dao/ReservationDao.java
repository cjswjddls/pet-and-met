package com.kh.reservation.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.Room;

public class ReservationDao {

	private Properties prop = new Properties();
	
	/**
	 * ReservationDao 기본 생성자에 reservation-mapper.xml 연결
	 */
	public ReservationDao() {
		
		String fileName = ReservationDao.class.getResource("/sql/reservation/reservation-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		
		} catch (IOException e) {
		
			e.printStackTrace();
		}
	}
	
	public Room selectReservationRoom(Connection conn, String type) {
		
		// SELECT 문
		
		// 필요한 변수들 먼저 셋팅
		Room r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 SQL문
		//String sql = prop.getProperty("selectReservationRoom");
		
		String sql = "";
		
		if(type.equals("A")) {
		
			sql = "SELECT ROOM_TYPE, ROOM_FEE, ROOM_SIZE "
				+ "		          FROM ROOM "
				+ "		         WHERE ROOM_TYPE = 'A' "
				+ "		         ORDER BY ROOM_NO";
		} else {

			sql = "SELECT ROOM_TYPE, ROOM_FEE, ROOM_SIZE "
				+ "		          FROM ROOM "
				+ "		         WHERE ROOM_TYPE = 'B' "
				+ "		         ORDER BY ROOM_NO";
		}
		
		// 이 상태에서 예약 기능 구현 후 여기 마지막으로 코드 update 하기!!
		
		// System.out.println(sql);
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			
			// 미완성된 SQL문 완성시키기
			//pstmt.setString(1, type);
			
			// System.out.println(type);
			
			// SQL문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// System.out.println(rset);
			
			if(rset.next()) {
				
				r = new Room(rset.getString("ROOM_TYPE"),
							 rset.getInt("ROOM_FEE"),
							 rset.getInt("ROOM_SIZE"));
			}
			
			// System.out.println(r);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			// 자원 반납
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
	
	// 예약 가능한 날짜 조회 후 객실 타입별 개수
	public String selectReservationDay(Connection conn, Reservation resvDay) {
		
		// SELECT 문

		// 필요한 변수들 먼저 셋팅
		String type = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 SQL문
		String sql = prop.getProperty("selectReservationDay");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, resvDay.getReservationStartDate());
			pstmt.setString(2, resvDay.getReservationStartDate());
			pstmt.setString(3, resvDay.getReservationStartDate());
			pstmt.setString(4, resvDay.getReservationEndDate());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			
				type += rset.getString("ROOM_TYPE")+rset.getInt("COUNT(ROOM_TYPE)");
		
				// System.out.println(type);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return type;
	}
	
	// 예약할 타입의 가능한 객실 번호 조회
	public String selectReservationRoomNo(Connection conn, String roomType, Reservation resv) {
			
		// SELECT 문

		// 필요한 변수들 먼저 셋팅
		String roomNo = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 SQL문
		String sql = prop.getProperty("selectReservationRoomNo");
		
		try {		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, resv.getReservationStartDate());
			pstmt.setString(2, resv.getReservationStartDate());
			pstmt.setString(3, resv.getReservationStartDate());
			pstmt.setString(4, resv.getReservationEndDate());
			pstmt.setString(5, roomType);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				roomNo = rset.getString("ROOM_NO");
			}
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			close(rset);
			close(pstmt);			
		}

		return roomNo;
	}
	
	// 객실 예약
	public int insertReservationRoom(Connection conn, int roomNo, Reservation resv) {
		
		// INSERT 문

		// 필요한 변수들 먼저 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
	
		// 실행할 SQL문
		String sql = prop.getProperty("insertReservationRoom");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, resv.getReservationMemberNo());
			pstmt.setInt(2, roomNo);
			pstmt.setString(3, resv.getReservationStartDate());
			pstmt.setString(4, resv.getReservationEndDate());
			pstmt.setInt(5, resv.getReservationStayDate());
			pstmt.setString(6, resv.getReservationMemo());
			pstmt.setString(7, resv.getReservationUserName());
			pstmt.setString(8, resv.getReservationUserEmail());
			pstmt.setString(9, resv.getReservationUserPhone());
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {

			e.printStackTrace();
		
		} finally {
			
			close(pstmt);
		}
		
		return result;
	
	}
	
	// 예약 리스트 조회
	public ArrayList<Reservation> selectReservationList(Connection conn, int memberNo) {
		
		// SELECT 문

		// 필요한 변수들 먼저 셋팅
		ArrayList<Reservation> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 SQL문
		String sql = prop.getProperty("selectReservationList");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Reservation(rset.getInt("RESERVATION_NO"),
						rset.getString("RESERVATION_START_DATE"),
						rset.getString("RESERVATION_END_DATE"),
						rset.getInt("RESERVATION_STAY_DATE"),
						rset.getString("RESERVATION_MEMO"),
						rset.getString("RESERVATION_USER_NAME"),
						rset.getString("RESERVATION_USER_EMAIL"),
						rset.getString("RESERVATION_PHONE"),
						rset.getString("RESERVATION_REGIST_DATE"),
						rset.getString("ROOM_TYPE"),
						rset.getInt("ROOM_FEE")));
			}
				
		} catch (SQLException e) {

			e.printStackTrace();
		
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;	
	}
	
	
}
