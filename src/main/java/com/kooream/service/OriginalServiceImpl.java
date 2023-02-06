package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		List<OriginalVO> list = mapper.oriList();
		
		// 썸네일 게시글 합쳐서 가져오기
		for(OriginalVO vo : list) {
			List<OriginalAttachVO> attach = attachMapper.findByOrino(vo.getOrino());
			vo.setAttachList(attach);
		}
		
		log.info("ori list......");
		
		//return mapper.oriList();
		return list;
	}
	
	// 첨부파일
	@Override
	public List<OriginalAttachVO> getAttList(int orino) {
		log.info("get Attach List...................");
		return attachMapper.findByOrino(orino);
	}
	
	// 정품판별 게시글 작성
	@Transactional
	@Override
	public void oriRegister(OriginalVO vo) {
		log.info("ori register......" + vo);
		
		mapper.oriInsert(vo);
		
		// 첨부파일 테이블에 넣기 위해 인서트된 게시글의 글번호(orino)을 가져오기
		int orino = mapper.getOrino();
		System.out.println("get orino............" + orino);
		
		//첨부 파일 테이블에 데이터 삽입
		if(vo.getAttachList() != null && vo.getAttachList().size() > 0) {
			for(OriginalAttachVO vo2 : vo.getAttachList()) {
				vo2.setOrino(orino);
				attachMapper.insert(vo2);
			}
		}
	}
	
	// 정품판별 게시글 조회
	@Override
	public OriginalVO oriGet(int orino) {
		log.info("origonal Get.................." + orino);
		OriginalVO vo = mapper.oriGet(orino);				// 조회 하려는 게시글 하나를 가져오기
		vo.setAttachList(attachMapper.findByOrino(orino));	// 해당 게시글의 첨부 파일 가져오기
		
		
		return vo;
	}

	// 정품판별 게시글 삭제
	@Override
	public boolean oriRemove(int orino) {
		log.info("original remove.............." +  orino);
		return mapper.oriRemove(orino) == 1;
	}
	
	// 정품판별 게시글 수정
	@Override
	public boolean oriUpdate(OriginalVO vo) {
		log.info("original update..........." + vo);
		int result = mapper.oriUpdate(vo);
		
		return result == 1? true : false;
	}
	
}
