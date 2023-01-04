package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.Criteria;
import com.kooream.domain.StyleVO;

public interface StyleMapper {
	public List<StyleVO> getList(Criteria cri);
}
