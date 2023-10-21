package com.kh.reservation.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.reservation.model.dao.ReservationDao;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.Room;

public class ReservationService {

	public Room selectReservationRoom(String type) {
		
		// 1) Connection 객체 생성
		Connection conn = getConnection();
		
		// 2) Connection 과 전달값을 넘기면서 DAO 로 요청 후 결과 받기
		Room r = new ReservationDao().selectReservationRoom(conn, type);
		
		// 4) Connection 객체 반납
		close(conn);
		
		// 5) Controller 로 결과 리턴
		return r;
	}
	
	// 예약 가능한 날짜 조회 후 객실 타입별 개수
	public String selectReservationDay(Reservation resvDay) {
		
		// 1) Connection 객체 생성
		Connection conn = getConnection();
		
		// 2) Connection 과 전달값을 넘기면서 DAO 로 요청 후 결과 받기
		String type = new ReservationDao().selectReservationDay(conn, resvDay);
		
		// 4) Connection 객체 반납
		close(conn);
		
		// 5) Controller 로 결과 리턴
		return type;
		
	}
	
	// 예약할 타입의 가능한 객실 번호 조회 
	public String selectReservationRoomNo(String roomType, Reservation resv) {
		
		// 1) Connection 객체 생성
		Connection conn = getConnection();
		
		// 2) Connection 과 전달값을 넘기면서 DAO 로 요청 후 결과 받기
		String roomNo = new ReservationDao().selectReservationRoomNo(conn, roomType, resv);
		
		// 4) Connection 객체 반납
		close(conn);
		
		// 5) Controller 로 결과 리턴
		return roomNo;
	}
	
	// 객실 예약
	public int insertReservationRoom(int roomNo, Reservation resv) {
		
		// 1) Connection 객체 생성
		Connection conn = getConnection();
		
		// 2) Connection 과 전달값을 넘기면서 DAO 로 요청 후 결과 받기
		int result = new ReservationDao().insertReservationRoom(conn, roomNo, resv);
	
		// 3) 트랜잭션 처리
		if(result > 0) {
			
			commit(conn);
		
		} else {
			
			rollback(conn);
		}
		
		// 4) Connection 객체 반납
		close(conn);
		
		// 5) Controller 로 결과 리턴
		return result;
	}
	
	// 예약 리스트 조회
	public ArrayList<Reservation> selectReservationList(int memberNo) {
		
		// 1) Connection 객체 생성
		Connection conn = getConnection();
		
		// 2) Connection 과 전달값을 넘기면서 DAO 로 요청 후 결과 받기
		ArrayList<Reservation> list = new ReservationDao().selectReservationList(conn, memberNo);
		
		// 4) Connection 객체 반납
		close(conn);
		
		// 5) Controller 로 결과 리턴
		return list;
		
	}
	
	
}
