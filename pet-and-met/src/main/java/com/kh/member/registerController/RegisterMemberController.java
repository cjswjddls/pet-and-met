package com.kh.member.registerController;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.SHA256;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class RegisterMemberController
 */
@WebServlet("/insertMember.rg")
public class RegisterMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterMemberController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
		
				// 회원정보
				String memberName = request.getParameter("memberName");
				
				String mb = request.getParameter("memberBirth");

				Date memberBirth = Date.valueOf(mb);
						
				String memberPhone
				= "010-"+ request.getParameter("memberPhone1") + "-" + request.getParameter("memberPhone2");
				String memberEmail = request.getParameter("email") + "@" + request.getParameter("domain");
				String memberAddress = request.getParameter("simpleAddress");
				String memberAddressDetail = request.getParameter("detailAddress");
				
				// 계정 정보
				String memberId = request.getParameter("memberId");
				String memberPwd = "";
				try {
					memberPwd = SHA256.encrypt(request.getParameter("memberPwd"));
				} 
				catch (NoSuchAlgorithmException e) { e.printStackTrace(); }
				
				Member m = new Member(memberId, memberPwd, memberName,
						memberBirth, memberPhone, memberEmail, memberAddress, memberAddressDetail);
				
				request.setAttribute("memberName", m.getMemberName());
				
				// 서비스로 넘기기
				int result = new MemberService().registerMember(m);
				
				if(result > 0) { // 성공 시 성공페이지로
					request.getRequestDispatcher("views/member/account/registerSuccess.jsp").forward(request, response);
				} else {
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