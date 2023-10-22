package com.kh.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.Room;

/**
 * Servlet implementation class ReservationRequestController
 */
@WebServlet("/request.resv")
public class ReservationRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationRequestController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// System.out.println(request.getParameter("startDate"));
		
		// 예약 일자
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");	
		int stayDate = Integer.parseInt(request.getParameter("stayDate"));
		
		// System.out.println(request.getParameter("startDate"));
		
		Reservation resvDay = new Reservation();
		
		resvDay.setReservationStartDate(startDate);
		resvDay.setReservationEndDate(endDate);
		resvDay.setReservationStayDate(stayDate);
		
		// 타입별 객실 정보
		String roomType = request.getParameter("roomType");
		int roomSize = Integer.parseInt(request.getParameter("roomSize"));
		int roomFee = Integer.parseInt(request.getParameter("roomFee"));
		
		Room resvType = new Room();
		resvType.setRoomType(roomType);
		resvType.setRoomSize(roomSize);
		resvType.setRoomFee(roomFee);
		
		// 사용자가 선택한 날짜
		request.setAttribute("resvDay", resvDay);
		
		// 사용자가 선택한 객실 정보 
		request.setAttribute("resvType", resvType);
		
		request.getRequestDispatcher("views/reservation/reservationRequestView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}