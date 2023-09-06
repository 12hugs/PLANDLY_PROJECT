package com.smhrd.model;

import java.sql.Timestamp;

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


	
	
//    // 추가: 문자열 형식의 날짜/시간 정보를 저장할 필드
//    private String startStr;
//    private String endStr;	

}
