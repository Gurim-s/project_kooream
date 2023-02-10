package com.kooream.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StyleProductTagVO {
	int p_no, idx;
	long style_no;
	String uuid, fileName;
	String offsetX, offsetY;

	ProductVO product;
}
