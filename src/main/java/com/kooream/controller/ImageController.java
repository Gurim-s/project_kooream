package com.kooream.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.util.IOUtils;
import com.kooream.domain.StyleImageVO;
import com.kooream.service.S3Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class ImageController {
	private S3Service s3Service;
	
	@PostMapping(value = "/uploadImageAWS/{folderName}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<StyleImageVO>> uploadStyleImageAWS(@PathVariable("folderName") String folderName, MultipartFile[] uploadFile) {
		log.info("upload style Image...");
		List<StyleImageVO> list = new ArrayList<StyleImageVO>();
		
		//make folder
		String uploadFolderPath = getFoler(folderName);
		
		for (int i=0; i<uploadFile.length; i++) {
			MultipartFile image = uploadFile[i];
			log.info("--------------------------");
			log.info("upload File Name : " + image.getOriginalFilename());
			log.info("upload File Size : " + image.getSize());
			
			StyleImageVO imageVO = new StyleImageVO();
			
			String uploadFileName = image.getOriginalFilename();
			imageVO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name : " + uploadFileName);
			
			try {
				String s3Path = uploadFolderPath + "/"+ uploadFileName;
				s3Service.uploadAWS(image, s3Path);
				
				String thumbs3Path = "";
				if (i == 0) {
					switch (folderName) {
					case "style":
						thumbs3Path = uploadFolderPath + "/s_" + uploadFileName;
						s3Service.uploadThumbFile(image, thumbs3Path, 280, 350);
						break;
					case "product":
						thumbs3Path = uploadFolderPath + "/s_" + uploadFileName;
						s3Service.uploadThumbFile(image, thumbs3Path, 220, 220);
						
						thumbs3Path = uploadFolderPath + "/xs_" + uploadFileName;
						s3Service.uploadThumbFile(image, thumbs3Path, 100, 100);
						
						thumbs3Path = uploadFolderPath + "/xxs_" + uploadFileName;
						s3Service.uploadThumbFile(image, thumbs3Path, 40, 40);
						break;
					case "member":
						thumbs3Path = uploadFolderPath + "/s_" + uploadFileName;
						s3Service.uploadThumbFile(image, thumbs3Path, 40, 40);
						break;
					}
				}
				
				imageVO.setUuid(uuid.toString());
				imageVO.setUploadPath(uploadFolderPath);
				list.add(imageVO);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		
		return new ResponseEntity<List<StyleImageVO>>(list, HttpStatus.OK);
	}
	
	private String getFoler(String folderName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = folderName + "-" + sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	@GetMapping("/displayImage")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
	  log.info("fileName: "+ fileName);
	  ResponseEntity<byte[]> result = null;
	  try {
	    HttpHeaders header = new HttpHeaders();

	    URL url = new URL(s3Service.getFileURL(fileName));
	    System.out.println(url.toString());
	    HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
	    InputStream fileIS = urlConn.getInputStream();

	    header.add("Content-Type", URLConnection.guessContentTypeFromStream(fileIS));
	    
	    result = new ResponseEntity<>(IOUtils.toByteArray(fileIS), header, HttpStatus.OK);
	  
	  } catch(IOException e) {
	  	log.info("wrong file path");
	  }
	  return result;
	}
}