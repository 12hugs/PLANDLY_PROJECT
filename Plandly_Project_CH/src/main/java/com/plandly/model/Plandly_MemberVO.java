package com.plandly.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Data

public class Plandly_MemberVO {
	@NonNull
    private String email;
    private String pw;
    private int avg_age;
    private String gender;
    private String nickName;
}
