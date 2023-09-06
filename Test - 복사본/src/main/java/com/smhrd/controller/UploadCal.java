package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.lang.module.ResolutionException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.CalendarDAO;
import com.smhrd.model.CalendarDTO;
@WebServlet("/UploadCal")
public class UploadCal extends HttpServlet {
       
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		request.setCharacterEncoding("UTF-8");
		

		Gson gson = new Gson();
		
		String title;
		String start;
		String end;
		

		try (BufferedReader reader = request.getReader()) {
		    String json = "", line;
		    while ((line = reader.readLine()) != null) {
		        json += line;
		    }

		    CalendarDTO dto = gson.fromJson(json, CalendarDTO.class);

		    System.out.println("Title: " + dto.getTitle());
		    System.out.println("Start: " + dto.getStart());
		    System.out.println("End: " + dto.getEnd());
	
		    
		    CalendarDAO dao = new CalendarDAO();
		    
		    int cnt = dao.calUpload(dto);
		    
		    if (cnt > 0) {
				System.out.println("업로드 성공");
			}else {
				System.out.println("업로드 실패");
			}
		    
		    

		   // 여기서 DB에 저장하는 로직을 수행하면 됩니다.
		}
		
		

	}
}
