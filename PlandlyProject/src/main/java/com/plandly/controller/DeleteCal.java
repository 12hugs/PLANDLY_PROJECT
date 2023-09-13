package com.plandly.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.plandly.model.CalendarDAO;
import com.plandly.model.CalendarDTO;

@WebServlet("/DeleteCal")
public class DeleteCal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    Gson gson = new Gson();
	    
		String title = request.getParameter("title"); // title 파라미터 가져오기
		String start = request.getParameter("start"); // start 파라미터 가져오기
		String end = request.getParameter("end"); // end 파라미터 가져오기

		

		CalendarDTO dto = new CalendarDTO();

		
        dto.setTitle(title); // DTO에 title 설정
        dto.setStart(start); // DTO에 start 설정
        dto.setEnd(end); // DTO에 end 설정
        
        
		System.out.println("Title: " + dto.getTitle());
		System.out.println("Start: " + dto.getStart());
		System.out.println("End: " + dto.getEnd());

		CalendarDAO dao = new CalendarDAO();

		int cnt = dao.calDelete(dto);
		
		PrintWriter out = response.getWriter();

		if (cnt > 0) {
			System.out.println("삭제 성공");
            out.print("{\"status\":\"success\"}");
            out.flush();
		} else {
			System.out.println("삭제 실패");
            out.print("{\"status\":\"fail\"}");
            out.flush();
		}

	}

}
