package com.plandly.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.plandly.model.CalendarDAO;
import com.plandly.model.CalendarDTO;

@WebServlet("/GetEvents")
public class GetEvents extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		
		CalendarDAO dao = new CalendarDAO();
		List<CalendarDTO> events = dao.getEvents();// 모든 일정을 반환하는 메소드
		
		
        // Gson 객체 생성 및 JsonSerializer 설정
        Gson gson = new Gson();
        String jsonStr = gson.toJson(events);

        // 콘솔에 JSON 문자열 출력
        System.out.println(jsonStr);

        // 응답으로 JSON 데이터 전송
		response.getWriter().write(jsonStr);

	}

}
