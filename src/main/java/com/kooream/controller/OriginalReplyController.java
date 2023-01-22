package com.kooream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kooream.domain.OriginalReplyVO;
import com.kooream.service.OriginalReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/oriReplies/")
@RestController
public class OriginalReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private OriginalReplyService service;
	
	// 댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody OriginalReplyVO vo){
		log.info("original replyVO........................" + vo);
		
		int insertCount = service.register(vo);
		
		log.info("original reply insert Count : " + insertCount);
		
		return insertCount == 1?
				new ResponseEntity<String>("successs", HttpStatus.ACCEPTED.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
}
