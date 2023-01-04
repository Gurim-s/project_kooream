package com.kooream.controller;

import java.io.File;
import java.net.URLDecoder;
import java.security.Provider.Service;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandProductVO;
import com.kooream.service.BrandProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j

public class BrandProductUploadController {
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		/*
		 * MultipartFile의 메소드
		 * String getName()					- 파라미터 이름 <input> 태그의 이름
		 * String getOriginalFileName()		- 업로드 파일의 이름
		 * boolean isEmpty()				- 파일이 존재하지 않는 경우 true
		 * long getSize()					- 업로드 파일의 크기
		 * byte[] getBytes()				- byte[]로 파일 데이터 변환
		 * InputStream getInputStream()		- 파일 데이터와 연결된 InputStream 반환
		 * transforTo(File file)			- 파일 저장
		 * 
		 */
		
		String uploadFolder = "C:\\upload";
		

		for(MultipartFile multipartFile : uploadFile) {
			log.info("----------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());		// 파일이름
			log.info("upload File Size : " + multipartFile.getSize());					// 파일사이즈
		
		File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());	// 파일저장 위치에 해당 파일이름으로 만들겠다
		
		try {
			multipartFile.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		}
	}
	
	
	@GetMapping("/uploadAjax")
	public String uploadAjax() {
		log.info("upload Ajax");
		return "/uploadAjax";
	}
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
    public ResponseEntity<List<AttachFileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
       log.info("updata ajax post...............");
       
       List<AttachFileVO> list = new ArrayList<AttachFileVO>();	// 메소드를 처음타면 list를 만들게되고
       
		String uploadFolder = "C:\\upload";
		
		// make folder
		String uploadFolderPath = getFolder();	// 변수로 따로 뺌 (getFolder())
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path : " + uploadPath);
			
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
				
		for(MultipartFile multipartFile : uploadFile) {			// 파일의 갯수만큼 for문탄다
			log.info("----------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());	// 파일이름
			log.info("upload File Size : " + multipartFile.getSize());				// 파일사이즈
			
			AttachFileVO attachVO = new AttachFileVO();
			
			
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);	// uploadFileName 원본 파일이름
			log.info("only file name :" + uploadFileName);
			
			attachVO.setFileName(uploadFileName);		// dto에 파일명(원본) 저장
			
			UUID uuid = UUID.randomUUID();		// 중복을 제거하기위해 랜덤값생성 
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;	//  랜덤값 + "_" + 원래파일명 => 파일명(최종이름)
			
		
			try {
				File saveFile = new File(uploadPath, uploadFileName);	// 파일저장 위치에 해당 파일이름으로 만들겠다
				multipartFile.transferTo(saveFile);
				
				attachVO.setUuid(uuid.toString());		// Dto에 또 저장
				attachVO.setUploadPath(uploadFolderPath);
				
				list.add(attachVO);	// for문도는 만큼 리스트에 추가
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}// end for
		
		return new ResponseEntity<List<AttachFileVO>>(list, HttpStatus.OK);
	}
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	// 년월일 폴더생성
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	@PostMapping("deleteFile") // aJax.jsp만들고 컨트롤러로 넘어옴
	@ResponseBody
	public  ResponseEntity<String> deleteFile(String fileName){
		log.info("deleteFile :" + fileName);
		
		File file = null;
		
		try {
			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "utf-8"));		// uploadAjax에서 인코딩(던졌고)하고 받는쪽에서는 디코딩한다  // 정보를 숨긴다(?)
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	



  }
  
 