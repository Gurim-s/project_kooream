package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
import com.kooream.domain.PaymentVO;
import com.kooream.domain.ProductVO;
import com.kooream.mapper.BiddingMapper;
import com.kooream.mapper.BrandProductUploadMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
  public class BiddingServiceImpl implements BiddingService{
	
	@Setter(onMethod_ = @Autowired )
	private BiddingMapper mapper;

	@Override
	public void insertBuyBid(BidShopVO vo) {
		log.info("register..." + vo);
		mapper.insertBuyBid(vo);
	}

	@Override
	public void now_sell(BidShopVO vo) {
		mapper.now_sell(vo);
	}

	@Override
	public void now_buy(BidShopVO vo) {
		mapper.now_buy(vo);
	}

	@Override
	public void trade_complete(PaymentVO pvo) {
		mapper.trade_complete(pvo);
	}

	@Override
	public List<BidShopVO> bid_Read(int m_no) {
		
		List<BidShopVO> list = mapper.bid_Read(m_no);
		
		return list;
	}

	@Override
	public List<ProductVO> get_Bidinfo(int p_no) {
		return mapper.get_Bidinfo(p_no);
	}

	@Override
	public void bidremove(int bid_no) {
		mapper.bidremove(bid_no);
	}

	@Override
	public List<PaymentVO> buyTrade_Read(int m_no) {
		List<PaymentVO> list = mapper.buyTrade_Read(m_no);
		return list;
	}

	@Override
	public List<PaymentVO> sellTrade_Read(int m_no) {
		List<PaymentVO> list = mapper.sellTrade_Read(m_no);
		return list;
	}
  }