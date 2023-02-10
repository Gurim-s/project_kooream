package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.SearchKeyword;

public interface BidShopMapper {

	public List<ProductVO> getList();
	public ProductVO modiread(int p_no);
	public void modify(ProductVO vo);
	public ProductVO read(int p_no);
	public void remove(int p_no);
	public void insertProduct(ProductVO vo);
	public int getPno();
	public List<BidShopVO> sizeread(int p_no);
	public List<ProductVO> searchProductTag(SearchKeyword keyword);
	public List<BidShopVO> buysizeread(int p_no);
	public void bidremove(int p_no);
	public List<ProductVO> select_cate(ProductVO category);
}
