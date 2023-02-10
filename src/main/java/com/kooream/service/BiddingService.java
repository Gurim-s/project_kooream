package com.kooream.service;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
import com.kooream.domain.PaymentVO;
import com.kooream.domain.ProductVO;


public interface BiddingService {

	void insertBuyBid(BidShopVO vo);
	void now_sell(BidShopVO vo);
	void now_buy(BidShopVO vo);
	void trade_complete(PaymentVO pvo);
	List<BidShopVO> bid_Read(int m_no);
	List<ProductVO> get_Bidinfo(int p_no);
	void bidremove(int bid_no);
	List<PaymentVO> buyTrade_Read(int m_no);
	
}