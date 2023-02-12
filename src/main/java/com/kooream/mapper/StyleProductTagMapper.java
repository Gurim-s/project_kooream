package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.ProductTagVO;

public interface StyleProductTagMapper {
	public void insert(ProductTagVO vo);
	public List<ProductTagVO> getProductTagListByStyleNoList(List<Long> styleNoList);
	public List<ProductTagVO> getTagList(ProductTagVO vo);
	public List<Integer> getPNoListByStyleNo(long style_no);
}
