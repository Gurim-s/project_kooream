package com.kooream.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kooream.domain.StyleImageVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class StyleImageController {

	@PostMapping(value = "/uploadStyleImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<StyleImageVO>> uploadStyleImagePost(MultipartFile[] uploadFile) {
		log.info("upload style Image...");
		List<StyleImageVO> list = new ArrayList<StyleImageVO>();
		
		String uploadFolder = "C:\\upload";
		
		//make folder
		String uploadFolderPath = getFoler();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
			
			StyleImageVO imageVO = new StyleImageVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			imageVO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name : " + uploadFileName);
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				imageVO.setUuid(uuid.toString());
				imageVO.setUploadPath(uploadFolderPath);
				list.add(imageVO);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		
		return new ResponseEntity<List<StyleImageVO>>(list, HttpStatus.OK);
	}
	
	private String getFoler() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = "style-" + sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	
	@GetMapping("/displayStyleImage")
	@ResponseBody
	public ResponseEntity<byte[]> getImage(String fileName) {
		log.info("fileName: " + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
