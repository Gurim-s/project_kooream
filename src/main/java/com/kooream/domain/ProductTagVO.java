package com.kooream.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductTagVO {
	int p_no, idx;
	long style_no;
	int codi_no;
	String uuid, fileName;
	String offsetX, offsetY;

	ProductVO product;
}
