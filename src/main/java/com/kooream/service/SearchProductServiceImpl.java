package com.kooream.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kooream.domain.ProductVO;
import com.kooream.domain.SearchKeyword;
import com.kooream.mapper.BidShopMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SearchProductServiceImpl implements SearchProductService{
	public BidShopMapper productMapper;
	
	@Override
	public List<ProductVO> searchProductTag(SearchKeyword keyword) {
		List<ProductVO> result;
		String[] keywordList = keyword.getKeyword().split(" ");
		keyword.setKeywordList(keywordList);

		result = productMapper.searchProductTag(keyword);
		return result;
	}
}
