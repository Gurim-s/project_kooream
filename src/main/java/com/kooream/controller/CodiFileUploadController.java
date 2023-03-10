package com.kooream.controller;

import java.io.File;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kooream.domain.CodiImageVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CodiFileUploadController {

	@PostMapping(value = "/codi-uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CodiImageVO>> uploadAjaxPost(MultipartFile[] uploadFile){
		log.info("updata ajax post::::::::::::::::::::::::::");
		
		List<CodiImageVO> list = new ArrayList<>();
		
		log.info(uploadFile.length);
		
		String uploadfolder = "c:\\upload"; // 위치 경로
		
		// make folder 폴더 만들기 
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadfolder, uploadFolderPath);
		log.info("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("===");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			CodiImageVO attachVo = new CodiImageVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name: "+ uploadFileName);
			
			attachVo.setFileName(uploadFileName); // dto에 원본 파일 저장
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			
			try {
				File saveFile = new File(uploadPath,uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachVo.setUuid(uuid.toString());
				attachVo.setUploadPath(uploadFolderPath);
				
				list.add(attachVo);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			
		} // for end
		
		return new ResponseEntity<List<CodiImageVO>>(list, HttpStatus.OK);
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
		
	}
	
	// 썸네일 데이터 전송
	@GetMapping("/codidisplay")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("fileName:" + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		log.info("file"+file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
					header,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
//	@PostMapping("deleteFile")
//	@ResponseBody
//	public ResponseEntity<String> deleteFile(String fileName){
//		log.info("deleteFile:"+ fileName);
//		
//		File file = null;
//		try {
//			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "utf-8"));
//			file.delete();
//		} catch (Exception e) {
//			e.printStackTrace();
//			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
//		}
//		return new ResponseEntity<String>("deleted", HttpStatus.OK);
//	}
	
	
}
