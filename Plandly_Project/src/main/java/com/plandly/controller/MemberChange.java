package com.plandly.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.plandly.model.Plandly_MemberDAO;
import com.plandly.model.Plandly_MemberVO;

public class MemberChange extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");

		Map<String, Object> mySession = (Map<String, Object>) request.getSession().getAttribute("mySession");

		String email = (String) mySession.get("loginEmail");

		String nowPwInput = request.getParameter("nowPwInput");
		System.out.println("지금비번 : " + nowPwInput);
		String nowPw = (String) mySession.get("loginPw");
		String nowNick = (String) mySession.get("loginNick");

		if (nowPwInput.equals(nowPw)) {

			String pw = request.getParameter("pw");
			String age = request.getParameter("age");
			String gender = request.getParameter("gender");
			String nickName = request.getParameter("nickname");

			System.out.println(pw + age + gender + nickName);

			Plandly_MemberVO vo = new Plandly_MemberVO(email, pw, age, gender, nickName);
			Plandly_MemberDAO dao = new Plandly_MemberDAO();
			int cnt = dao.memberChange(vo);

			if (cnt > 0) {
				System.out.println("변경성공");
				PrintWriter out = response.getWriter();
				out.print("success"); // "success"라는 문자열을 클라이언트에게 응답으로 보냄
				mySession.put("loginPw", pw);
				mySession.put("loginNick", nickName);
				mySession.put("loginAge", age);
			} else {
				System.out.println("변경실패");
				PrintWriter out = response.getWriter();
				out.print("fail"); // "fail"이라는 문자열을 클라이언트에게 응답으로 보냄
			}

		} else {
			PrintWriter out = response.getWriter();
			out.print("fail"); // "fail"이라는 문자열을 클라이언트에게 응답으로 보냄
		}

	}

}
