package com.plandly.model;

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
public class TaskDTO {
	
	
    private Integer todo_Num;  // 할 일 번호 (TODO_NUM)
    @NonNull
    private int calendar_Num;  // 캘린더 이벤트 번호 (CALENDAR_NUM)
    @NonNull
    private String task;  // 할 일 내용 (TASK)
    private char is_Done;  // 완료 여부 (IS_DONE)
    
    
	public TaskDTO(Integer todo_Num, String task, char is_Done) {
		this.todo_Num = todo_Num;
		this.task = task;
		this.is_Done = is_Done;
	}


	public TaskDTO(Integer todo_Num, char is_Done) {
		this.todo_Num = todo_Num;
		this.is_Done = is_Done;
	}
    

	
	
}