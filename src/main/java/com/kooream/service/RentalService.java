package com.kooream.service;

import java.util.List;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RentalMenuVO;

public interface RentalService {
	public int addRntPrdt(ProductVO vo);
	public List<ProductVO> getList(RentalMenuVO vo);
}
