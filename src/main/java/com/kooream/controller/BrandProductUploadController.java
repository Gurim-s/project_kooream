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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.AttachFileVO;

import com.kooream.service.BrandProductService;
import com.kooream.service.BrandProductUploadService;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/brandfile/*")
public class BrandProductUploadController {
	
	
	@Setter(onMethod_= @Autowired)
	private BrandProductUploadService service;
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) // 리턴되는값이 json
	 @ResponseBody
	 public ResponseEntity<List<AttachFileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		 // log.info("updata ajax post...............");
		 // log.info(uploadFile.length);
		 
		 List<AttachFileVO> list = new ArrayList<AttachFileVO>(); 	// 메소드 처음 타면 list 생성됨
		 
		 
		 
		 String uploadFolder = "C:\\upload";
		 
		 // make folder
		 String uploadFolderPath =  getFolder();
		 File uploadPath = new File(uploadFolder, uploadFolderPath);
		 log.info("upload path : " + uploadPath);
		 
		 if(uploadPath.exists() == false) {
			 uploadPath.mkdirs();
		 }
	
		 for(MultipartFile multipartFile : uploadFile) {				// 파일 있는 만큼 for문 돈다
			log.info("-------------------------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
			
			AttachFileVO attachVo = new AttachFileVO();

			String uploadFileName = multipartFile.getOriginalFilename();
			
			// uploadFileName : 실제업로드할 파일명(원본)
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); // 내용이 올때 달라붙어있어서 떼려고 사용 
			log.info("only file name : " + uploadFileName);
			
			attachVo.setFileName(uploadFileName);	// dto에 파일명(원본) 저장
			
			// UUID.randomUUID(); : 업로드하는 파일명을 중복방지를 위해 랜덤값으로 생성함
			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;	// 실제 업로드하는 파일명 앞에 uuid를 붙여줌
			
			
			try {
				// uploadFileName : 원본 파일명 앞에 랜덤값 붙어있음
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachVo.setUuid(uuid.toString());
				attachVo.setUploadPath(uploadFolderPath);
				
				list.add(attachVo);
				
				/* service.uploadFile(attachVo); p_no값이 0이 들어감 => insert가 2번된다*/
				
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		 } // end for
		 
		 return new ResponseEntity<List<AttachFileVO>>(list, HttpStatus.OK);
		 
		 
	 }
	//---------------------------------------------------------------- 업로드 하는 파일 폴더 생성
	 private String getFolder() {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	// 년, 월, 일로 폴더 생성
		 Date date = new Date();
		 String str = sdf.format(date);
		 return str.replace("-", File.separator);					// '-' 기준으로 하위폴더 생성예정  separator : 파일 생성명령어
	 }
	 
	//-----------------------------------------------------------------------------------X 누르면 파일 삭제
	@PostMapping("deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("deleteFile : " + fileName);
			 
		File file = null;
			 
		try {
			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "utf-8"));	// 프론트에서 컨트롤러로 던질때 인코딩해서 던졋으므로 받을때 디코딩으로 받음
			file.delete();
			
			service.removeFile(fileName);	// 파일 삭제 만들어야함
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	//-----------------------------------------------------------------------------썸네일
	
	  @GetMapping("/display")
	  @ResponseBody 
	  
	  public ResponseEntity<byte[]> getFile(String fileName){
	  log.info("fileName : " + fileName); 
	  
	  File file = new File("c:\\upload\\" + fileName); 
	  log.info("file :" + file);
	
	  ResponseEntity<byte[]> result = null;
	  
	  try {
		  HttpHeaders header = new HttpHeaders();
		  
		  header.add("Content-Type", Files.probeContentType(file.toPath()));
		  result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
				  header, HttpStatus.OK);
		
	} catch (IOException e) {
		e.printStackTrace();
	}
	 return result;
	  
	  
	  
	  }
	 
	
	
	
}