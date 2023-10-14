package com.kh.reservation.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.reservation.model.dao.ReservationDao;
import com.kh.reservation.model.vo.Room;

public class ReservationService {

	public Room selectReservation(String type) {
		
		// 1) Connection 객체 생성
		Connection conn = getConnection();
		
		// 2) Connection 과 전달값을 넘기면서 DAO 로 요청 후 결과 받기
		Room r = new ReservationDao().selectReservation(conn, type);
		
		// 4) Connection 객체 반납
		close(conn);
		
		// 5) Controller 로 결과 리턴
		return r;
	}
}
