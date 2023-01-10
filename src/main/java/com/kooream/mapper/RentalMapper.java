package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.RentalMenuVO;

@Mapper
public interface RentalMapper {
	public int addRntPrdt(ProductVO vo);
	public List<ProductVO> getList(RentalMenuVO vo);
	public List<AttachFileVO> getViewImg(ProductVO vo);
	public ProductVO viewPrdt(ProductVO vo);
	public List<AttachFileVO> getFile(ProductVO vo);
	public int updateRntPrdt(ProductVO vo);
	public int removeRntPrdt(ProductVO vo);
}
