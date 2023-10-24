package com.kh.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.Room;

/**
 * Servlet implementation class ReservationListController
 */
@WebServlet("/list.resv")
public class ReservationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationListController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginMember") == null) { // 비로그인 상태
			
			// 1회성 알람문구 활용
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
		
			// 로그인 페이지로 이동
			response.sendRedirect(request.getContextPath()+"/login.mb");
			
		} else { // 로그인 상태
			
			String startDate = (request.getParameter("startDate")).replaceAll("-", "");
			String endDate = (request.getParameter("endDate")).replaceAll("-", "");	
			int stayDate = Integer.parseInt(request.getParameter("stayDateHidden"));
					
			if(stayDate == 0) { // 0박 일경우

				// 다시 메인 홈페이지로 이동/ 실패 알림창 출력
				
				// 1회성 알람문구 활용
				session.setAttribute("alertMsg", "예약은 1박 이상만 가능합니다. 다시 날짜를 선택해주세요.");
				response.sendRedirect(request.getContextPath()+"/main.resv");
				
			} else {
				
				// 받아온 날짜 값 가공
				Reservation resvDay = new Reservation();
				
				resvDay.setReservationStartDate(startDate);
				resvDay.setReservationEndDate(endDate);
				resvDay.setReservationStayDate(stayDate);
				
				// System.out.println(resvDay.getReservationStartDate());
				
				// SELECT 문 실행
				String resvString = new ReservationService().selectReservationDay(resvDay);
				
				String[] resvType = resvString.split("/");
				for(String s:resvType) { System.out.println(s); }
				Room roomTypeA = null;
				Room roomTypeB = null;
				
				// 출력 타입 구별
				if(resvType[0].substring(1,5) == "0000" && resvType[1].substring(1,5) == "0000") { // 출력 없음
					
				} else if(!(resvType[0].substring(1,5).equals("0000")) && resvType[1].substring(1,5).equals("0000")) { // A만 출력			
					roomTypeA = new ReservationService().selectReservationRoom("A");
					
				} else if(resvType[0].substring(1,5).equals("0000") && !(resvType[1].substring(1,5).equals("0000"))) { // B만 출력	
					roomTypeB = new ReservationService().selectReservationRoom("B");
				
				} else { // 둘다 출력
					roomTypeA = new ReservationService().selectReservationRoom("A");
					roomTypeB = new ReservationService().selectReservationRoom("B");
					
					// System.out.println(resvType.substring(3,4));
					// System.out.println(resvType.substring(1,2));
							
				}
				
				// 사용자가 선택한 날짜
				request.setAttribute("resvDay", resvDay);
				
				// 사용자가 이용할수 있는 객실 수
				request.setAttribute("resvType", resvType);
				
				// 각 타입별 객실 정보
				request.setAttribute("roomTypeA", roomTypeA);
				request.setAttribute("roomTypeB", roomTypeB);
				
				// 리스트 뷰로 이동
				request.getRequestDispatcher("views/reservation/reservationListView.jsp").forward(request, response);
			}
			
			
		} // 로그인 상태 if문 }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}