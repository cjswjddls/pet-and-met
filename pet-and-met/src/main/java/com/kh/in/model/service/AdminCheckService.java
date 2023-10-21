package com.kh.in.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.in.model.dao.AdminCheckDao;
import com.kh.reservation.model.vo.Room;

public class AdminCheckService {
	
	public ArrayList<Room> selectRoomList() {
		
		// 1) Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// 2) Conneciton 객체와 전달값을 넘기면서
		// DAO 로 요청 후 결과 받기
		ArrayList<Room> list = new AdminCheckDao().selectRoomList(conn);
		
		// 3) 트랜잭션 처리 (select 문이므로 패스)
		
		// 4) Connection 객체 반납
		JDBCTemplate.close(conn);
				
		// 5) Controller 단으로 결과 반환
		return list; 
	}

	public int insertRoomA(int roomNo) {
		
		// 1) Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// 2) Connection 과 전달값을 넘기면서 
		// DAO 로 요청 후 결과 받기 1번
		int result = new AdminCheckDao().insertRoomA(conn, roomNo);
		
		
		//3) 트랜잭션 처리
		if(result > 0) {
			
		// 0보다 크면 커밋
		JDBCTemplate.commit(conn);
		
		} else {
			
		// 하나라도 실패하면 롤백
		JDBCTemplate.rollback(conn);
		}
		
		// 5) Connection 반납
		JDBCTemplate.close(conn);
		
		// 6) Controller 단으로 결과 반환
		return result;
	}
	
	
	public int insertRoomB(int roomNo) {
			
			// 1) Connection 객체 생성
			Connection conn = JDBCTemplate.getConnection();
			
			// 2) Connection 과 전달값을 넘기면서 
			// DAO 로 요청 후 결과 받기 1번
			int result = new AdminCheckDao().insertRoomB(conn, roomNo);
			
			
			//3) 트랜잭션 처리
			if(result > 0) {
				
			// 0보다 크면 커밋
			JDBCTemplate.commit(conn);
			
			} else {
				
			// 하나라도 실패하면 롤백
			JDBCTemplate.rollback(conn);
			}
			
			// 5) Connection 반납
			JDBCTemplate.close(conn);
			
			// 6) Controller 단으로 결과 반환
			return result;
		}

	public int deleteCheckBox(String rooms) {
		
		// 1) Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
				
		// 2) Connection 과 전달값을 넘기면서
		// DAO 로 요청 후 결과 받기
		int result = new AdminCheckDao().deleteCheckBox(conn, rooms);
		// 3) 트랜잭션 처리
		if(result > 0) {
					
		JDBCTemplate.commit(conn);
					
		} else {
					
		JDBCTemplate.rollback(conn);
		
		}
				
		// 4) Connection 반납
		JDBCTemplate.close(conn);
				
		// 5) Controller 로 결과 리턴
		return result;
		
	}
		
	
	

}
