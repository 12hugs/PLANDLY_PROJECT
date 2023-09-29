package com.plandly.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Data
@Getter
@Setter
@NoArgsConstructor
public class FamousVO {
	
	private String content;
	private String author;
	private int cont_num;
}
