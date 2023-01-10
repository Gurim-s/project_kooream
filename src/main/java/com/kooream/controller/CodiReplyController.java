package com.kooream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kooream.domain.CodiReplyVO;
import com.kooream.service.CodiReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/codi/replies/")
@RestController
public class CodiReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private CodiReplyService service;
	
	
	
	// 등록 
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody CodiReplyVO vo){
		log.info("CodiReplyVO"+vo);
		
		int insertCount = service.register(vo);
		
		log.info("reply Insert Count : " + insertCount);
		
		return insertCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	} // ResponseEntity end

	// 목록
//	@GetMapping(value = "/{codi_no",
//					produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity<CodiReplyVO>
//	
















}
