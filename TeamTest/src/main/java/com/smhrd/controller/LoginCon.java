package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BookDAO;
import com.smhrd.model.BookDTO;


@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		BookDTO dto = new BookDTO(id, pw);
		
		BookDAO dao = new BookDAO();
		
		BookDTO member_info = dao.login_member(dto);
	
		if (member_info.getId() != null) {
			System.out.println("로그인 성공");
			session.setAttribute("nick", member_info.getNick());
			response.sendRedirect("Question4_Main.jsp");
		}else {
			System.out.println("로그인 실패");
			response.sendRedirect("Question4_Login.jsp");
		}
		
	}

}
