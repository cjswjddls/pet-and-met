package com.kh.admin.reservation;

import java.io.IOException;
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
 * Servlet implementation class ReservationUpdateController
 */
@WebServlet("/adminUpdate.resv")
public class ReservationUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationUpdateController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		if(((session.getAttribute("loginMember")) == null) || (((Member) (session.getAttribute("loginMember"))).getMemberAdmin() == 0)) { 
			
			session.setAttribute("alertMsg", "접근이 불가능합니다.");
			response.sendRedirect(request.getContextPath()); 
		
		} else {
			
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			int reservationNo = Integer.parseInt(request.getParameter("rno"));
			
			Reservation resvMemer = new ReservationService().selectReservationMemberModify(reservationNo);
			
			int resvMemberNo = resvMemer.getReservationMemberNo();

			String resvMemberId = new ReservationService().selectReservationMemberId(resvMemberNo);
			request.setAttribute("resvMemer", resvMemer);
			request.setAttribute("resvMemberId", resvMemberId);
			request.setAttribute("currentPage", currentPage);
			
			request.getRequestDispatcher("views/admin/reservationManage/reservationUpdateView.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}