package com.plandly.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@RequiredArgsConstructor
public class CalendarDTO {
	
	private String email;
	@NonNull
	private String title;
	@NonNull
	private String start;
	@NonNull
	private String end;
	
	private String oldTitle;
	
	private String oldStart;
	
	private String oldEnd;
	
	private int cal_num;
	
	private String cate;
	
	private String is_public;
	

	public CalendarDTO(String title, String start, String end, String oldTitle,
			String oldStart, String oldEnd) {
		this.title = title;
		this.start = start;
		this.end = end;
		this.oldTitle = oldTitle;
		this.oldStart = oldStart;
		this.oldEnd = oldEnd;
	}


	public CalendarDTO(@NonNull String title, @NonNull String start, @NonNull String end, int cal_num) {
		this.title = title;
		this.start = start;
		this.end = end;
		this.cal_num = cal_num;
	}


	public CalendarDTO(String email, String title, String start, String end) {
		this.email = email;
		this.title = title;
		this.start = start;
		this.end = end;
	}


	public CalendarDTO(int cal_num, String cate) {
		this.cal_num = cal_num;
		this.cate = cate;
	}


	public CalendarDTO(String is_public, int cal_num) {
		this.is_public = is_public;
		this.cal_num = cal_num;
	}



	
	
//    // 추가: 문자열 형식의 날짜/시간 정보를 저장할 필드
//    private String startStr;
//    private String endStr;	

}
