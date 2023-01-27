package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntInterestVO;
import com.kooream.mapper.RntInterestMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RntInterestServiceImpl implements RntInterestService{
	
	@Setter(onMethod_= @Autowired)
	private RntInterestMapper mapper;
	
	public int interestRnt(ProductVO vo) {
		return mapper.interestRnt(vo);
	}

	@Override
	public RntInterestVO countInterest(ProductVO vo) {
		return mapper.countInterest(vo);
	}

	@Override
	public int intrstRemove(ProductVO vo) {
		return mapper.intrstRemove(vo);
	}

	@Override
	public List<ProductVO> interestList(int m_no) {
		return mapper.interestList(m_no);
	}

}
