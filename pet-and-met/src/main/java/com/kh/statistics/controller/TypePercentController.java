package com.kh.statistics.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.statistics.model.service.StatService;
import com.kh.statistics.model.vo.Percent;

/**
 * Servlet implementation class TypePercentController
 */
@WebServlet("/stat.TypePercent")
public class TypePercentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TypePercentController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Percent percent = new StatService().getTypePercent();
		// ArrayList<Percent> p = new ArrayList<>();
		// p.add(percent);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(percent, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}