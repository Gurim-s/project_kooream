package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.OriginalAttachVO;
import com.kooream.domain.OriginalBrandVO;
import com.kooream.domain.OriginalVO;
import com.kooream.mapper.OriginalAttachMapper;
import com.kooream.mapper.OriginalBrandMapper;
import com.kooream.mapper.OriginalMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OriginalServiceImpl implements OriginalService {
	
	@Setter(onMethod_ = @Autowired)
	private OriginalMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private OriginalAttachMapper attachMapper;
	
	
	// 정품판별 게시판 리스트
	@Override
	public List<OriginalVO> oriList() {
		log.info("ori list......");
		
		return mapper.oriList();
	}
	
	// 정품판별 게시글 작성
	@Override
	public void oriRegister(OriginalVO vo) {
		log.info("ori register......" + vo);
		
		mapper.oriInsert(vo);
	}
	
	// 첨부파일
	@Override
	public List<OriginalAttachVO> getAttList(int orino) {
		log.info("get Attach List...................");
		return attachMapper.findByOrino(orino);
	}
	
}
