package com.kh.member.registerController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.ParseException;

import com.kh.common.Keys;


/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/register.rg")
public class RegisterFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterFormController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		try { request.setAttribute("googleKey", Keys.read(this.getClass().getResource("").getPath() + "..\\..\\common\\keys\\recaptcha2.json", "key")); }
		catch (IOException e) { e.printStackTrace(); }
		catch (ParseException e) { e.printStackTrace(); }
		request.getRequestDispatcher("views/member/account/register.jsp").forward(request, response);
						
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}