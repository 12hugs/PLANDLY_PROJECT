package com.smhrd.model;

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
	
	
	

}
