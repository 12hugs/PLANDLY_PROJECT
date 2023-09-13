package com.plandly.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class OpenTodoVO {

	private String title;
	private String start;
	private String end;
	private int cal_num;
	private String email;
	private String nickname;
	private String task;
	private String is_done;
	private String cate;
	
	
}
