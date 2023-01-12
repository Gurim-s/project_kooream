package com.kooream.mapper;

import java.util.List;


import com.kooream.domain.ProductVO;

public interface BrandProductMapper {
	
	public void insert(ProductVO board);

	public List<ProductVO> getList();

	public int getPno();

	public ProductVO read(ProductVO vo);
	
	public int update(ProductVO vo);

	public int remove(ProductVO vo);


	


}
