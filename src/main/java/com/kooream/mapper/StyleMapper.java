package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kooream.domain.Criteria;
import com.kooream.domain.StyleQuery;
import com.kooream.domain.StyleVO;

public interface StyleMapper {
	public List<StyleVO> getList(StyleQuery query);
	public List<StyleVO> getHotList(StyleQuery query);
	public List<StyleVO> getRecentList(StyleQuery query);
	public List<StyleVO> getFollowList(StyleQuery query);
	public List<StyleVO> getTagList(StyleQuery query);
	public List<StyleVO> getProductList(StyleQuery query);
	public List<StyleVO> getMemberList(StyleQuery query);
	public StyleVO get(long style_no);
	public int getCountReply(long style_no);
	public long insert(StyleVO vo);
	public int updateCountReply(@Param("style_no") long style_no, 
								@Param("amount") int amount);
	public long getStyle_no();
	public void update(StyleVO vo);
	public long delete(long style_no);
}