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


@WebServlet("/UpdateCal")
public class UpdateCal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

		Gson gson = new Gson();

		String title = request.getParameter("title"); // title 파라미터 가져오기
		String start = request.getParameter("start"); // start 파라미터 가져오기
		String end = request.getParameter("end"); // end 파라미터 가져오기
		String oldTitle = request.getParameter("oldTitle"); 
		String oldStart = request.getParameter("oldStart"); 
		String oldEnd = request.getParameter("oldEnd"); 

		

		CalendarDTO dto = new CalendarDTO();

		
        dto.setTitle(title); // DTO에 title 설정
        dto.setStart(start); // DTO에 start 설정
        dto.setEnd(end); // DTO에 end 설정
        dto.setOldTitle(oldTitle);
        dto.setOldStart(oldStart);
        dto.setOldEnd(oldEnd);
        
        
        
		System.out.println("Title: " + dto.getTitle());
		System.out.println("Start: " + dto.getStart());
		System.out.println("End: " + dto.getEnd());
		System.out.println("oldTitle: " + dto.getOldTitle());
		System.out.println("oldStart: " + dto.getOldStart());
		System.out.println("oldEnd: " + dto.getOldEnd());

		CalendarDAO dao = new CalendarDAO();

		int cnt = dao.calUpdate(dto);
		
		PrintWriter out = response.getWriter();

		if (cnt > 0) {
			System.out.println("수정 성공");
            out.print("{\"status\":\"success\"}");
            out.flush();
		} else {
			System.out.println("수정 실패");
            out.print("{\"status\":\"fail\"}");
            out.flush();
		}
		
	}

}
