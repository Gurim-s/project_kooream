package com.kooream.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kooream.domain.StyleReplyVO;
import com.kooream.mapper.StyleReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StyleReplyServiceImpl implements StyleReplyService{
	StyleReplyMapper mapper;
	
	@Override
	public List<StyleReplyVO> getList(long style_no) {
		List<StyleReplyVO> list = mapper.getList(style_no);
		
		return list;
	}
	
	@Override
	public int register(StyleReplyVO vo) {
		return mapper.insert(vo);		
	}
	
	@Override
	public int remove(long rno) {
		return mapper.delete(rno);
	}
}