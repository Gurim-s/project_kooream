package com.kooream.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.ProductVO;

@Mapper
public interface RentalMapper {
	public int addRntPrdt(ProductVO vo);
}
