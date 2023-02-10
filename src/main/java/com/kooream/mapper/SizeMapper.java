package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.SizeVO;


@Mapper
public interface SizeMapper{

	public int addSize(SizeVO vo);	
	
	public List<SizeVO> findPno(int p_no);

	public void sizeremove(int p_no);
}
