package com.kh.admin.room;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.in.model.service.AdminCheckService;
import com.kh.member.model.vo.Member;
import com.kh.reservation.model.vo.Room;

/**
 * Servlet implementation class adminCheckController
 */
@WebServlet("/check")
public class AdminCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheckController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<Room> room = new AdminCheckService().selectRoomList(); 
		if(((session.getAttribute("loginMember")) == null) || (((Member) (session.getAttribute("loginMember"))).getMemberAdmin() == 0)) { session.setAttribute("alertMsg", "접근이 불가능합니다."); response.sendRedirect(request.getContextPath()); }
		else { 
			request.setAttribute("list", room);
			
			request.getRequestDispatcher("views/admin/roomManage/adminCheck.jsp").forward(request, response); }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
