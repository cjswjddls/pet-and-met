package com.kh.admin.room;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.in.model.service.AdminCheckService;

/**
 * Servlet implementation class checkDelete
 */
@WebServlet("/checkDelete")
public class AdminCheckDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheckDeleteController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rooms = (String)(request.getParameter("ros"));
		
		HttpSession session = request.getSession();
		int result = new AdminCheckService().deleteCheckBox(rooms);
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");	
		
		if(result > 0) { // 성공
			
		String message = "성공적으로 객실이 삭제되었습니다.";
		response.getWriter().println("<script>");
		response.getWriter().println("alert('" + message + "');");
		response.getWriter().println("window.location.href='" + request.getContextPath() + "/check';");
		response.getWriter().println("</script>");
			
			
			
		// session.setAttribute("alertMsg", "성공적으로 객실이 삭제되었습니다.");
		// response.sendRedirect(request.getContextPath() 
		// 								+ "/check");
			
		} else { // 실패
			
		String message = "객실 살제 실패";
		response.getWriter().println("<script>");
		response.getWriter().println("alert('" + message + "');");
		response.getWriter().println("window.location.href='" + request.getContextPath() + "/check';");
		response.getWriter().println("</script>");
			
			
		//	session.setAttribute("errorMsg", "객실 삭제 실패");
		//	request.getRequestDispatcher("views/common/errorPage.jsp")
		//									.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
