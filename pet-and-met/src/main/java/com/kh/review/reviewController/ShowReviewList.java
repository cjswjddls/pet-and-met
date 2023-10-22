package com.kh.review.reviewController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class ShowReviewList
 */
@WebServlet("/reviewList.rv")
public class ShowReviewList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowReviewList() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		// listCount 에 전체 게시글
		listCount = new ReviewService().showReviewCountAll();
		
		request.setAttribute("listCount", listCount);
		
		pageLimit = 5; // 버튼 5개
		
		boardLimit = 10; // 한페이지당 10개 보여줌
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		// 마지막 페이지의 버튼 개수 통제
		if(endPage > maxPage) {
			
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Review> list = new ReviewService().showReviewList(pi);
		
		request.setAttribute("pi", pi);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/review/reviewListAll.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}