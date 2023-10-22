package com.kh.admin.room;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.in.model.service.AdminCheckService;

/**
 * Servlet implementation class adminCheckInsertController
 */
@WebServlet("/adminCheckInsertController")
public class AdminCheckInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheckInsertController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1) POST 방식이므로 인코딩 변경 먼저 진행
		request.setCharacterEncoding("UTF-8");
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		int result = new AdminCheckService().insertRoomA(roomNo);
		
		request.getSession().setAttribute("alertMsg", "객실 추가 성공");
		response.sendRedirect(request.getContextPath() + "/check");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}