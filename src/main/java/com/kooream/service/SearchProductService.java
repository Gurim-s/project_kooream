package com.kooream.service;

import java.util.List;

import com.kooream.domain.ProductVO;

public interface SearchProductService {
	public List<ProductVO> searchProductTag(String keyword);
}
