package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.StyleImageVO;

public interface StyleImageMapper {
	public void insert(StyleImageVO vo);
	public List<StyleImageVO> getImagesByStyle_no(long style_no);
}
