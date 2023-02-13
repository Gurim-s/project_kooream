package com.kooream.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.ImageFileVO;
import com.kooream.domain.StyleReplyVO;
import com.kooream.mapper.StyleMapper;
import com.kooream.mapper.StyleReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StyleReplyServiceImpl implements StyleReplyService{
	StyleReplyMapper mapper;
	StyleMapper styleMapper;
	
	@Override
	public List<StyleReplyVO> getList(long style_no) {
		List<StyleReplyVO> list = mapper.getList(style_no);
		for (StyleReplyVO reply : list) {
			ImageFileVO image = new ImageFileVO();
			image.setFileName(reply.getFileName());
			image.setUuid(reply.getUuid());
			image.setUploadPath(reply.getUploadPath());
			reply.setProfile(image);
		}
		
		return list;
	}
	
	@Override
	public StyleReplyVO get(long style_no) {
		return mapper.get(style_no);
	}
	
	@Override
	@Transactional
	public int register(StyleReplyVO vo) {
		int result = mapper.insert(vo);
		styleMapper.updateCountReply(vo.getStyle_no(), 1);
		mapper.updateCountNested(vo.getNested_from(), 1);
		
		return result;
	}
	
	@Override
	@Transactional
	public int remove(long rno) {
		int amount = 1;
		long rnoNestedFrom = mapper.getRnoNestedFrom(rno);
		int countNested = mapper.getCountNested(rno);
		System.out.println("count..." + countNested);
		if (rnoNestedFrom == 0 && countNested > 0) {
			System.out.println("delete Nested....");
			amount += mapper.deleteNested(rno);
			
		} else {
			mapper.updateCountNested(rnoNestedFrom, -1);
		}
		
		styleMapper.updateCountReply(mapper.getStyleNo(rno), -1 * amount);
		System.out.println("delete...");
		mapper.delete(rno);
		return amount;
	}
	
}