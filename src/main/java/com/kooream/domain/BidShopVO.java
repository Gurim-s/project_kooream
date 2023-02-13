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
public class BidShopVO {
	private int m_no, p_no, bid_sell, bid_buy, bid_no;
	private String pp_size;
	private Date bid_date;
	
	//-------------테이블 구분
	private List<ProductVO> productvo;
	private List<AttachFileVO> attachList;
	private List<String> imageUrls;
}