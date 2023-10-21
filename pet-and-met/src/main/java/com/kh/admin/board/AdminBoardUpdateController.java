package com.kh.admin.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class adminBoardUpdateController
 */
@WebServlet("/update.bo")
public class AdminBoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardUpdateController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if((request.getSession().getAttribute("loginMember") != null) && (((Member)(request.getSession().getAttribute("loginMember"))).getMemberAdmin() == 1)) {
			int bno = Integer.parseInt(request.getParameter("bno"));

			Board b = new BoardService().selectBoard(bno);
			ArrayList<Attachment> att = new BoardService().selectAttachment(bno);
			
			request.setAttribute("board", b);
			request.setAttribute("attachment", att);
			request.getRequestDispatcher("views/board/boardUpdateView.jsp").forward(request, response);
		}
		else {
			request.getSession().setAttribute("alertMsg", "어드민만이 접근가능합니다.");
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