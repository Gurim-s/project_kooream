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
import com.kooream.domain.PaymentListVO;
import com.kooream.domain.PaymentVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.RntRsvtVO;
import com.kooream.mapper.BrandCartMapper;
import com.kooream.security.UserSession;
import com.kooream.service.BrandCartService;
import com.kooream.service.BrandProductService;
import com.kooream.service.BrandProductUploadService;
import com.kooream.service.PaymentService;
import com.kooream.service.RentalService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Payment/*")
public class PaymentController {
	@Setter(onMethod_ = @Autowired )
	private BrandProductService productService;
	
	@Setter(onMethod_ = @Autowired )
	private PaymentService payservice;
	
	@Setter(onMethod_= @Autowired)
	private RentalService Rntservice;
	

	 
	// 예약페이지에서 결제페이지로 이동
	@GetMapping("/goRnt_paymentPage")
	public String goRnt_paymentPage(RntRsvtVO vo, Model model) {
		ProductVO pvo = new ProductVO();
		pvo.setP_no(vo.getP_no());
		// 상품정보 가져오기
		pvo = Rntservice.viewPrdt(pvo);
		// 이미지 리스트가져오기
		List<AttachFileVO> image_list = Rntservice.getViewImg(pvo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pvo", pvo);
		model.addAttribute("image_list", image_list);
		return "/rental/rnt_paymentPage";
	}

	@Setter(onMethod_ = @Autowired)
	private BrandCartService cartservice;
	
	// 장바구니 또는 구매하기 버튼 누르면 결제 페이지로 이동
	@Secured({"ROLE_USER"})	// 로그인한 사람들만 페이지 이동가능
	@GetMapping("/payment") 
	public String view(@RequestParam List<Integer> p_noList, Model model) {
		List<ProductVO> productList = new ArrayList<>();
		for (Integer p_no : p_noList) {
			ProductVO product = new ProductVO();
			product.setP_no(p_no);
			
			productList.add(productService.get(product));
		}
		
		model.addAttribute("productList", productList);
		return "brandshop/shop_paymentPage";
	}
	 
	// 결제하기 컨트롤러(결제 후 db에 저장하기) 
	@PostMapping("/addpayment")
	public String addPayment(PaymentListVO list, RedirectAttributes rttr) {
		
		MemberVO userSession = new UserSession().getSession();	//
		int mno = userSession.getM_no();
		
		for(int i=0; i<list.getPaymentList().size(); i++) {		// List안에 들어있는 길이만큼(결제 할때 상품 길이만큼) for문 돌면서
			log.info("----" + list.getPaymentList().get(i).getP_no());
			log.info("----" + list.getPaymentList().get(i).getPay_price());
			log.info("----" + list.getPaymentList().get(i).getM_adress());
			
			list.getPaymentList().get(i).setM_no(mno);	// m_no값이랑 for문 같이 돌기	
			// PaymentListVO안에 PaymentVO안에 m_no가지고 오기
		}
		
		int result = payservice.addPayment(list);
		rttr.addFlashAttribute("result", "ok");
		cartservice.CartdeleteAll(mno);
		return "redirect:/Payment/checkpayment";		// checkpayment 컨트롤러로 이동
	}
	

	// 결제 후 주문내역(마이페이지) 페이지로 이동
	@Secured({"ROLE_USER"})
	@GetMapping("/checkpayment")
	public String checkpayment(PaymentVO model) {
		
		 MemberVO userSession = new UserSession().getSession();		// 이거 고치라고 하셨는데,,,,
		 
		 if(userSession != null) { 
			 model.setM_no(userSession.getM_no()); // 회원번호 불러오기
		 }
		 	 	
		return "/brandshop/checkpayment";	// 마이페이지로 이동
	}
	
	// 주문페이지 리스트 보기
	@GetMapping("/paymentList")
	@ResponseBody public ResponseEntity<List<PaymentVO>> paymentList(PaymentVO vo){
		int m_no = 0;
		MemberVO userSession = new UserSession().getSession();
		if(userSession != null) {
			 m_no = userSession.getM_no(); // 회원번호 불러오기
			
		}
		//int m_no = userSession.getM_no();
/*			if(userSession != null) {
				m_no = userSession.getM_no(); // 회원번호 불러오기
			}*/	
			log.info(m_no + "엥 리스트 나와라");
		return new ResponseEntity<List<PaymentVO>>(payservice.paymentList(m_no),HttpStatus.OK);
	  }
	 	
	
	  // 주문내역 리스트 이미지 보기
	  
	@GetMapping(value ="/paymentgetAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody public ResponseEntity<List<AttachFileVO>> paymentgetAttachList(int p_no){ 
		log.info("CartgetAttachList....." + p_no); 
	return new ResponseEntity<List<AttachFileVO>>(payservice.paymentgetAttachList(p_no),HttpStatus.OK); 
	}
	
	 //주문내역 삭제 
	
	  @PostMapping(value = "/paymentdelete", produces =MediaType.APPLICATION_JSON_UTF8_VALUE)
	  @ResponseBody public int paymentdelete(PaymentVO vo) {
	  int result = payservice.paymentdelete(vo);
	  return result; 
	  }



}

	
