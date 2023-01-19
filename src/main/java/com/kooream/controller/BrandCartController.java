package com.kooream.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.security.Provider.Service;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandCartVO;
import com.kooream.domain.ProductVO;
import com.kooream.service.BrandCartService;
import com.kooream.service.BrandProductService;
import com.kooream.service.BrandProductUploadService;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/brandCart/*")
public class BrandCartController {
	
	
	@Setter(onMethod_= @Autowired)
	private BrandCartService cartservice;
	
	@ResponseBody
	@RequestMapping(value="/addCart", method = RequestMethod.POST)
	public void addCart(BrandCartVO vo){
		
		//int result = 0;
		
		log.info("----------------------------------"+vo.getP_no());
		cartservice.addCart(vo);
				// 화면에 사용할 값을 return 값에 넣어줌
	
	//@PostMapping(value="/addCart", produces = {MediaType.APPLICATION_JSON_VALUE})
	//public ResponseEntity<String> addCart(@RequestBody BrandCartVO vo){
		
	//	int insertCount = cartservice.addCart(vo);
		
	//	return insertCount == 1?
	//			new ResponseEntity<String>("success", HttpStatus.OK):
	//				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);


}
		 
	
	

	
}