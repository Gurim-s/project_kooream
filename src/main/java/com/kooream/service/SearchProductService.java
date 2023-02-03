package com.kooream.service;

import java.util.List;

import com.kooream.domain.ProductVO;
import com.kooream.domain.SearchKeyword;

public interface SearchProductService {
	public List<ProductVO> searchProductTag(SearchKeyword keyword);
}
