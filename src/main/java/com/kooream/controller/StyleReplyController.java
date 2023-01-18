package com.kooream.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kooream.domain.StyleReplyVO;
import com.kooream.service.StyleReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/stylereplies")
@AllArgsConstructor
public class StyleReplyController {
	StyleReplyService service;
	
	@PostMapping(value = "/new", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody StyleReplyVO vo) {
		int result = service.register(vo);
		
		return result == 1?
				new ResponseEntity<String>("success", HttpStatus.OK):
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "list/{style_no}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<StyleReplyVO>> getList(@PathVariable("style_no") long style_no) {
		List<StyleReplyVO> list = service.getList(style_no);
		
		return new ResponseEntity<List<StyleReplyVO>>(list, HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") long rno) {
		int result = service.remove(rno);
		
		return result == 1?
				new ResponseEntity<String>("success", HttpStatus.OK):
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
