package com.kh.admin.reservation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationListViewController
 */
@WebServlet("/adminList.resv")
public class ReservationListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationListViewController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(((session.getAttribute("loginMember")) == null) || (((Member) (session.getAttribute("loginMember"))).getMemberAdmin() == 0)) { session.setAttribute("alertMsg", "접근이 불가능합니다."); response.sendRedirect(request.getContextPath()); }
		else {
			int listCount;
			int currentPage;
			int pageLimit;
			int boardLimit;
			
			int maxPage;
			int startPage;
			int endPage;
			
			listCount = new ReservationService().selectListCount();
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			pageLimit = 10; boardLimit = 30;
			maxPage = (int)Math.ceil((double)listCount / boardLimit);
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			endPage = startPage + pageLimit - 1;
			if(endPage > maxPage) { endPage = maxPage; }
			PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			
			ArrayList<Reservation> list = new ReservationService().selectReservationListAll(pi);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/admin/reservationManage/reservationListView.jsp").forward(request, response); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}