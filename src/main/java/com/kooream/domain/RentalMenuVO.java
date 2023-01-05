package com.kooream.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RentalMenuVO {
	private List<String> brandType, ctgrType;
	private String price;
	
	
}
