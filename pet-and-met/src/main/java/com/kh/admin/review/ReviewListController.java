package com.kh.admin.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;
import com.kh.review.model.service.AdminReviewService;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class reviewListController
 */
@WebServlet("/reviewListController")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(((session.getAttribute("loginMember")) == null) || (((Member) (session.getAttribute("loginMember"))).getMemberAdmin() == 0)) { session.setAttribute("alertMsg", "접근이 불가능합니다."); response.sendRedirect(request.getContextPath()); }
		else { 
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			int num;
			try { num = Integer.parseInt(request.getParameter("keyword")); }
			catch(Exception e) { num = -1; }
			
			int listCount;	 // 현재 총 게시글의 갯수
			int pageLimit;	 // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
			int boardLimit;	 // 한 페이지에 보여질 게시글의 최대 갯수 (몇개 단위씩)
			int maxPage;	 // 가장 마지막 페이지가 몇번 페이지인지 (즉, 총 페이지 수)
			int startPage;	 // 페이지 하단에 보여질 페이징바의 시작수
			int endPage;	 // 페이지 하단에 보여질 페이징바의 끝수
			
			if(num == -1) {
				listCount = new ReviewService().showReviewCountAll();
				
				request.setAttribute("listCount", listCount);
				
				pageLimit = 5; // 버튼 5개
				boardLimit = 30; // 한페이지당 10개 보여줌
				
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				endPage = startPage + pageLimit - 1;
				
				if(endPage > maxPage) { endPage = maxPage; }
				
				PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				
				ArrayList<Review> list = new AdminReviewService().selectReviewList(pi);
				
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/admin/reviewManage/reviewList.jsp").forward(request, response); 
			}
			else {
				listCount = new ReviewService().showReviewCountAll(num);
				
				request.setAttribute("listCount", listCount);
				
				pageLimit = 5; // 버튼 5개
				boardLimit = 30; // 한페이지당 10개 보여줌
				
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				endPage = startPage + pageLimit - 1;
				
				if(endPage > maxPage) { endPage = maxPage; }
				
				PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				
				ArrayList<Review> list = new AdminReviewService().selectReviewList(pi, num);
				
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/admin/reviewManage/reviewList.jsp").forward(request, response); 
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