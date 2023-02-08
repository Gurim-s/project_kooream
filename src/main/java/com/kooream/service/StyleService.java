package com.kooream.service;

import java.util.List;

import com.kooream.domain.Criteria;
import com.kooream.domain.StyleImageVO;
import com.kooream.domain.StyleQuery;
import com.kooream.domain.StyleVO;

public interface StyleService {
	public List<StyleVO> getList(StyleQuery query);
	public StyleVO get(long style_no);
	public List<StyleImageVO> getImageList(long style_no);
	public void register(StyleVO vo);
	public void update(StyleVO vo);
	public boolean remove(long style_no);
}
