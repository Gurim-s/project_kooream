package com.kooream.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kooream.domain.Criteria;
import com.kooream.domain.StyleVO;
import com.kooream.mapper.StyleMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StyleServiceImpl implements StyleService{
	
	private StyleMapper mapper;
	
	@Override
	public List<StyleVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}
}
