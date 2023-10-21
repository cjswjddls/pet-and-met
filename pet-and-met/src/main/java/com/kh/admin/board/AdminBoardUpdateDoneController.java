package com.kh.admin.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminBoardUpdateDoneController
 */
@WebServlet("/updateDone.bo")
public class AdminBoardUpdateDoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardUpdateDoneController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 시간상 첨부파일은 그대로 내비두고
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/img/board/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int bno = Integer.parseInt(multiRequest.getParameter("boardNo"));
			String bname = multiRequest.getParameter("title");
			String bcontent = multiRequest.getParameter("content");
			int baccent = (multiRequest.getParameter("isAccent") != null)?1:0;;
			
			int result = new BoardService().updateBoard(bno, bname, bcontent, baccent);
			
			if(result > 0) { request.getSession().setAttribute("alertMsg", "공지사항 수정됨"); }
			else { request.getSession().setAttribute("alertMsg", "공지사항 수정 실패"); }
			
			response.sendRedirect(request.getContextPath() + "/lists.bo?currentPage=1&keyword=&method=");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}