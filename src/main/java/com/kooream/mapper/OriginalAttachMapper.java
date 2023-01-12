package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.OriginalAttachVO;

public interface OriginalAttachMapper {
	
	public void insert(OriginalAttachVO vo);
	public void delete(String uuid);
	public List<OriginalAttachVO> findByOrino(int orino);

}
