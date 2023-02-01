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

	@Override
	public String toString() {
		return "Criteria [pageNum"+pageNum+", amount"+amount+"]";
	}
}
