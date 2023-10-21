package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class PWDFindResultController
 */
@WebServlet("/findPwd.ac")
public class PWDFindResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PWDFindResultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("userId");
		String memberName =  request.getParameter("userName");
		String memberPhone
		= "010-"+ request.getParameter("memberPhone1") + "-" + request.getParameter("memberPhone2");
		String memberEmail = request.getParameter("email") + "@" + request.getParameter("domain");
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberName(memberName);
		m.setMemberPhone(memberPhone);
		m.setMemberEmail(memberEmail);
		
		Member member = new MemberService().findMemberPwd(m);
		
		if(member != null) {			// 회원 조회된 경우
			request.setAttribute("resultNo", member.getMemberNo());
			request.getRequestDispatcher("views/member/account/changPwd.jsp").forward(request, response);
		} else {
			String message = "일치하는 회원이 없습니다. 다시 입력해주세요.";
			response.getWriter().println("<script>");
			response.getWriter().println("alert('" + message + "');");
			response.getWriter().println("window.location.href='" + request.getContextPath() + "/find.ac';");
			response.getWriter().println("</script>");
			
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
