package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.StyleProductTagVO;

public interface StyleProductTagMapper {
	public void insert(StyleProductTagVO vo);
	public List<StyleProductTagVO> getTagList(StyleProductTagVO vo);
	public List<Integer> getPNoListByStyleNo(long style_no);
}
