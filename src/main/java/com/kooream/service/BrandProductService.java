package com.kooream.service;

import java.util.List;

import com.kooream.domain.ProductVO;

public interface BrandProductService {

	public List<ProductVO> getList();
	
	public void register(ProductVO vo);
	
}
