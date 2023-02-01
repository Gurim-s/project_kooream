package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.BidShopVO;
import com.kooream.domain.ProductVO;

public interface BiddingMapper {
	public int getMaxBidding(int p_no);
	public int getMinBidding(int p_no);
	public void insertBuyBid(BidShopVO vo);
	public void nowsell(BidShopVO vo);
}
