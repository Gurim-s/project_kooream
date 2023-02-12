package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kooream.domain.Criteria;
import com.kooream.domain.StyleQuery;
import com.kooream.domain.StyleVO;

public interface StyleLikeMapper {
	public boolean checkLiked(@Param("m_no") int m_no, @Param("style_no") long style_no);
	public int insert(@Param("m_no") int m_no, @Param("style_no") long style_no);
	public int delete(@Param("m_no") int m_no, @Param("style_no") long style_no);
}