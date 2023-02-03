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
	public int addPayment(PaymentVO vo){	// 장바구니 담기

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
	  model.addAttribute("brandCartList",paymentList(model));
	  
	  return new ResponseEntity<List<PaymentVO>>(payservice.paymentList(m_no),HttpStatus.OK);
	  }
	 
	 
	/*
	 * @RequestMapping(value = "/brandCartList", method = RequestMethod.GET) public
	 * void brandCartList(Model model) { int m_no = 1;
	 * 
	 * List<BrandCartVO> brandCartList = cartservice.brandCartList(m_no);
	 * 
	 * model.addAttribute("brandCartList" ,brandCartList); log.info(brandCartList +
	 * "얍얍얍얍얍"); }
	 */
	
	
	/*
	 * // 장바구니 리스트 이미지 보기
	 * 
	 * @GetMapping(value ="/CartgetAttachList", produces =
	 * MediaType.APPLICATION_JSON_UTF8_VALUE)
	 * 
	 * @ResponseBody public ResponseEntity<List<AttachFileVO>> CartgetAttachList(int
	 * p_no) { log.info("CartgetAttachList....." + p_no); return new
	 * ResponseEntity<List<AttachFileVO>>(cartservice.CartgetAttachList(p_no),
	 * HttpStatus.OK); }
	 */
	
		/*
		 * // 장바구니 삭제
		 * 
		 * @PostMapping(value = "/Cartdelete", produces =
		 * MediaType.APPLICATION_JSON_UTF8_VALUE)
		 * 
		 * @ResponseBody public int Cartdelete(BrandCartVO vo) {
		 * 
		 * int result = cartservice.Cartdelete(vo);
		 */
/*	public int Cartdelete(@RequestParam(value = "chbox[]") List<String> chArr, BrandCartVO vo) {

		 int result = 0;
		 int cart_no = 0;

		  for(String i : chArr) {   
		   cart_no = Integer.parseInt(i);
		   vo.setCart_no(cart_no);
		   cartservice.Cartdelete(vo);
		  }   
		  result = 1;*/
		
	//return result;
//	}
	

	
	
	
	
	//@RequestMapping(value = "/brandCartList", method = RequestMethod.GET)
	//	public void brandCartList(Model model) {
	//		int m_no = 1;
			
	//		List<BrandCartVO> cartList = cartservice.brandCartList(m_no);
	//		model.addAttribute("cartList", cartList);
		}
		
		
		
		
	





		
		
	
		
		
				// 화면에 사용할 값을 return 값에 넣어줌
	
	//@PostMapping(value="/addCart", produces = {MediaType.APPLICATION_JSON_VALUE})
	//public ResponseEntity<String> addCart(@RequestBody BrandCartVO vo){
		
	//	int insertCount = cartservice.addCart(vo);
		
	//	return insertCount == 1?
	//			new ResponseEntity<String>("success", HttpStatus.OK):
	//				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);

	
