package com.kh.admin.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.review.model.service.AdminReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class reviewListController
 */
@WebServlet("/reviewListController.ad")
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
		else { ArrayList<Review> list = new AdminReviewService().selectReviewList();
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/admin/reviewManage/reviewList.jsp").forward(request, response); }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}