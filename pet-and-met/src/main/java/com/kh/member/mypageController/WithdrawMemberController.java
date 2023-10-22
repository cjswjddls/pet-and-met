package com.kh.member.mypageController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class WithdrawMemberController
 */
@WebServlet("/withdraw.mb")
public class WithdrawMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WithdrawMemberController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 현재 로그인된 회원정보
		Member loginUser =  (Member)request.getSession().getAttribute("loginMember");
		loginUser.setMemberLeaveReason(request.getParameter("memberLeaveReason"));
		int result = new MemberService().withdrawMember(loginUser);
		
		if(result > 0) {
			request.getSession().removeAttribute("loginMember");
			request.getRequestDispatcher("views/member/mypage/withdrawSuccess.jsp").forward(request, response);
		} 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}