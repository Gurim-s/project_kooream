package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.HashtagVO;

public interface HashtagMapper {
	public List<HashtagVO> getHashtagListByStyleNo(long style_no);
	public void insert(String hashtag);
	public long getTagNo(String hashtag);
	public void deleteByTagNo(long tag_no);
}