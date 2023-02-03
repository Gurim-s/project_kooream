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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.SizeVO;
import com.kooream.service.BrandProductService;
import com.kooream.service.BrandProductUploadService;
import com.kooream.service.SizeService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Size/*")
public class SizeController {
	
	
	@Setter(onMethod_= @Autowired)
	private SizeService service;
	
	
	// for문을 돌려야 할꺼같은데,,,
     @PostMapping("/Sizeadd") 
     public String Sizeadd(SizeVO vo) {
    	 service.addSize(vo);
    	 
    	 return "redirect:/brandshop/view";
     }
     
     List<SizeVO> list = new ArrayList<SizeVO>();

		/*
		 * // for문을 돌려야 할꺼같은데,,,
		 * 
		 * @PostMapping("/Sizeadd") public String Sizeadd(@RequestParam List<String> vo
		 * ) { for(String c : vo ) { service.addSize(vo); } }
		 */


} 


//    @PostMapping("/Sizeadd") public String insertDate(SizeVO vo) {
//   log.info( "나아아알짜 입력 시작!! : " + vo);
 
//    service.addSize(vo);
 
//    return "redirect:/main/main"; 
//    }
	
//	@PostMapping(value = "/sizeadd", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	//@PostMapping("/sizeadd")
//	public ResponseEntity<List<SizeVO>> sizeadd(@RequestParam(value = "chArr[]") List<String> chArr, SizeVO vo ) {
		 // log.info("updata ajax post...............");
		 // log.info(uploadFile.length);
		 
		
//		for(String i : chArr) {
//			service.addSize(vo);
//		}
		
//		 List<SizeVO> list = new ArrayList<SizeVO>(); 	// 메소드 처음 타면 list 생성됨
		 
		 
		 // make folder
		 


//		 return new ResponseEntity<List<SizeVO>>(list, HttpStatus.OK);
		 
		 


	 
	//-----------------------------------------------------------------------------------X 누르면 파일 삭제
//	@PostMapping("deleteFile")
//	@ResponseBody
//	public ResponseEntity<String> deleteFile(String fileName){
//		log.info("deleteFile : " + fileName);
			 
//		File file = null;
			 
//		try {
//			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "utf-8"));	// 프론트에서 컨트롤러로 던질때 인코딩해서 던졋으므로 받을때 디코딩으로 받음
//			file.delete();
			
//			service.removeFile(fileName);	// 파일 삭제 만들어야함
			
//		} catch (Exception e) {
//			e.printStackTrace();
//			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
//		}
//		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	//-----------------------------------------------------------------------------썸네일

	  
	  

	 
	
	
	
