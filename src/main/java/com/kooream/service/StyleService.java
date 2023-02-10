package com.kooream.service;

import java.util.List;

import com.kooream.domain.ImageFileVO;
import com.kooream.domain.StyleQuery;
import com.kooream.domain.StyleVO;

public interface StyleService {
	public List<StyleVO> getList(StyleQuery query);
	public StyleVO get(long style_no);
	public List<ImageFileVO> getImageList(long style_no);
	public void register(StyleVO vo);
	public void update(StyleVO vo);
	public boolean remove(long style_no, int m_no);
}
