package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.ProductTagVO;

public interface CodiProductTagMapper {
	public void insert(ProductTagVO vo);
	public List<ProductTagVO> getPNoListByCodiNo(int codi_no);
	public List<ProductTagVO> getTagList(ProductTagVO vo);
}
