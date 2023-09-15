package com.plandly.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.plandly.model.Plandly_MemberDAO;
import com.plandly.model.Plandly_MemberVO;

public class MemberChange extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		String nickName = request.getParameter("nickName");
		String pw = request.getParameter("pw");
		
		System.out.println(email + nickName + pw);
		
		Plandly_MemberVO vo = new Plandly_MemberVO(email, nickName, pw);
		Plandly_MemberDAO dao = new Plandly_MemberDAO();
		int cnt = dao.memberChange(vo);
		
		if (cnt > 0) {
		    System.out.println("변경성공");
		    PrintWriter out = response.getWriter();
		    out.print("success"); // "success"라는 문자열을 클라이언트에게 응답으로 보냄
		} else {
		    System.out.println("변경실패");
		    PrintWriter out = response.getWriter();
		    out.print("fail"); // "fail"이라는 문자열을 클라이언트에게 응답으로 보냄
		}
		
	}

}
