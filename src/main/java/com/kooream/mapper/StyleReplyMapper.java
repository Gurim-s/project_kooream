package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.StyleReplyVO;

public interface StyleReplyMapper {
	public List<StyleReplyVO> getList(long style_no);
	public int insert(StyleReplyVO vo);
	public int delete(long rno);
	public int deleteByStyleNo(long style_no);
	public int deleteNested(long rno);
}
