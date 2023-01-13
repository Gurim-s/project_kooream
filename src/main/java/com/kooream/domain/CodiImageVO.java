package com.kooream.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CodiImageVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private int codi_no;

	
}
