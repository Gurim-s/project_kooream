package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.StyleTagVO;

public interface StyleTagMapper {
	public void insert(StyleTagVO vo);
	public List<StyleTagVO> getTagsByStyle_no(long style_no);
	public List<Long> getStyleNoList(String hashtag);
	public int getCountTags(long style_no);
	public void deleteByStyleNo(long style_no);
}