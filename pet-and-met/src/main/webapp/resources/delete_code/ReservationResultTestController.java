package com.kh.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationResultTestController
 */
@WebServlet("/test.resv")
public class ReservationResultTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationResultTestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String memberName = request.getParameter("memberName");
		String memberEmail = request.getParameter("memberEmail");
		String memberPhone = request.getParameter("memberPhone");
		
		String reservationStartDate = request.getParameter("startDate");
		String reservationEndDate = request.getParameter("endDate");
		int reservationStayDate = Integer.parseInt(request.getParameter("stayDate"));
		String reservationMemo = request.getParameter("reservationMemo");
		
		System.out.println(reservationMemo);
		
		String roomType = request.getParameter("roomType");
		
		// Reservation VO 로 가공하기
		Reservation resv = new Reservation(memberNo, reservationStartDate, reservationEndDate
										 , reservationStayDate, reservationMemo, memberName, memberEmail
										 , memberPhone);
		
		String roomNo = new ReservationService().selectReservationRoomNo(roomType, resv);
		
		if(roomNo != null) { // 예약 가능한 객실 번호가 있을 경우
			
			int roomNum = Integer.parseInt(roomNo);
			
			int result = new ReservationService().insertReservationRoom(roomNum, resv);
			
			if(result > 0) { // 예약 성공
				
				request.getRequestDispatcher("views/reservation/reservationResultTest.jsp").forward(request, response);
				
			} else { // 예약 실패
				
				// 1회성 알람문구 활용
				session.setAttribute("alertMsg", "예약을 실패했습니다. 다시 예약해주세요.");
				
				// 로그인 페이지로 이동
				response.sendRedirect(request.getContextPath());
				
			}
			
			
		} else { // 예약 가능한 객실 번호가 없을 경우
			
			// 다시 예약 검색으로?
			// 1회성 알람문구 활용
			session.setAttribute("alertMsg", "선택한 날짜에 예약가능한 객실이 없습니다. 다시 예약해주세요.");
			
			// 로그인 페이지로 이동
			response.sendRedirect(request.getContextPath()+"/list.resv");
			
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
