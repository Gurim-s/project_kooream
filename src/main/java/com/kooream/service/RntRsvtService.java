package com.kooream.service;

import java.util.List;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntRsvtVO;

public interface RntRsvtService {
	public ProductVO getPrice(RntRsvtVO vo);
	public int rgstRsvt(RntRsvtVO vo);
	public List<RntRsvtVO> getRsvt(RntRsvtVO vo);
	public List<ProductVO> checkRnt(int m_no);
}
