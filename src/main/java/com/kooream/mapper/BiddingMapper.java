package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.BidShopVO;
import com.kooream.domain.PaymentVO;
import com.kooream.domain.ProductVO;

public interface BiddingMapper {
	public int getMaxBidding(int p_no);
	public int getMinBidding(int p_no);
	public void insertBuyBid(BidShopVO vo);
	public void now_sell(BidShopVO vo);
	public void now_buy(BidShopVO vo);
	public BidShopVO sizeSelect(BidShopVO vo2);
	public BidShopVO buysizeSelect(BidShopVO bid);
	public BidShopVO get_mno(BidShopVO bid);
	public void trade_complete(PaymentVO pvo);
	public List<BidShopVO> bid_Read(int m_no);
	public List<ProductVO> get_Bidinfo(int p_no);
	public void bidremove(int m_no);
	public List<PaymentVO> buyTrade_Read(int m_no);
	public List<PaymentVO> sellTrade_Read(int m_no);
}
