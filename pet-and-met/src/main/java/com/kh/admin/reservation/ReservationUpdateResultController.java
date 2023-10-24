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
 * Servlet implementation class ReservationUpdateResultController
 */
@WebServlet("/updateResult.resv")
public class ReservationUpdateResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationUpdateResultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		if(((session.getAttribute("loginMember")) == null) || (((Member) (session.getAttribute("loginMember"))).getMemberAdmin() == 0)) { 
			
			session.setAttribute("alertMsg", "접근이 불가능합니다.");
			response.sendRedirect(request.getContextPath()); 
		
		} else {
			
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			String memberPhone = request.getParameter("memberPhone");
			int reservationNo = Integer.parseInt(request.getParameter("reservationNo"));
			
			Reservation resvMemer = new Reservation(reservationNo, memberName, memberEmail, memberPhone);
			
			int result = new ReservationService().updateReservationMemberModify(resvMemer);
			
			if(result > 0) { // 수정 성공		
				
				session.setAttribute("alertMsg", "예약자 수정을 완료했습니다.");
				
				response.sendRedirect(request.getContextPath() + "/adminList.resv?currentPage=" + currentPage);
				
			} else {
				
				session.setAttribute("alertMsg", "예약자 수정을 실패했습니다. 다시 시도해주세요.");
				
				response.sendRedirect(request.getContextPath() + "/adminList.resv?currentPage=" + currentPage);
			}
			
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
