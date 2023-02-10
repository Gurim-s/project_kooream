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
	private int buy_no, p_no, pay_price, m_no, b_no, sell_m_no;
	private String m_adress, p_name_ko, pp_size, p_model_no, p_name_en;
	private String uuid, fileName, uploadPath;
	private Date buy_date;

	//private ProductVO product;
		
	private List<ProductVO> productvo;
	private List<AttachFileVO> attachList;
	private List<String> imageUrls;
}