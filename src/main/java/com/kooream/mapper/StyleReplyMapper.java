package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kooream.domain.StyleReplyVO;

public interface StyleReplyMapper {
	public List<StyleReplyVO> getList(long style_no);
	public StyleReplyVO get(long style_no);
	public long getStyleNo(long rno);
	public int getCountNested(long style_no);
	public long getRnoNestedFrom(long rno);
	public int insert(StyleReplyVO vo);
	public int updateCountNested(@Param("rnoNestedFrom") long rnoNestedFrom,
								 @Param("amount") int amount);
	public int delete(long rno);
	public int deleteByStyleNo(long style_no);
	public int deleteNested(long rno);
}
