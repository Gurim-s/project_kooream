package com.kooream.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StyleImageVO {
	private String uuid;
	private String fileName;
	private String uploadPath;
	private long style_no;
}
