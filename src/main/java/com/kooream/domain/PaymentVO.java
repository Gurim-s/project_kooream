package com.kooream.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PaymentVO {
	private int buy_no, p_no, sum_price, m_no, b_no, sell_m_no;
	private String pp_size, p_model_no, p_name_ko, p_name_en, pay_price;
	private Date buy_date;

	
	private List<ProductVO> productvo;
	private List<AttachFileVO> attachList;
	private List<String> imageUrls;
		
	}