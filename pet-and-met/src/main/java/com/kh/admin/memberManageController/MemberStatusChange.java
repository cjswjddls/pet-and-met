package com.kh.admin.memberManageController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MemberStatusChange
 */
@WebServlet("/statusChange.mm")
public class MemberStatusChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberStatusChange() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// hidden 타입 input으로 회원번호 받아옴
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int status =  Integer.parseInt(request.getParameter("status"));
		int result = new MemberService().changeMemberStatus(memberNo, status);
		
		if(result > 0) {
			// 성공 로직			
			response.sendRedirect(request.getContextPath() + "/detailView.mm?mno=" + memberNo);
		} else {
			// 실패 로직
			response.sendRedirect(request.getContextPath() + "/detailView.mm?mno=" + memberNo);
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
