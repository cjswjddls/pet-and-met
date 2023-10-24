package com.kh.admin.review;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.review.model.service.AdminReviewService;

/**
 * Servlet implementation class AdminReviewDeleteController
 */
@WebServlet("/AdminReviewDeleteController")
public class AdminReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewDeleteController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String review = (String)(request.getParameter("rev"));
		
		HttpSession session = request.getSession();
		int result = new AdminReviewService().deleteCheckBox(review);
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
		
	    session.setAttribute("alertMsg", "게시글 삭제완료");
	    response.sendRedirect(request.getContextPath() + "/reviewListController");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}