package com.kooream.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	// 댓글 목록
	@GetMapping(value = "/pages/{orino}",
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<OriginalReplyVO>> getList(@PathVariable("orino") int orino){
		log.info("getList................");
		
		return new ResponseEntity<List<OriginalReplyVO>>(service.getList(orino), HttpStatus.OK);
	}
	
	// 진품 같아요 댓글 갯수
	@GetMapping(value = "{orino}",
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public int countOriOk(int orino) {
		return 0;
	};

	
	
}