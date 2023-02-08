package com.kooream.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.SearchKeyword;
import com.kooream.mapper.BidImageMapper;
import com.kooream.mapper.BidShopMapper;
import com.kooream.mapper.BrandProductUploadMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SearchProductServiceImpl implements SearchProductService{
	public BidShopMapper productMapper;
	public BrandProductUploadMapper imageMapper;
	
	@Override
	public List<ProductVO> searchProductTag(SearchKeyword keyword) {
		List<ProductVO> result;
		String[] keywordList = keyword.getKeyword().split(" ");
		keyword.setKeywordList(keywordList);

		result = productMapper.searchProductTag(keyword);
		return result;
	}
	
	@Override
	public ProductVO getProduct(int p_no) {
		ProductVO product = productMapper.read(p_no);
		List<AttachFileVO> image = imageMapper.findByPno(p_no);
		System.out.println(p_no);
		System.out.println("+++++:" + image.size());
		
		product.setAttachList(image);
		return product;
	}
}
