package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RentalMenuVO;

@Mapper
public interface RentalMapper {
	public int addRntPrdt(ProductVO vo);
	public List<ProductVO> getList(RentalMenuVO vo);
}
