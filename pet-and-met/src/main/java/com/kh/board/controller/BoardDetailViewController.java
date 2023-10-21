package com.kh.board.controller;

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

/**
 * Servlet implementation class BoardDetailViewController
 */
@WebServlet("/detail.bo")
public class BoardDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailViewController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		int result = new BoardService().increaseBoardView(boardNo);
		
		if(result > 0) { 
			Board b = new BoardService().selectBoard(boardNo); 
			ArrayList<Attachment> at = new BoardService().selectAttachment(boardNo);
			// Attachment at = new BoardService().selectAttachment(boardNo); 
			request.setAttribute("b", b); 
			request.setAttribute("at", at); 
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response); 
		}
		else { request.setAttribute("errorMsg", "게시글 상세 조회 실패"); request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response); } 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}