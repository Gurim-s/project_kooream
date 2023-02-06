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
import com.kooream.domain.PaymentVO;
import com.kooream.domain.ProductVO;
import com.kooream.mapper.BrandCartMapper;
import com.kooream.service.BrandCartService;
import com.kooream.service.BrandProductService;
import com.kooream.service.BrandProductUploadService;
import com.kooream.service.PaymentService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Payment/*")
public class PaymentController {
	
	@Setter(onMethod_ = @Autowired )
	private PaymentService payservice;
	
	// 주문 추가 컨트롤러
	@PostMapping(value="/addpayment", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int addPayment(PaymentVO vo){	

		 int result = payservice.addPayment(vo);

		return result;
	}
	

	  // 주문페이지이동 페이지로 이동
	  @GetMapping("/payment") public String view(Model model) { 
		  return "brandshop/shop_paymentPage";
	  }
	 
	
	
	  // 주문페이지 리스트 보기
	  
	  @GetMapping("/paymentList")
	  
	  @ResponseBody public ResponseEntity<List<PaymentVO>> paymentList(Model model){
		  int m_no = 1;
	 // model.addAttribute("brandCartList",paymentList(model));
	  
	  return new ResponseEntity<List<PaymentVO>>(payservice.paymentList(m_no),HttpStatus.OK);
	  }
	 	
	
	  // 주문내역 리스트 이미지 보기
	  
	  @GetMapping(value ="/paymentgetAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	  
	  @ResponseBody public ResponseEntity<List<AttachFileVO>> paymentgetAttachList(int
	  p_no) { log.info("CartgetAttachList....." + p_no); 
	  return new ResponseEntity<List<AttachFileVO>>(payservice.paymentgetAttachList(p_no),
	  HttpStatus.OK); }
}
	 
	

		
		
		
		
	





		
		
	
