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
 * Servlet implementation class IDFindResultController
 */
@WebServlet("/findID.ac")
public class IDFindResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IDFindResultController() {
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
		
		String memberName =  request.getParameter("userName");
		String memberPhone
		= "010-"+ request.getParameter("phone1") + "-" + request.getParameter("phone2");
		String memberEmail = request.getParameter("email") + "@" + request.getParameter("domain");
		
		Member m = new Member();
		m.setMemberName(memberName);
		m.setMemberPhone(memberPhone);
		m.setMemberEmail(memberEmail);
		
		String resultId = new MemberService().findMemberId(m);
		
		
		if(resultId != null ) {
			request.setAttribute("resultId", resultId);
			request.getRequestDispatcher("views/member/account/IDFindResult.jsp").forward(request, response);
		} else {
			request.setAttribute("failMsg", "조회된 회원이 없습니다. 다시 입력해주세요");
			request.getRequestDispatcher("views/member/account/IDFindResult.jsp").forward(request, response);
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
