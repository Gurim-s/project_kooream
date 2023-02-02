package com.kooream.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SearchCriteria extends Criteria{
	
	private String searchType, searchName, searchTagName;
	
	@Override
	public String toString() {
		return "SearchCriteria [searchType"+searchType+", searchName"+searchName + ", searchTagName"+ searchTagName +"]";
	}
	
	

	

}
