package com.kh.review.reviewController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Files;
import com.kh.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewEnrollController
 */
@WebServlet("/reviewEnroll.rv")
public class ReviewEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewEnrollController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) { 
			
			int maxSize = 10*1024*1024; // 최대 용량 10MB
			String savePath = request.getServletContext().getRealPath("resources/img/review/"); // 저장경로
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String reviewAuthor = multiRequest.getParameter("memberNo"); // 작성한 회원번호
			String reviewName = multiRequest.getParameter("reviewName"); // 글제목
			String reviewContent = multiRequest.getParameter("reviewContent"); // 글내용
			
			// 글 작성 정보 객체생성
			Review rev = new Review();
			rev.setReviewAuthor(reviewAuthor);
			rev.setReviewName(reviewName);
			rev.setReviewContent(reviewContent); 
			
			// 첨부파일 객체배열에 저장
			ArrayList<Files> list = new ArrayList<>();
			
			for(int i = 0; i < 4; i++) { // 최대 4개의 첨부파일(upFile + i)
				
				String key = "upFile" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					Files files = new Files();
					
					String originName = multiRequest.getOriginalFileName(key); // 원본파일명
					String changeName = multiRequest.getFilesystemName(key); // 변경파일명
					String filePath = "resources/img/review/"; // 저장경로
					
					// files.setFilesReviewNo(Integer.parseInt(reviewAuthor));
					files.setFilesOriginName(originName);
					files.setFilesChangeName(changeName);
					files.setFilesPath(filePath);
					
					list.add(files);
				}
			}
			
			// 후기 정보, 첨부파일 정보 담아서 넘기기
			int result = new ReviewService().enrollReview(rev, list);
			
			if(result > 0) { // 성공
				request.getSession().setAttribute("alertMsg", "게시글 등록 성공!");
				response.sendRedirect(request.getContextPath() + "/reviewList.rv");
			} else {
				request.getSession().setAttribute("alertMsg", "게시글 등록 실패");
				response.sendRedirect(request.getContextPath() + "/reviewWrite.rv");
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