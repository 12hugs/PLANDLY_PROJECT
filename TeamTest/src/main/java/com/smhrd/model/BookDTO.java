package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
public class BookDTO {
	
	
	private String id; @NonNull
	private String pw; @NonNull
	private String nick; @NonNull
	private String email;
	private String tel;
	

	
}
