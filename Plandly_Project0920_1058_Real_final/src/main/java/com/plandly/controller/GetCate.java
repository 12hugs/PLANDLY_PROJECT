package com.plandly.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCate extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("category");
		
		System.out.println("카테고리 : " + category);
				
		Map<String, Object> mySession = new HashMap<>();
		
		mySession.put("category", category);
		request.getSession().setAttribute("mySession", mySession);
		
		response.getWriter().write("category");
	}

}
