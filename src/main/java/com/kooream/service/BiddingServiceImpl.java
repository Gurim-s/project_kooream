package com.kooream.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
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
		mapper.nowsell(vo);
	}

	@Override
	public void now_buy(BidShopVO vo) {
		mapper.nowbuy(vo);
	}
  }