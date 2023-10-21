package com.kh.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReservationMainController
 */
@WebServlet("/main.resv")
public class ReservationMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationMainController() {
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
		
			request.getRequestDispatcher("views/reservation/reservationMainView.jsp").forward(request, response);
			
		}
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}