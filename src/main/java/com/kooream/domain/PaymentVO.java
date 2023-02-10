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
	private int buy_no, p_no, pay_price, m_no;
	private String m_adress, p_name_ko;
	private Date buy_date;

	private List<AttachFileVO> attachList;
	//private ProductVO product;
	
		
		
	}
	
	
		
	
	


