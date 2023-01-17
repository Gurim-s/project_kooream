package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntRsvtVO;
import com.kooream.mapper.RntRsvtMapper;

import lombok.Setter;

@Service
public class RntRsvtServiceImpl implements RntRsvtService{
	
	@Setter(onMethod_= @Autowired)
	private RntRsvtMapper mapper;
	
	@Override
	public ProductVO getPrice(RntRsvtVO vo) {
		return mapper.getPrice(vo);
	}

	@Override
	public int rgstRsvt(RntRsvtVO vo) {
		return mapper.rgstRsvt(vo);
	}

	@Override
	public List<RntRsvtVO> getRsvt(RntRsvtVO vo) {
		List<RntRsvtVO> result = mapper.getRsvt(vo);
		return result;
	}

}
