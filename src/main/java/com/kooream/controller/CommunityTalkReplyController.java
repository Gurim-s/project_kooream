package com.kooream.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kooream.domain.CommunityTalkReplyVO;
import com.kooream.service.CommunityTalkReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/replies/")
@RestController
public class CommunityTalkReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private CommunityTalkReplyService service;

	
	// 댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody CommunityTalkReplyVO vo){
		log.info("ReplyVO..........." + vo);
		
		int insertCount = service.register(vo);
		
		log.info("Reply Insert Count : " + insertCount);
		
		return insertCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 리스트
	@GetMapping(value = "/pages/{talkno}",
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CommunityTalkReplyVO>> getList(@PathVariable("talkno") int talkno){
		log.info("getList..............");
		
		
		
		return new ResponseEntity<List<CommunityTalkReplyVO>>(service.getList(talkno), HttpStatus.OK);
	}
	
	// 댓글 삭제
	@DeleteMapping(value = "/{talkreplyno}", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> remove(@PathVariable("talkreplyno") int talkreplyno){
		log.info("reply remove......." + talkreplyno);
		
		return service.remove(talkreplyno) == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{talkreplyno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody CommunityTalkReplyVO vo, @PathVariable("talkreplyno") int talkreplyno){
		log.info("talkreplyno.........." + talkreplyno);
		log.info("reply modify...................." + vo);
		
		int modifyCount = service.modify(vo);
		
		log.info("Reply Modify Count : " + modifyCount);
		
		return modifyCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 조회
	@GetMapping(value = "/{rno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<CommunityTalkReplyVO> get(@PathVariable("talkreplyno") int talkreplyno){
		log.info("get............" + talkreplyno);
		
		return new ResponseEntity<CommunityTalkReplyVO>(service.get(talkreplyno),HttpStatus.OK);
	}
	
}
