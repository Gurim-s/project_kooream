package com.kooream.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.koorema.domain.ProductVO;

@Mapper
public interface RentalMapper {
	public int addRntPrdt(ProductVO vo);
}
