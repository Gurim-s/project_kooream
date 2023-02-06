package com.kooream.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BidShopVO {
	private int m_no, p_no, bid_sell, bid_buy;
	String p_size;
}