package com.kh.member.mypageController;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.SHA256;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberPwdUpdateController
 */
@WebServlet("/updatePwdExecute.mp")
public class MemberPwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdUpdateController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		// 세션에 담긴 회원번호 추출
		int memberNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		
		// 사용자가 입력한 새 비밀번호 변수 초기화
		String newMemberPwd = "";
		try {
			// 복호화 후 대입
			newMemberPwd = SHA256.encrypt(request.getParameter("newMemberPwd"));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		Member m = new Member();
		m.setMemberNo(memberNo);
		m.setMemberPwd(newMemberPwd);
		
		int result = new MemberService().updatePwd(m);
		
		if(result > 0) {
			String message = "비밀번호가 성공적으로 변경되었습니다";
			response.getWriter().println("<script>");
			response.getWriter().println("alert('" + message + "');");
			response.getWriter().println("window.location.href='" + request.getContextPath() + "/main.mp';");
			response.getWriter().println("</script>");
		} else {
			String message = "비밀번호 변경에 실패했습니다. 다시 확인해주시기 바랍니다.";
			response.getWriter().println("<script>");
			response.getWriter().println("alert('" + message + "');");
			response.getWriter().println("window.location.href='" + request.getContextPath() + "/updatePwd.mp';");
			response.getWriter().println("</script>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}