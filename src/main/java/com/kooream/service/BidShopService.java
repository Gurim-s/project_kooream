package com.kooream.service;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
import com.kooream.domain.ProductVO;


public interface BidShopService {
	
	public List<ProductVO> getList();
	
	public ProductVO modiread(int p_no);
	
	public void modify(ProductVO vo);

	public ProductVO read(int p_no);

	public void remove(int p_no);

	public void insertProduct(ProductVO vo);

	public List<AttachFileVO> getAttachList(int p_no);

	public List<BidShopVO> sizeRead(int p_no);

	public BidShopVO sizeSelect(BidShopVO vo2);

	public List<BidShopVO> buysizeRead(int p_no);

	public BidShopVO buysizeSelect(BidShopVO bid);

	public void bidremove(int p_no);

	public List<ProductVO> select_cate(ProductVO category);
	
	public BidShopVO get_mno(BidShopVO bid);
}