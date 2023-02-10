package com.kooream.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.ImageFileVO;

@Mapper
public interface MemberImageMapper {
	public int insert(ImageFileVO image);
	public ImageFileVO getProfile(int m_no);
	public int delete(int m_no);
}
