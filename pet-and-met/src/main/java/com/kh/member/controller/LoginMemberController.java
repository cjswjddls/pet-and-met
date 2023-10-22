package com.kh.member.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.SHA256;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginMemberController
 */
@WebServlet("/getLogin.mb")
public class LoginMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMemberController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("userId");
		String memberPwd = "";
		try {
			memberPwd = SHA256.encrypt(request.getParameter("userPwd"));
		} 
		catch (NoSuchAlgorithmException e) { e.printStackTrace(); }
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPwd(memberPwd);
		
		Member loginMember = new MemberService().loginMember(m);
		
		if(loginMember == null) { // 일치하는 회원이 없는 경우
			// 로그인 실패메세지 jsp로 전달
			String message = "아이디 혹은 비밀번호가 일치하지 않습니다. 다시 입력해주세요.";
			response.getWriter().println("<script>");
			response.getWriter().println("alert('" + message + "');");
			response.getWriter().println("window.location.href='" + request.getContextPath() + "/login.mb';");
			response.getWriter().println("</script>");

		} else {
			request.getSession().setAttribute("loginMember", loginMember);
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}