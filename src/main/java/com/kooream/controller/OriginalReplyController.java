package com.kooream.controller;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
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
				new ResponseEntity<String>("success", HttpStatus.ACCEPTED.OK) :
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
	
	@GetMapping(value = "/oriCountOk/{orino}", produces = {MediaType.APPLICATION_XML_VALUE,
	MediaType.APPLICATION_JSON_VALUE}) public int
	countOriOk(@PathVariable("orino") int orino) {
	log.info("Original OK reply count....." + orino);
	  
	int result = service.countOriOk(orino);
	  
	return result; };
	 
	
	// 가품 같아요 댓글 갯수
	@GetMapping(value = "/oriCountNo/{orino}",
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public int countOriNo(@PathVariable("orino") int orino) {
		log.info("Original No reply count....." + orino);
		
		int result = service.countOriNo(orino);
			
		return result;
	};
	
	// 진품 같아요 댓글 셀렉트
	@GetMapping(value = "/okList/{orino}",
			produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<OriginalReplyVO>> okList(@PathVariable("orino") int orino){
		log.info("original reply OK list.................");
		
		return new ResponseEntity<List<OriginalReplyVO>>(service.chOk(orino), HttpStatus.OK);
	}
	
	// 가품 같아요 댓글 셀렉트
	@GetMapping(value = "/noList/{orino}",
			produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<OriginalReplyVO>> noList(@PathVariable("orino") int orino){
		log.info("original reply NO list.................");
			
		return new ResponseEntity<List<OriginalReplyVO>>(service.chNo(orino), HttpStatus.OK);
	}
		
	// 댓글 삭제
	@DeleteMapping(value = "/{orireplyno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("orireplyno") int orireplyno) {
		log.info("original reply remove................" + orireplyno);
		
		return service.remove(orireplyno)==1?
				new ResponseEntity<String>("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 조회
	@GetMapping(value = "/{orireplyno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<OriginalReplyVO> get(@PathVariable("orireplyno") int orireplyno){
		log.info("original get reply................" + orireplyno);
		
		return new ResponseEntity<OriginalReplyVO>(service.get(orireplyno), HttpStatus.OK);
	}
	
	// 댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{orireplyno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody OriginalReplyVO vo, @PathVariable("orireplyno") int orireplyno){
		log.info("original reply.............." + orireplyno);
		log.info("original update reply............." + vo);
		
		int modifyCount = service.modify(vo);
		
		log.info("modify Count : " + modifyCount);
		
		return modifyCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
