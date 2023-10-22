package com.kh.member.mypageController;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.ProfileImgRenamePolicy;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProfileUpdateController
 */
@WebServlet("/updateExecute.mp")
public class ProfileUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdateController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) { // multipart/form-data일 경우에만 이하 코드 실행
			
			 // 10MB로 용량 제한
			int maxSize = 10*1024*1024;	
			
			// 프로필사진 저장 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/img/profile/");
			
			// 세션에 담긴 회원번호 String 타입으로 가공해서 가져옴
			String memberNo = String.valueOf(((Member)request.getSession().getAttribute("loginMember")).getMemberNo());
				
			// 회원번호.확장자 로 업로드 및 파일이름 수정 
			MultipartRequest multiRequest
			= new MultipartRequest(request, savePath, maxSize, "UTF-8", new ProfileImgRenamePolicy(memberNo));
			
			String memberPhone = multiRequest.getParameter("memberPhone");
			String memberEmail = multiRequest.getParameter("memberEmail");
			String memberAddress = multiRequest.getParameter("memberAddress");
			String memberAddressDetail = multiRequest.getParameter("memberAddressDetail");
			String memberDescription = multiRequest.getParameter("memberDescription");
			
			Member m = (Member) request.getSession().getAttribute("loginMember");

			m.setMemberPhone(memberPhone);
			m.setMemberEmail(memberEmail);
			m.setMemberAddress(memberAddress);
			m.setMemberAddressDetail(memberAddressDetail);
			m.setMemberDescription(memberDescription);
			
			int result = new MemberService().updateProfile(m);
						
			if(result > 0) {
				
				request.getSession().setAttribute("loginMember", m);
				response.sendRedirect(request.getContextPath() + "/updateProfile.mp");
				
			} else {
				
				response.sendRedirect(request.getContextPath());
			}

		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}