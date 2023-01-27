package com.kooream.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Criteria {
	private int pageNum, amount;
	
	
	
	
	
	
	// 검색용 
	private String searchType; // 제목, 내용,.... 등등
	private String searchName; // 검색어 
	
	
	
	@Override
	public String toString() {
		return "Criteria [pageNum"+pageNum+", amount"+amount+",searchType"+searchType+",searchName"+searchName+"]";
	}
	
}
