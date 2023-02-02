package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.kooream.domain.BrandCartVO;
import com.kooream.domain.ProductVO;


@Mapper
public interface BrandSelectMapper{


	public List<ProductVO> getList(ProductVO vo2);
	
	public List<ProductVO> getListprice(ProductVO vo3);



	
	
}

