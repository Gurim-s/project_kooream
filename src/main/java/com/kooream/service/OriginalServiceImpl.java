package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.OriginalBrandVO;
import com.kooream.mapper.OriginalBrandMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OriginalServiceImpl implements OriginalService {
	
	@Setter(onMethod_ = @Autowired)
	private OriginalBrandMapper mapper;
	
	@Override
	public List<OriginalBrandVO> getOriBrandList() {
		log.info("oriBrand..............");
		
		return mapper.oriBrandList();
	}
	
}
