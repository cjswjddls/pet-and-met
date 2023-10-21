package com.kh.admin.memberManageController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class UserListAllContoller
 */
@WebServlet("/listAll.mm")
public class MemberListContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListContoller() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(((session.getAttribute("loginMember")) == null) || (((Member) (session.getAttribute("loginMember"))).getMemberAdmin() == 0)) {
				session.setAttribute("alertMsg", "접근이 불가능합니다."); response.sendRedirect(request.getContextPath()); }
		else {
			
			ArrayList<Member> list = new MemberService().selectAllMember();	
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/admin/memberManage/memberListView.jsp").forward(request, response);
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
