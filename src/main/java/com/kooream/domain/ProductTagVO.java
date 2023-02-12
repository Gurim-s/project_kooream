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
	int p_no, idx, p_release_price;
	long style_no;
	int codi_no;
	String p_name_ko, p_name_en;
	String uuid, fileName, uploadPath;
	String offsetX, offsetY;

	ProductVO product;
}
