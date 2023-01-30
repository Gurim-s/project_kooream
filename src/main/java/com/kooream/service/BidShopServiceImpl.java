package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.ProductVO;
import com.kooream.mapper.BidImageMapper;
import com.kooream.mapper.BidShopProductMapper;
import com.kooream.mapper.BiddingMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BidShopServiceImpl implements BidShopService {

	@Setter(onMethod_ = @Autowired)
	private BidShopProductMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private BiddingMapper biddingMapper;
	@Setter(onMethod_ = @Autowired)
	private BidImageMapper bidproMapper;
	
	// shop product 전체 리스트
	@Transactional
	@Override
	public List<ProductVO> getList() {
		List<ProductVO> list = mapper.getList();
		for (ProductVO product : list) {
			int max_bid_sell = biddingMapper.getMaxBidding(product.getP_no());
			int min_bid_buy = biddingMapper.getMinBidding(product.getP_no());

			product.setMax_bid_sell(max_bid_sell);
			product.setMin_bid_buy(min_bid_buy);
			
			List<AttachFileVO> attach = bidproMapper.findByPno(product.getP_no());	// 
			product.setAttachList(attach);
		}
//		ProductVO product = mapper.get(p_no);
//		int max_bid_sell = biddingMapper.getMaxBidding(product.getP_no());
//		int min_bid_buy = biddingMapper.getMinBidding(product.getP_no());
//		
//		product.setMax_bid_sell(max_bid_sell);
//		product.setMin_bid_buy(min_bid_buy);
		return list;
	}
	
	@Override
	// 수정 페이지 내 제품 정보 불러오기
	public ProductVO modiread(int p_no) {
		log.info("modiread..." + p_no);
		return mapper.modiread(p_no);
	}

	@Override
	// 제품 수정하기
	public void modify(ProductVO vo) {
		log.info("register..." + vo);
		mapper.modify(vo);
	}
	
	@Override
	// 1개 상품 보기
	public ProductVO read(int p_no) {
		log.info("get..." + p_no);
		ProductVO product = mapper.read(p_no);
		int max_bid_sell = biddingMapper.getMaxBidding(product.getP_no());
		int min_bid_buy = biddingMapper.getMinBidding(product.getP_no());
		
		product.setMax_bid_sell(max_bid_sell);
		product.setMin_bid_buy(min_bid_buy);
		return product;
	}

	// 상품 삭제하기
	@Override
	public void remove(int p_no) {
		log.info("remove..." + p_no);
		mapper.remove(p_no);
	}

	// 상품 추가하기
	@Transactional
	@Override
	public void insertProduct(ProductVO vo) {
		log.info("register..." + vo);
		mapper.insertProduct(vo);
		
		int p_no = mapper.getPno();
		
		if(vo.getAttachList() != null && vo.getAttachList(). size()>0) {
			for(AttachFileVO vo2 : vo.getAttachList()) { 
				vo2.setP_no(p_no);
				bidproMapper.uploadFile(vo2); 
			}
		}
	}
	
	@Override
	public List<AttachFileVO> getAttachList(int p_no) {
		return bidproMapper.findByPno(p_no);
	}
}