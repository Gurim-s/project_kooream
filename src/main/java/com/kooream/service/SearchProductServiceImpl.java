package com.kooream.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kooream.domain.ProductVO;
import com.kooream.mapper.BidShopMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SearchProductServiceImpl implements SearchProductService{
	public BidShopMapper productMapper;
	
	@Override
	public List<ProductVO> searchProductTag(String keyword) {
		List<ProductVO> result;
		
		String[] keywords = keyword.split(keyword, ' '); 
		result = productMapper.searchProductTag(keywords);
		return result;
	}
}
