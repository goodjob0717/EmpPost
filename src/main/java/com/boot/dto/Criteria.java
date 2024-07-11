package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
//@NoArgsConstructor
public class Criteria { //DTO기능

	private int pageNum; //페이지 번호
	private int amount; //페이지당 글 갯수
	
	private String type;
	private String keyword;
	
	public Criteria() { //기본값
		this(1, 10);
	}
	
	public Criteria(int papageNum, int amount) { 
		this.pageNum = papageNum;
		this.amount = amount;
	}
}
