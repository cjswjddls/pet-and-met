package com.kh.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationModifiyResultController
 */
@WebServlet("/modifiyResult.resv")
public class ReservationModifiyResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationModifiyResultController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("loginMember") == null) { // 비로그인 상태
			
			// 1회성 알람문구 활용
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
		
			// 로그인 페이지로 이동
			response.sendRedirect(request.getContextPath()+"/login.mb");
			
		} else { // 로그인 상태 
			
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			String memberPhone = request.getParameter("memberPhone");
			int reservationNo = Integer.parseInt(request.getParameter("reservationNo"));
			
			Reservation resvMemer = new Reservation(reservationNo, memberName, memberEmail, memberPhone);
			
			int result = new ReservationService().updateReservationMemberModify(resvMemer);
					
			Member loginMember = (Member)session.getAttribute("loginMember");
			
			int memberNo = loginMember.getMemberNo();
			
			// System.out.println(memberNo);
			
			ArrayList<Reservation> list = new ReservationService().selectReservationList(memberNo);
			
			request.setAttribute("resvList", list);
			
			if(result > 0) { // 수정 성공		
								
				request.getRequestDispatcher("views/reservation/reservationCheckView.jsp").forward(request, response);
				
			} else {
				
				session.setAttribute("alertMsg", "예약자 수정을 실패했습니다. 다시 시도해주세요.");
				
				request.getRequestDispatcher("views/reservation/reservationCheckView.jsp").forward(request, response);
			}
			
			
		}
		
		
			
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}