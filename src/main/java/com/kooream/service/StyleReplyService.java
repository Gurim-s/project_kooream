package com.kooream.service;

import java.util.List;

import com.kooream.domain.StyleReplyVO;

public interface StyleReplyService {
	public List<StyleReplyVO> getList(long style_no);
	public StyleReplyVO get(long style_no);
	public int register(StyleReplyVO vo);
	public int remove(long rno);
}
