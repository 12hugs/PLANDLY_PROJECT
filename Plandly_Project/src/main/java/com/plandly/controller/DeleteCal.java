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
	    
	    int calNum = Integer.parseInt(request.getParameter("cal_num"));

	
		CalendarDTO dto = new CalendarDTO();

        dto.setCal_num(calNum);
        
        System.out.println(calNum + "번 이벤트 삭제");
       
		CalendarDAO dao = new CalendarDAO();

		int cnt = dao.calDelete(calNum);
		
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
