package com.kooream.service;

import java.util.List;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntInterestVO;

public interface RntInterestService {
	public int interestRnt(RntInterestVO vo);
	public RntInterestVO countInterest(ProductVO vo);
	public int intrstRemove(RntInterestVO vo);
	public List<ProductVO> interestList(int m_no);
}
