package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntReviewVO;
import com.kooream.mapper.RntReviewMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RntReviewServiceImpl implements RntReviewService{
	
	@Setter(onMethod_= @Autowired)
	private RntReviewMapper mapper;
	
	public int rgstReview(RntReviewVO vo) {
		return mapper.rgstReview(vo);
	}

	@Override
	public List<RntReviewVO> getReview(ProductVO vo) {
		return mapper.getReview(vo);
	}

	@Override
	public int removeReview(RntReviewVO vo) {
		mapper.removeReview(vo);
		return 1;
	}

}
