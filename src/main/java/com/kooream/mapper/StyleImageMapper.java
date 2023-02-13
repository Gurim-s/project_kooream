package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.ImageFileVO;

public interface StyleImageMapper {
	public void insert(ImageFileVO vo);
	public List<ImageFileVO> getImageListByStyleNoList(List<Long> styleNoList);
	public List<ImageFileVO> getImagesByStyle_no(long style_no);
	public void deleteAll(long style_no);
	public void delete(ImageFileVO vo);
}