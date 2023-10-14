package com.kh.reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
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
	
	public Room selectReservation(Connection conn, String type) {
		
		// SELECT 문
		
		// 필요한 변수들 먼저 셋팅
		Room r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 SQL문
		String sql = prop.getProperty("selectReservation");
		
		System.out.println(sql);
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			
			// 미완성된 SQL문 완성시키기
			pstmt.setString(1, type);
			
			System.out.println(type);
			
			// SQL문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			System.out.println(rset);
			
			if(rset.next()) {
				
				r = new Room(rset.getString("ROOM_TYPE"),
							 rset.getInt("ROOM_FEE"),
							 rset.getInt("ROOM_SIZE"));
			}
			
			System.out.println(r);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			// 자원 반납
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	
	
}
