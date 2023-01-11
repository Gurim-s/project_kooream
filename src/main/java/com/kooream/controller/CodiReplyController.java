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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kooream.domain.CodiReplyVO;
import com.kooream.service.CodiReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/codi/replies/*")
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

	
	
	
	
//	 목록
	@GetMapping(value = "/pages/{codi_no}/{page}",
		produces = {MediaType.APPLICATION_XML_VALUE
					, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CodiReplyVO>> getList(
			@PathVariable("codi_no") int codi_no,
			@PathVariable("page") int page){
		
			log.info("getList......" + codi_no);

	
		return new ResponseEntity<List<CodiReplyVO>>(service.getList(codi_no), HttpStatus.OK);
	}
		
	//조회 비동기 데이터 받는거
	@GetMapping(value="/{codi_c_no}",
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<CodiReplyVO> get(@PathVariable("codi_no") int codi_no){
		log.info("get.."+codi_no);
		
		return new ResponseEntity<>(service.get(codi_no), HttpStatus.OK);
	}
	



	// 댓글 삭제 
	@DeleteMapping(value="/{codi_c_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("codi_c_no")int codi_c_no){
		log.info("comment remove............."+codi_c_no);
		
		return service.remove(codi_c_no) == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) :
					new ResponseEntity<String>( HttpStatus.INTERNAL_SERVER_ERROR);
		
	}



}
