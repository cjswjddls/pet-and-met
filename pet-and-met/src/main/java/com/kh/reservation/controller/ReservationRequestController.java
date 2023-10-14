package com.kh.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.reservation.model.service.ReservationService;
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
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// type
		String hiddenTypeA = request.getParameter("hiddenTypeA");
		String hiddenTypeB = request.getParameter("hiddenTypeB");
			
		// test
		// System.out.println(hiddenTypeA);
		// System.out.println(hiddenTypeB);
		
		Room r = null;
		
		if(hiddenTypeA != null && hiddenTypeB == null) {
			
			r = new ReservationService().selectReservation(hiddenTypeA);
			
			// type 정보를 응답데이터로 넘김
			request.setAttribute("type", r);
			
			// 포워딩
			request.getRequestDispatcher("views/reservation/reservationRequestView.jsp").forward(request, response);

		} else if(hiddenTypeB != null && hiddenTypeA == null) {
			
			r = new ReservationService().selectReservation(hiddenTypeB);
		
			// type 정보를 응답데이터로 넘김
			request.setAttribute("type", r);
			
			// 포워딩
			request.getRequestDispatcher("views/reservation/reservationRequestView.jsp").forward(request, response);
			
		} else {
			
			// 알림 만들것
			
			//
			// response.sendRedirect(request.getContextPath()+ "/views/reservation/reservationListView.jsp");
			
			// request.getRequestDispatcher("views/reservation/reservationListView.jsp").forward(request, response);
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
