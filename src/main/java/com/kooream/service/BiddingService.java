package com.kooream.service;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
import com.kooream.domain.ProductVO;


public interface BiddingService {

	void insertBuyBid(BidShopVO vo);
	void now_sell(BidShopVO vo);
	void now_buy(BidShopVO vo);
	
}