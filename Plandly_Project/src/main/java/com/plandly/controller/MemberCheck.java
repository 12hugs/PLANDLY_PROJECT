package com.plandly.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plandly.model.Plandly_MemberDAO;


public class MemberCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		System.out.println("email : "+email);
		
		boolean check = new Plandly_MemberDAO().idCheck(email);
		
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println();
		System.out.println("아이디체크 서블릿 작동 이상없음");
		
	
	}

}
