package com.kooream.service;

import java.util.List;

import com.kooream.domain.Criteria;
import com.kooream.domain.StyleVO;

public interface StyleService {
	public List<StyleVO> getList(Criteria cri);
	public void register(StyleVO vo);
}
