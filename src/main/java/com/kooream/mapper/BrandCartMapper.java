package com.kooream.mapper;



import org.apache.ibatis.annotations.Mapper;


import com.kooream.domain.BrandCartVO;


@Mapper
public interface BrandCartMapper{

	int addCart(BrandCartVO vo);
	
	
}

