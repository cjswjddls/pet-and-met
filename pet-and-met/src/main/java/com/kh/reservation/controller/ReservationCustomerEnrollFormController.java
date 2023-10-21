package com.kh.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationCustomerEnrollFormController
 */
@WebServlet("/customer.resv")
public class ReservationCustomerEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationCustomerEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");	
		int stayDate = Integer.parseInt(request.getParameter("stayDate"));
		String reservationMemo = request.getParameter("reservationMemo");
		
		Reservation resvDay = new Reservation();
		
		resvDay.setReservationStartDate(startDate);
		resvDay.setReservationEndDate(endDate);
		resvDay.setReservationStayDate(stayDate);
		resvDay.setReservationMemo(reservationMemo);
		
		String roomType = request.getParameter("roomType");
		int roomFee = Integer.parseInt(request.getParameter("roomFeeWon"));
		
		// 사용자가 선택한 날짜
		request.setAttribute("resvDay", resvDay);
		
		// 사용자가 선택한 객실 타입
		request.setAttribute("roomType", roomType);
		
		// 사용자가 선택한 예약 금액
		request.setAttribute("roomFee", roomFee);
		
		
		request.getRequestDispatcher("views/reservation/reservationCustomerEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
