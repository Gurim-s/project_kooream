package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntInterestVO;

@Mapper
public interface RntInterestMapper {
	public int interestRnt(ProductVO vo);
	public RntInterestVO countInterest(ProductVO vo);
	public int intrstRemove(ProductVO vo);
	public List<ProductVO> interestList(int m_no);
}
