package com.kooream.controller;

import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kooream.domain.AttachFileVO;
import com.kooream.service.RntUpldFileService;
import com.kooream.service.S3Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/rntfile/*")
public class RntUpldFileController {
	@Setter(onMethod_= @Autowired)
	private S3Service s3Service;
	
	@Setter(onMethod_= @Autowired)
	private RntUpldFileService service;
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) // 리턴되는값이 json
	 @ResponseBody
	 public ResponseEntity<List<AttachFileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		 // log.info("updata ajax post...............");
		 // log.info(uploadFile.length);
		 
		 List<AttachFileVO> list = new ArrayList<AttachFileVO>(); 	// 메소드 처음 타면 list 생성됨
		 
		 
		 
//		 String uploadFolder = "C:\\upload";
		 
		 // make folder
		 String uploadFolderPath =  getFolder();
//		 File uploadPath = new File(uploadFolder, uploadFolderPath);
//		 log.info("upload path : " + uploadPath);
		 
//		 if(uploadPath.exists() == false) {
//			 uploadPath.mkdirs();
//		 }
	
		 for(MultipartFile multipartFile : uploadFile) {				// 파일 있는 만큼 for문 돈다
			log.info("-------------------------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
			
			AttachFileVO attachVo = new AttachFileVO();

			String uploadFileName = multipartFile.getOriginalFilename();
			attachVo.setFileName(uploadFileName);	// dto에 파일명(원본) 저장
			
			// uploadFileName : 실제업로드할 파일명(원본)
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); // 내용이 올때 달라붙어있어서 떼려고 사용 
			log.info("only file name : " + uploadFileName);
			
			
			// UUID.randomUUID(); : 업로드하는 파일명을 중복방지를 위해 랜덤값으로 생성함
			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;	// 실제 업로드하는 파일명 앞에 uuid를 붙여줌
			
			
			try {
				// uploadFileName : 원본 파일명 앞에 랜덤값 붙어있음
//				File saveFile = new File(uploadPath, uploadFileName);
//				multipartFile.transferTo(saveFile);

				String s3Path = uploadFolderPath + "/"+ uploadFileName;
				s3Service.uploadAWS(multipartFile, s3Path);
				
				attachVo.setUuid(uuid.toString());
				attachVo.setUploadPath(uploadFolderPath);
				list.add(attachVo);
				service.uploadFile(attachVo);
				
				
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
		 String str = "product" + "-" + sdf.format(date);
		 return str.replace("-", File.separator);					// '-' 기준으로 하위폴더 생성예정  separator : 파일 생성명령어
	 }
	 
	//-----------------------------------------------------------------------------------X 누르면 파일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String getUuid){
		log.info("deleteFile : " + fileName);
			 
		File file = null;
			 
		try {
			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "utf-8"));	// 프론트에서 컨트롤러로 던질때 인코딩해서 던졋으므로 받을때 디코딩으로 받음
			file.delete();
			
			service.removeFile(getUuid);
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	
}
