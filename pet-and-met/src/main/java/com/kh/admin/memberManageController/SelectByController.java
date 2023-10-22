package com.kh.admin.memberManageController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class SelectByController
 */
@WebServlet("/selectBy.mm")
public class SelectByController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectByController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 검색조건 - id / name
		String con = request.getParameter("selected");
		// 검색값
		String search = request.getParameter("search");
		
	    int currentPage; // 기본값 설정
	    
	    if (request.getParameter("currentPage") != null && !request.getParameter("currentPage").isEmpty()) {
	        currentPage = Integer.parseInt(request.getParameter("currentPage"));
	    }
	    else { currentPage = 1; }
		
		int listCount;	 // 현재 총 게시글의 갯수
		int pageLimit;	 // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
		int boardLimit;	 // 한 페이지에 보여질 게시글의 최대 갯수 (몇개 단위씩)
		int maxPage;	 // 가장 마지막 페이지가 몇번 페이지인지 (즉, 총 페이지 수)
		int startPage;	 // 페이지 하단에 보여질 페이징바의 시작수
		int endPage;	 // 페이지 하단에 보여질 페이징바의 끝수
		
		// listCount 에 전체 회원수 담김
		listCount = new MemberService().selectByListCount(con, search);
		
		request.setAttribute("memberCount", listCount);
		
		pageLimit = 5; // 버튼 5개
		
		boardLimit = 30; // 한페이지당 30명 보여줌
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		// 마지막 페이지의 버튼 개수 통제
		if(endPage > maxPage) {
			
			endPage = maxPage;
		}
		
		PageInfo pi
		= new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		System.out.println(pi);
		
		ArrayList<Member> list = new MemberService().selectBy(con, search, pi);
		
		request.setAttribute("pi", pi);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/admin/memberManage/memberListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
