package com.koorema.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
	private int p_no, b_no, p_release_price, p_stock, r_price;
	private String p_name_ko, p_name_en, p_size, p_brand, p_model_no, p_category, p_class, r_check;
	private Date p_release_date;
}
