package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kooream.domain.Criteria;
import com.kooream.domain.StyleVO;

public interface StyleMapper {
	public List<StyleVO> getList(Criteria cri);
	public StyleVO get(long style_no);
	public int getCountReply(long style_no);
	public long insert(StyleVO vo);
	public int updateCountReply(@Param("style_no") long style_no, 
								@Param("amount") int amount);
	public long getStyle_no();
	public long delete(long style_no);
}