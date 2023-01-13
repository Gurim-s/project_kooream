package com.kooream.service;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntRsvtVO;

public interface RntRsvtService {
	public ProductVO getPrice(RntRsvtVO vo);
	public int rgstRsvt(RntRsvtVO vo);
	public RntRsvtVO getRsvt(RntRsvtVO vo);
	
}
