package com.kooream.domain;

import java.sql.Date;
import java.util.List;

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
	private String p_name_ko, p_name_en, p_size, p_brand, p_model_no, p_category, p_class, r_check, strUuid;
	private Date p_release_date;
	private String img_url;
	private String strt_r_date, rtrn_r_date;
	
	private int max_bid_sell, min_bid_buy;
	private List<AttachFileVO> attachList;
}