package com.plandly.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Data
@Getter
@Setter
 

public class Plandly_MemberVO {
    @NonNull
    private String email;
    private String pw;
	private String age; 
	private String gender;
	private String nickName;
	
	
	public Plandly_MemberVO(@NonNull String email, String pw, String nickName) {
		super();
		this.email = email;
		this.pw = pw;
		this.nickName = nickName;
	}


	public Plandly_MemberVO(String pw, String age, String gender, String nickName) {
		this.pw = pw;
		this.age = age;
		this.gender = gender;
		this.nickName = nickName;
	}
	
	
	
	
}
