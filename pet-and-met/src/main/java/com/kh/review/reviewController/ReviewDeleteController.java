package com.kh.review.reviewController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDeleteController
 */
@WebServlet("/delete.rv")
public class ReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewNo = Integer.parseInt(request.getParameter("rno"));
		// System.out.println(reviewNo);
		int result = new ReviewService().deleteReview(reviewNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "후기 삭제 완료!");
			response.sendRedirect(request.getContextPath() + "/reviewList.rv?currentPage=1");
			
		} else {
			request.getSession().setAttribute("alertMsg", "후기 삭제 실패");
			response.sendRedirect(request.getContextPath() + "/reviewList.rv?currentPage=1");
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
