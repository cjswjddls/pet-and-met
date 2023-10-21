package com.kh.in.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.reservation.model.vo.Room;

public class AdminCheckDao {
		
	// 쿼리문들을 키 + 밸류 세트로 담는 Properties 객체 생성 (전역)
		private Properties prop = new Properties();
		
		// 선행 코드들을 정의해둔 기본생성자
		// => BoardDao 클래스의 모든 메소드가 호출되기 전
		//	  반드시 기본생성자가 한번 호출되야되기 때문 (객체 생성 우선)
		public AdminCheckDao() {
			
			String fileName = AdminCheckDao.class.getResource("/sql/room/room-mapper.xml").getPath();
					
			try {
				prop.loadFromXML(new FileInputStream(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		public ArrayList<Room> selectRoomList(Connection conn) {
			
			// select 문 => ResultSet 객체
			// => ArrayLsit<Room>
			
			// 필요한 변수들 먼저 셋팅
			ArrayList<Room> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			// 실행할 SQL문 
			String sql = prop.getProperty("selectRoomList");
			
			// PreparedStatement 객체 생성
			try {
				pstmt = conn.prepareStatement(sql);
				
				// SQL문 실행 후 결과 받기
				// select문 : executeQuery 메소드
				rset = pstmt.executeQuery();
				
			while(rset.next()) {
					
				list.add(new Room(rset.getInt("ROOM_NO"),
								rset.getString("ROOM_TYPE"),
								rset.getInt("ROOM_FEE"),
								rset.getInt("ROOM_USEABLE"),
								rset.getInt("ROOM_SIZE")));
				}
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				
				// JDBC용 자원 반납 (역순)
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
				
			}
			
			// Service 단으로 결과 반환 
			return list;
		}

		public int insertRoomA(Connection conn, int roomNo) {
			
			// INSERT 문 = > 처리된 행의 갯수 (int) 
			
			// 필요한 변수들 먼저 셋팅
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertRoomA");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, roomNo);
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				
				JDBCTemplate.close(pstmt);
			}
			return result;
		}

		public int insertRoomB(Connection conn, int roomNo) {
			
			// INSERT 문 = > 처리된 행의 갯수 (int) 
			
			// 필요한 변수들 먼저 셋팅
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertRoomB");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, roomNo);
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				
				JDBCTemplate.close(pstmt);
			}
			return result;
		
		
	
	
		}

		public int deleteCheckBox(Connection conn, String rooms) {
			
			// UPDATE 문 => 처리된 행의 갯수 (int)
			
			// 필요한 변수 먼저 셋팅
			int result = 0;
			PreparedStatement pstmt = null;
			
			// 실행할 SQL문
			String sql = prop.getProperty("deleteCheckBox");
			
			// PreparedStatement 객체 생성
			try {
								
				for(String s:rooms.split("/")) {
					pstmt = conn.prepareStatement(sql);
					// 미완성된 쿼리문 완성 
					pstmt.setInt(1, Integer.parseInt(s));
					// 쿼리문 실행 후 결과 받기
					// update문 : executeUpdate 메소드
					result += pstmt.executeUpdate();
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				// JDBC 용 자원 반납
				JDBCTemplate.close(pstmt);
			}
			// Service 단으로 결과 리턴
			return result;
		}
}