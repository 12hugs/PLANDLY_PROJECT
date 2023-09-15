package com.plandly.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.plandly.model.CalendarDAO;
import com.plandly.model.CalendarDTO;
import com.plandly.model.Plandly_MemberVO;

@WebServlet("/UploadCal")
public class UploadCal extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");

		Plandly_MemberVO memberVO = (Plandly_MemberVO) session.getAttribute("vo");

		String email;

		if (memberVO != null) {
			email = memberVO.getEmail();
		} else {
			// 세션에 vo 객체가 없다면 적절한 에러 처리를 해주어야 합니다.
			throw new ServletException("유저가 로그인하지 않았음.");
		}

		email = memberVO.getEmail();
		String title = request.getParameter("title");
		String start = request.getParameter("start");
		String end = request.getParameter("end");

		System.out.println("Email: " + email);
		System.out.println("Title: " + title);
		System.out.println("Start date/time : " + start);
		System.out.println("End date/time : " + end);

		CalendarDTO dto = new CalendarDTO();

		dto.setEmail(email);
		dto.setTitle(title);
		dto.setStart(start);
		dto.setEnd(end);

		CalendarDAO dao = new CalendarDAO();

		int cnt = dao.calUpload(dto);

		if (cnt > 0) {
			System.out.println("업로드 성공");

			
			 //업로드 성공 시 cal_num 값 가져오기 
			 int cal_num = dto.getCal_num();
			  
			 //JSON 객체 생성 및 값 설정 
			 JsonObject jsonResult = new JsonObject();
			 jsonResult.addProperty("CAL_NUM", cal_num);
			  
			 //Content-Type 설정 및 JSON 문자열 응답
			 response.setContentType("application/json; charset=utf-8");
			 response.getWriter().print(jsonResult.toString());
			 

		} else {
			System.out.println("업로드 실패");
		}

		// 여기서 DB에 저장하는 로직을 수행하면 됩니다.
	}

}
