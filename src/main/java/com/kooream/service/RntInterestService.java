package com.kooream.service;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntInterestVO;

public interface RntInterestService {
	public int interestRnt(ProductVO vo);
	public RntInterestVO countInterest(ProductVO vo);
	public int intrstRemove(ProductVO vo);
}
