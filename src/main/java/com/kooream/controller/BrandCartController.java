package com.kooream.controller;

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
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandCartVO;
import com.kooream.domain.Criteria;
import com.kooream.domain.MemberVO;
import com.kooream.domain.ProductVO;
import com.kooream.mapper.BrandCartMapper;
import com.kooream.security.UserSession;
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
	
	@Setter(onMethod_ = @Autowired )
	private BrandCartService cartservice;
	
	// ???????????? ?????? ????????????
	@PostMapping(value="/addCart", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int addCart(BrandCartVO vo){// ???????????? ??????
		MemberVO userSession = new UserSession().getSession();
		if(userSession != null) {
			vo.setM_no(userSession.getM_no()); // ???????????? ????????????
			
			// ?????? ??????????????????
		
		}
		
		//log.info("-----------------0000----------"+vo.getP_no());
		//log.info("????????????" + vo.getCart_no());
		//log.info("????????????" +vo.getM_no());
		//log.info("????????????" +vo.getP_no());

		// result??? 1?????? alert??? 
		 int result = cartservice.addCart(vo);
		 //log.info(result + "999999999999999999999999");
		return result;
	}
	
	
	 // ???????????? ???????????? ??????
	@Secured({"ROLE_USER"})
	@GetMapping("/brandCart")	
	public String view(Model model) {
		return "brandshop/brandCart";
	}
	
	// ???????????? ????????? ??????
	
	  @GetMapping("/brandCartList")
	  @ResponseBody public ResponseEntity<List<BrandCartVO>> brandCartList(Model model){ 
		  int m_no=0;
		  MemberVO userSession = new UserSession().getSession();
			if(userSession != null) {
				 m_no = userSession.getM_no(); // ???????????? ????????????
				
			}
		  //int m_no = 1;
	  //model.addAttribute("brandCartList",brandCartList(model));
		  
	  return new
	  ResponseEntity<List<BrandCartVO>>(cartservice.brandCartList(m_no),HttpStatus.OK); 
	  }

	  // ???????????? ????????? ????????? ??????
	  
	  @GetMapping(value ="/CartgetAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	  @ResponseBody public ResponseEntity<List<AttachFileVO>> CartgetAttachList(int p_no)
	  { log.info("CartgetAttachList....." + p_no); 
	  return new ResponseEntity<List<AttachFileVO>>(cartservice.CartgetAttachList(p_no), HttpStatus.OK);
	  }

	
	// ???????????? ?????? // ?????? ???????????? ??????
	
//	  @PostMapping(value = "/Cartdelete", produces =MediaType.APPLICATION_JSON_UTF8_VALUE)
	  
//	  @ResponseBody public int Cartdelete(BrandCartVO vo) {
	  
//	  int result = cartservice.Cartdelete(vo);
	  
//	  return result; 
//	  }
	 


	// ?????????????????? 
	@ResponseBody
	@PostMapping(value = "/Cartdelete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int Cartdelete(
	     @RequestParam(value = "chArr[]") List<String> chArr, BrandCartVO vo) {
	// logger.info("delete cart");
	 
	// MemberVO member = (MemberVO)session.getAttribute("member");
	// String userId = member.getUserId();
	 
	 int result = 0;
	 int cartno = 0;
	 
	 
	 //if(member != null) {
	 // cart.setUserId(userId);
	  
	  for(String i : chArr) {   
	   cartno = Integer.parseInt(i);
	   vo.setCart_no(cartno);
	   cartservice.Cartdelete(vo);
	  }   
	  result = 1;
	 
	 return result;  
	}
}
		

	

	

		
	







	
