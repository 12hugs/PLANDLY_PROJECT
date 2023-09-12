package com.plandly.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plandly.model.Plandly_MemberDAO;
import com.plandly.model.Plandly_MemberVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;


@WebServlet("/JoinServlet") 
public class JoinService extends HttpServlet {
	@Getter
	public static final long serialVersionUID = 1L;
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
    	
    	
    	String email = request.getParameter("email");
        String pw = request.getParameter("userId");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String nickName = request.getParameter("nickName");

        System.out.println(pw);
        
        int avg_age = 0;
		if (age.equals("10~19")) {
			avg_age = 20080101;
		} else if (age.equals("20~29")) {
			avg_age = 19980101;
		} else if (age.equals("30~39")) {
			avg_age = 19880101;
		} else if (age.equals("40~49")) {
			avg_age = 19780101;
		} else if (age.equals("50~59")) {
			avg_age = 19680101;
		} else if (age.equals("60~69")) {
			avg_age = 19580101;
		}

		System.out.println("아이디 : " + email);
		System.out.println("비밀번호(고유ID값) : " + pw);
		System.out.println("나이대 : " + avg_age);
		System.out.println("성별 : " + gender);
		System.out.println("닉네임 : " + nickName);
        
		// 정상 출력됨
		
		Plandly_MemberVO vo = new Plandly_MemberVO(email, pw, avg_age, gender, nickName);
		Plandly_MemberDAO dao = new Plandly_MemberDAO();
		int cnt = dao.join(vo);
		
		if(cnt > 0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("Join.jsp");
		}else {
			System.out.println("회원가입 실패");
			response.sendRedirect("Join.jsp");
		}
    }
}
